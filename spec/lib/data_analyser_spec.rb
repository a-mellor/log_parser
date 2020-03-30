require 'data_analyser'

RSpec.describe DataAnalyser do
  subject { described_class.new(file) }
  let(:file) { './spec/fixtures/valid.log' }

  describe '#valid?' do
    context 'when valid' do
      it 'returns true' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'when invalid' do
      let(:file) { 'invalid_file.pdf' }

      it 'raies an error' do
        expect { subject.valid? }
          .to raise_error(described_class::InvalidFileError,
                          ".pdf is not vaild, please prodive #{described_class::ACCEPTED_FILES.join(',')} file")
      end
    end
  end

  describe '#parse' do
    let(:parser_stub) { instance_double(LogParser) }

    before do
      allow(LogParser).to receive(:new).with(file).and_return(parser_stub)
      allow(parser_stub).to receive(:execute)
    end

    context 'when provided with a valid file' do
      it 'returns the parsed data' do
        subject.parse(file)

        expect(parser_stub).to have_received(:execute)
      end
    end
  end
end

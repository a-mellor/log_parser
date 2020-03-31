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
                          '.pdf is not vaild, please prodive '\
                          "#{described_class::ACCEPTED_FILES.join(',')} file")
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
      it 'calls LogParser#execute' do
        subject.parse

        expect(parser_stub).to have_received(:execute)
      end
    end
  end

  describe '#most_page_views' do
    let(:formatter_stub) { instance_double(Formatter) }
    let(:parsed_data) { subject.parse }

    before do
      allow(Formatter).to receive(:new).with(parsed_data).and_return(formatter_stub)
      allow(formatter_stub).to receive(:sort_by_most_page_views)
    end

    it 'calls Formatter#sort_by_most_page_views' do
      subject.most_page_views

      expect(formatter_stub).to have_received(:sort_by_most_page_views)
    end
  end

  describe '#unique_page_views' do
    let(:formatter_stub) { instance_double(Formatter) }
    let(:parsed_data) { subject.parse }

    before do
      allow(Formatter).to receive(:new).with(parsed_data).and_return(formatter_stub)
      allow(formatter_stub).to receive(:sort_by_unique_page_views)
    end

    it 'calls Formatter#sort_by_unique_page_views' do
      subject.unique_page_views

      expect(formatter_stub).to have_received(:sort_by_unique_page_views)
    end
  end
end

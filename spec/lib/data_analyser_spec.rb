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
end

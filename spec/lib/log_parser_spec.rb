require 'log_parser'

RSpec.describe LogParser do
  subject { described_class.new(file) }
  let(:file) { './spec/fixtures/valid.log' }

  describe '#execute' do
    context 'when file is empty' do
      let(:file) { './spec/fixtures/empty.log' }

      it 'raises an error' do
        expect { subject.execute }
          .to raise_error(described_class::NoDataError, 'The file provided is empty')
      end
    end

    context 'when file is valid' do
      it 'returns parsed data' do
        expect(subject.execute).to eq(
          { '/home' => ['111.222.333.444', '123.333.222.111'],
            '/about/2' => ['222.333.444.555', '333.444.555.444', '222.333.444.555'],
            '/help/3' => ['444.455.666.555', '666.455.666.555'],
            '/contact' => ['111.555.333.222'] }
        )
      end
    end
  end
end

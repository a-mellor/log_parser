require 'formatter'

RSpec.describe Formatter do
  subject { described_class.new(data) }
  let(:data) do
    { '/home': ['1.1.1.1', '2.3.2.3'],
      '/about': ['3.3.3.3', '1.2.1.1', '3.4.4.4'],
      '/user/2': ['4.3.3.3'],
      '/contact': ['4.5.6.6'] }
  end

  describe '#sort_by_most_page_views' do
    it 'returns most page views ordered from most pages views to less page views' do
      expect(subject.sort_by_most_page_views)
        .to eq([[:"/about", ['3.3.3.3', '1.2.1.1', '3.4.4.4']],
                [:"/home", ['1.1.1.1', '2.3.2.3']],
                [:"/contact", ['4.5.6.6']],
                [:"/user/2", ['4.3.3.3']]])
    end
  end
end

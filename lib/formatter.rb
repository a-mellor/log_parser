class Formatter
  def initialize(data)
    @data = data
  end

  def sort_by_most_page_views
    data.sort_by { |_, ip_address| ip_address.length }.reverse
  end

  def sort_by_unique_page_views

  end

  private

  attr_reader :data
end

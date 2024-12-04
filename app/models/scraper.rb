require "net/http"
require "nokogiri"

class Scraper
  attr_reader :document

  # Initialize with a URL and parse the HTML
  def initialize(url)
    response = Net::HTTP.get(URI(url))
    @document = Nokogiri::HTML(response)
  end

  # Extract text content from the first element matching the selector
  def text(selector:)
    element = document.at_css(selector)
    element ? element.text.strip : nil
  end

  # Check if an element matching the selector is present
  def present?(selector:)
    document.at_css(selector).present?
  end
end

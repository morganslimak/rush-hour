require 'uri'

module UriParser
  def self.parser(url)
    URI(url).path
  end

end

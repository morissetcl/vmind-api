class CreateVerse
  attr_reader :link, :need, :theme

  def initialize(args)
    @link = args[:link]
    @need = args[:need]
    @theme = args[:theme]
  end

  def create_verse
    html_file = URI.parse(link).open
    html_doc = Nokogiri::HTML(html_file)
    html_doc.css('.content-box-1').each do |verse|
      verse_number = verse.css('a')[0].text
      Verse.where(name: verse_number).first_or_create do |v|
        v.content = verse.css('.result-wrap').text.strip
        v.need = need
        v.theme = theme
      end
    end
  end
end

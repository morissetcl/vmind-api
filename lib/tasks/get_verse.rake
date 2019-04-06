# frozen_string_literal: true

namespace :scrap do
  desc 'scrap verse'
  task bible_amour_parent: :environment do
    topic = ['Amour-Parental', 'Enfants,-Amour-Des-Parents', 'Prendre-Soin-Des-Parents', 'Enfants,-Besoins-De']
    topic.each do |t|
      link = "https://bible.knowing-jesus.com/Fran%C3%A7ais/topics/#{t}"
      html_file = URI.parse(link).open
      html_doc = Nokogiri::HTML(html_file)

      html_doc.css('.content-box-1').each do |verse|
        verse_number = verse.css('a')[0].text
        Verse.where(name: verse_number).first_or_create do |v|
          v.content = verse.css('.result-wrap').text.strip
          v.need = 'Love'
          v.theme = 'Parent'
        end
      end
    end
  end
end

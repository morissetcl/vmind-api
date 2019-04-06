# frozen_string_literal: true

namespace :scrap do
  desc 'scrap verse'

  task get_bible_verse: :environment do
    bible_amour_parent
    bible_amour_conjoint
    bible_amour_seigneur
    bible_amour_fraternel
    bible_pardon_peche
    bible_pardon_distant
  end

  def bible_amour_parent
    puts 'bible_amour_parent'
    topic = ['Amour-Parental', 'Enfants,-Amour-Des-Parents', 'Prendre-Soin-Des-Parents', 'Enfants,-Besoins-De']
    topic.each do |t|
      link = "https://bible.knowing-jesus.com/Fran%C3%A7ais/topics/#{t}"
      html_file = URI.parse(link).open
      html_doc = Nokogiri::HTML(html_file)
      create_verse(html_doc: html_doc, need: 'Love', theme: 'Parent')
    end
  end

  def bible_amour_conjoint
    puts 'bible_amour_conjoint'
    topic = ['Devoir-Des-Maris-Envers-Les-Epouses', 'Etre-Un-Mari', 'Mariage,-Le-Marie', 'Enfants,-Besoins-De']
    topic.each do |t|
      link = "https://bible.knowing-jesus.com/Fran%C3%A7ais/topics/#{t}"
      html_file = URI.parse(link).open
      html_doc = Nokogiri::HTML(html_file)
      create_verse(html_doc: html_doc, need: 'Love', theme: 'Partner')
    end
  end

  def bible_amour_seigneur
    puts 'bible_amour_seigneur'
    topic = ['Avoir-Confiance-En-L~amour-De-Dieu', 'Amour-Bienveillant-De-Dieu', 'Dieu-Montre-L~amour-Bienveillant',  'Jesus-Christ,-Amour-De']
    topic.each do |t|
      link = "https://bible.knowing-jesus.com/Fran%C3%A7ais/topics/#{t}"
      html_file = URI.parse(link).open
      html_doc = Nokogiri::HTML(html_file)
      create_verse(html_doc: html_doc, need: 'Love', theme: 'Lord')
    end
  end

  def bible_amour_fraternel
    puts 'bible_amour_fraternel'
    topic = ['Bonte-Fraternelle', 'Amour-Fraternel']
    topic.each do |t|
      link = "https://bible.knowing-jesus.com/Fran%C3%A7ais/topics/#{t}"
      html_file = URI.parse(link).open
      html_doc = Nokogiri::HTML(html_file)
      create_verse(html_doc: html_doc, need: 'Love', theme: 'Friends')
    end
  end

  def bible_pardon_peche
    puts 'bible_pardon_peche'
    topic = ['Pardon-Des-Peches', 'Pardon-Par-Le-Repentir', 'Pardon,-Divin', 'Pardon,-Dans-Le-Ministere-Du-Christ', 'Dieu-A-Pardonne']
    topic.each do |t|
      link = "https://bible.knowing-jesus.com/Fran%C3%A7ais/topics/#{t}"
      html_file = URI.parse(link).open
      html_doc = Nokogiri::HTML(html_file)
      create_verse(html_doc: html_doc, need: 'Forgiveness', theme: 'Sin')
    end
  end

  def bible_pardon_distant
    puts 'bible_pardon_distant'
    topic = ['Pardonner-Aux-Autres', 'Pardonner-Aux-Ennemis', 'Se-Pardonner-Les-Uns-Les-Autres']
    topic.each do |t|
      link = "https://bible.knowing-jesus.com/Fran%C3%A7ais/topics/#{t}"
      html_file = URI.parse(link).open
      html_doc = Nokogiri::HTML(html_file)
      create_verse(html_doc: html_doc, need: 'Forgiveness', theme: 'Distant')
    end
  end

  def create_verse(args)
    args[:html_doc].css('.content-box-1').each do |verse|
      verse_number = verse.css('a')[0].text
      puts verse_number
      Verse.where(name: verse_number).first_or_create do |v|
        v.content = verse.css('.result-wrap').text.strip
        v.need = args[:need]
        v.theme = args[:theme]
      end
    end
  end

end

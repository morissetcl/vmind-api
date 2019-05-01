require 'rails_helper'
require_relative '../../lib/create_verse.rb'

describe "parser" do
  let!(:link) { "https://bible.knowing-jesus.com/Fran%C3%A7ais/topics/Amour-Parental" }

  it "needs a url to initialize" do
    html_doc = Nokogiri::HTML(html_doc)
    expect do
      CreateVerse.new(link: link, need: 'Faith', theme: 'Parent').create_verse
    end.to change(Verse, :count)
  end
end

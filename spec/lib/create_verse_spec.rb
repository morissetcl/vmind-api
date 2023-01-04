require 'rails_helper'

describe 'Create Verse' do
  let!(:link) { 'https://bible.knowing-jesus.com/Fran%C3%A7ais/topics/Amour-Parental' }

  it do
    expect do
      CreateVerse.new(link: link, need: 'Faith', theme: 'Parent').create_verse
    end.to change(Verse, :count)
  end
end

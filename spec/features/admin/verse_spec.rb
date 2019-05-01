require 'rails_helper'

describe 'Admin - Verse', type: :feature do
  before(:each) { log_in_utilisateur }
  subject! { create :verse }

  scenario 'Index' do
    visit admin_verses_path
    expect(page).to have_content "Faith"
    expect(page).to have_content 'Exode 2:3'
  end

  scenario 'Show' do
    visit admin_verse_path subject
    expect(page).to have_content "Verse Details"
    expect(page).to have_content "Faith"
  end

  scenario 'Create' do
    visit new_admin_verse_path
    expect do
      select 'Love'
      fill_in :verse_theme, with: 'Friend'
      fill_in :verse_name, with: 'Genese 2:10'
      fill_in :verse_content, with: 'password'
      click_on 'Create Verse'
    end.to change(Verse, :count)
    expect(Verse.last.reload.name).to eq 'Genese 2:10'
  end
end

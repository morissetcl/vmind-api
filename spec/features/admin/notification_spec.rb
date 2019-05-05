require 'rails_helper'

describe 'Admin - Notification', type: :feature do
  before(:each) { log_in_utilisateur }
  subject! { create :notification }

  scenario 'Notification' do
    visit admin_notifications_path
    expect(page).to have_content '2 Samuel 7'
  end

  scenario 'Show' do
    visit admin_notification_path subject
    expect(page).to have_content '2 Samuel 7'
    expect(page).to have_content subject.body
  end

  scenario 'Create' do
    visit new_admin_notification_path
    expect do
      fill_in :notification_title, with: 'Love'
      fill_in :notification_body, with: 'Soyez bénis'
      click_on 'Create Notification'
    end.to change(Notification, :count)
  end
end

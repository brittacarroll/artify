require 'rails_helper'

feature "upon visiting welcome page, a user gets redirected to right page" do
  michael = FactoryGirl.create(:artist)
  gallery = FactoryGirl.create(:gallery)

  scenario "artist visits welcome page and is successfully redirected" do
    visit '/'
    click_on 'Artist'
    expect(page.current_path).to eq new_artist_registration_path
    expect(page).to have_content "Sign up"
  end

  scenario "gallery visit welcome page and is succesffully redirected" do
    visit '/'
    click_on 'Gallery'
    expect(page.current_path).to eq new_gallery_registration_path
    expect(page).to have_content "Sign up"
  end
end

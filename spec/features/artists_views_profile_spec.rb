require 'rails_helper'

feature "artist views profile" do
  let(:artist) { FactoryGirl.create(:artist) }

  scenario "artist can view their own profile" do
    visit "/"
    click_on "artist_sign_in"

    user_signs_in(artist)
    click_on "My Profile"

    expect(page).to have_content artist.first_name
    expect(page).to have_content artist.last_name
  end

  scenario "artist can update their profile" do
    visit "/"
    click_on "artist_sign_in"

    user_signs_in(artist)
    click_on "My Profile"

    click_on "Edit profile"

    expect(page).to have_content("Current password")
  end
end

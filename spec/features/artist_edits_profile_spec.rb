require 'rails_helper'

feature "artist updates her profile" do
  let(:artist) { FactoryGirl.create(:artist) }
  scenario "artist sees profile and is able to update" do
    visit "/"
    click_on "artist_sign_in"

    user_signs_in(artist)
    click_on "My Profile"

    click_on "Add a profile picture and edit bio"

    fill_in "About Me", with: "I am an artist"
    click_button "Update Artists profile"

    expect(page).to have_content artist.first_name
    expect(page).to have_content artist.last_name
    expect(page).to have_content "Profile was successfully updated."
  end

  scenario "artist deleted her account" do
    visit "/"
    click_on "artist_sign_in"

    user_signs_in(artist)
    click_on "My Profile"

    click_on "Edit profile"
    click_button "Cancel my account"

    expect(page.current_path).to eq root_path
    expect(page).to have_content "We hope to see you again soon."
  end
end

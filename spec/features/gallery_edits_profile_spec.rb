require 'rails_helper'

feature "gallery updates its profile" do
  let(:gallery) { FactoryGirl.create(:gallery) }
  scenario "gallery sees profile and is able to update" do
    visit "/"
    click_on "gallery_sign_in"

    user_signs_in(gallery)
    click_on "Gallery Profile"

    click_on "Add a gallery profile picture"

    fill_in "Gallery description", with: "Beautiful"
    click_button "Update Gallery profile"

    expect(page).to have_content gallery.name
    expect(page).to have_content "Profile was successfully updated."
  end

  scenario "gallery deleted its account" do
    visit "/"
    click_on "gallery_sign_in"

    user_signs_in(gallery)
    click_on "Gallery Profile"

    click_on "Edit profile"
    click_button "Cancel gallery account"

    expect(page.current_path).to eq root_path
    expect(page).to have_content "We hope to see you again soon."
  end
end

require 'rails_helper'

feature "user sees profile and able to delete account" do
   let(:lisa) do
     FactoryGirl.create(:artist)
   end

   let(:gallery) do
     FactoryGirl.create(:gallery)
   end

  scenario "artist deletes account" do
    visit "/"
    click_link "artist_sign_in"

    user_signs_in(lisa)

    click_on "My Profile"

    click_on "Edit profile"
    click_on "Cancel my account"

    expect(page).to have_content "Your account has been successfully cancelled."
  end

  scenario "gallery deletes account" do
    visit "/"
    click_link "gallery_sign_in"

    user_signs_in(gallery)

    click_on "Gallery Profile"

    click_on "Edit profile"
    click_on "Cancel gallery account"

    expect(page).to have_content "Your account has been successfully cancelled."
  end
end

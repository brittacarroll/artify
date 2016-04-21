require 'rails_helper'

feature "gallery views profile" do
  let(:gallery) { FactoryGirl.create(:gallery) }

  scenario "gallery can view their own profile" do
    visit "/"
    click_on "gallery_sign_in"

    user_signs_in(gallery)
    click_on "Gallery Profile"

    expect(page).to have_content gallery.name
    expect(page).to have_content gallery.representative_name
  end

  scenario "gallery can update their profile" do
    visit "/"
    click_on "gallery_sign_in"

    user_signs_in(gallery)
    click_on "Gallery Profile"

    click_on "Edit profile"

    expect(page).to have_content("Current password")
  end
end

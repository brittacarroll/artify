require 'rails_helper'

feature "gallery authentication" do
  gallery = FactoryGirl.create(:gallery)

  let(:gallery1) do
    FactoryGirl.create(:gallery)
  end

  scenario "successful sign up" do
    visit '/galleries/sign_up'
    fill_in "Name", with: gallery.name
    fill_in "Representative name", with: gallery.representative_name
    fill_in "Email", with: gallery.email
    fill_in "Password", with: gallery.password
    fill_in "Password confirmation", with: gallery.password

    click_button "Sign up"

    expect(page).to have_content "You have signed up successfully"
  end

  scenario "unsuccessful sign up" do
    visit '/galleries/sign_up'
    fill_in "Name", with: gallery.name
    fill_in "Password", with: gallery.password
    fill_in "Password confirmation", with: gallery.password

    click_button "Sign up"

    expect(page).to have_content("Email can't be blank")
  end

  scenario "successful sign in" do
    visit 'galleries/sign_in'
    fill_in "Email", with: gallery1.email
    fill_in "Password", with: gallery1.password
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
  end

  scenario "unsuccessfully sign-in with incorrect data" do
    visit 'galleries/sign_in'
    fill_in "Email", with: gallery1.email
    click_button "Log in"

    expect(page).to have_content "Invalid email or password."
  end

  scenario "successful sign out" do
    visit 'galleries/sign_in'
    fill_in "Email", with: gallery1.email
    fill_in "Password", with: gallery1.password
    click_button "Log in"
    visit '/'
    click_link "Log Out"

    expect(page).to have_content "Signed out successfully."
  end
end

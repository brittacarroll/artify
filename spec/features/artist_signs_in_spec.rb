require 'rails_helper'

feature "artist authentication" do
  lisa = FactoryGirl.create(:artist)
  let(:david) do
    FactoryGirl.create(:artist)
  end

  scenario "successful sign up" do
    visit '/artists/sign_up'
    fill_in "First name", with: lisa.first_name
    fill_in "Last name", with: lisa.last_name
    select lisa.role, from: "artist_role"
    fill_in "Email", with: lisa.email
    fill_in "Password", with: lisa.password
    fill_in "Password confirmation", with: lisa.password

    click_button "Sign up"

    expect(page).to have_content "You have signed up successfully"
  end

  scenario "unsuccessful sign up" do
    visit '/artists/sign_up'
    fill_in "First name", with: lisa.first_name
    fill_in "Last name", with: lisa.last_name
    select lisa.role, from: "artist_role"
    fill_in "Password", with: lisa.password
    fill_in "Password confirmation", with: lisa.password

    click_button "Sign up"

    expect(page).to have_content("Email can't be blank")
  end

  scenario "successful sign in" do
    visit 'artists/sign_in'
    fill_in "Email", with: david.email
    fill_in "Password", with: david.password
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
  end

  scenario "unsuccessfully sign-in with incorrect data" do
    visit 'artists/sign_in'
    fill_in "Email", with: david.email
    click_button "Log in"

    expect(page).to have_content "Invalid email or password."
  end

  scenario "successful sign out" do
    visit 'artists/sign_in'
    fill_in "Email", with: david.email
    fill_in "Password", with: david.password
    click_button "Log in"
    visit '/'
    click_link "Log Out"

    expect(page).to have_content "Signed out successfully."
  end
end

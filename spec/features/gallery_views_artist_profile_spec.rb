require 'rails_helper'

feature "gallery sees artists' profile" do
  let(:gallery) { FactoryGirl.create(:gallery) }


  scenario "gallery signs in sees link to uploaded art" do
    visit "/"
    click_on "gallery_sign_in"

    user_signs_in(gallery)
    click_on "Recently uploaded art"

    expect(page.current_path).to eq artists_path
    expect(page).to have_content "Recently uploaded artwork"
  end

  scenario "gallery cannot see what is available to artist" do
    visit "/"
    click_on "gallery_sign_in"

    user_signs_in(gallery)
    click_on "Recently uploaded art"

    expect(page.current_path).to eq artists_path
    expect(page).to_not have_content "My Profile"
  end
end

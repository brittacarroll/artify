require 'rails_helper'

feature "user signs in as artist or gallery and gets directed to right path" do
  let(:lisa) do
    FactoryGirl.create(:artist)
  end
  let(:gallery) do
    FactoryGirl.create(:gallery)
  end

  scenario "artist signs in and goes to artist index" do
    visit "/"
    click_on "artist_sign_in"

    expect(page.current_path).to eq new_artist_session_path
    user_signs_in(lisa)

    expect(page.current_path).to eq artists_path
    expect(page).to have_content "Signed in successfully"
  end

  scenario "gallery signs in and goes to galleries index" do
    visit "/"
    click_on "gallery_sign_in"

    expect(page.current_path).to eq new_gallery_session_path
    user_signs_in(gallery)

    expect(page.current_path).to eq galleries_path
    expect(page).to have_content "Signed in successfully"
  end
end

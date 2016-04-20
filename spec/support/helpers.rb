module Helpers
  def user_signs_in(user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
  end

  def artist_signs_up(artist)
    visit "/"
    click_on "artist_sign_up"
    fill_in "First name", with: artist.first_name
    fill_in "Last name", with: artist.last_name
    select artist.role, from: "artist_role"
    fill_in "Email", with: artist.email
    fill_in "Password", with: artist.password
    fill_in "Password confirmation", with: artist.password
    click_on "Sign up"
  end

  def gallery_signs_up(gallery)
    visit "/"
    click_on "gallery_sign_up"
    fill_in "Name", with: gallery.name
    fill_in "Representative name", with: gallery.representative_name
    fill_in "Email", with: gallery.email
    fill_in "Password", with: gallery.password
    fill_in "Password confirmation", with: gallery.password
    click_on "Sign up"
  end
end

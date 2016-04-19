module Helpers
  def artist_sign_in(user)
    visit '/'
    click_on 'Artist'
   visit '/artists/sign_in'

   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_on "Log in"
  end
end

# require 'rails_helper'
#
# feature "a user sends message" do
#   let(:artist) { FactoryGirl.create(:artist) }
#
#   scenario "artist sends message from inbox" do
#     visit "/"
#     click_on "artist_sign_in"
#
#     user_signs_in(artist)
#     click_on "Inbox"
#
#     click_on "Compose"
#     select artist.first_name, from: "conversation_recipients"
#     fill_in ("Subject"), with: "Hello"
#
#
#     click_on "Send Message"
#
#     expect(page).to have_content "Your message was successfully sent!"
#     expect(page).to have_content artist.name
#     expect(page).to have_content "Hello"
#     expect(page).to have_content "How are you?"
#   end
# end

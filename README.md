#Artify
![Build Status](https://codeship.com/projects/7f45f120-e873-0133-e1f1-7ab9be0b8d5f/status?branch=master)
![Code Climate](https://codeclimate.com/github/brittacarroll/artify.png)
![Coverage Status](https://coveralls.io/repos/brittacarroll/artify/badge.png)


Artify is an app that allows artists to upload pictures of their artwork, and for
galleries to be able to sign-up, view that artwork, and select artists they are interested in.

[Artify Website](http://artify.herokuapp.com/)

##Ruby version:
Ruby version 2.2.3

##Configuration:

Run the following (after git cloning):
  ``bundle install``
  ``rake db:create``
  ``rake db:migrate``
  ``rails s``

##Features:

* Artists and galleries can create an account, which automatically creates a profile
* Users can upload profile pictures
* Users can view other users' profiles
* Users can view all recently uploaded artwork
* Galleries can select artists that they like
* Galleries can send messages to artists, and artists can reply
* Artists can upload pictures of their art and delete their uploaded artwork
* Users can edit their bios on profiles and update their profile pictures

##Technologies:

* Uploading of all pictures with CarrierWave/Fog/AWS
* Display of pictures using Fotorama
* Messaging amongst users with Mailboxer
* Authorization for both artists and galleries using Devise
* Styling with Foundation
* Feature tests with Capybara
* Model tests with Rspec
* Logo by [Matt McKelvey](https://github.com/mmckv)

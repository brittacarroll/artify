class WelcomeController < ApplicationController
  def index
    @user = current_artist
  end
end

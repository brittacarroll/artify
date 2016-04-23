class MessagesController < ApplicationController

  def new
    @profile = current_artist.artists_profile
  end

  def create
    @artist = current_artist
    recipients = Artist.where(id: params['artists'])
    conversation = @artist.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end

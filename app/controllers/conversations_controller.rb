class ConversationsController < ApplicationController
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @conversations = @mailbox.inbox.all
  end

  def show
    @profile = current_artist.artists_profile
  end

  def reply
    current_artist.reply_to_conversation(conversation, params[:body])
    redirect_to conversation_path(@conversation)
  end

  private

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end

  def get_mailbox
    @mailbox ||= current_artist.mailbox
  end
end

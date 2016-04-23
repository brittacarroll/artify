class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @conversations = @mailbox.inbox
  end

  def show
  end

  private

  def get_mailbox
    @mailbox ||= current_artist.mailbox
  end
end

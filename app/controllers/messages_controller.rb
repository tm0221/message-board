class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'The message was saved.'
    else
      @messages = Message.all
      flash.now[:alert] = "Failed to save the message."
      render 'index'
    end  
  end
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
end

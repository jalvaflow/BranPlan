class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.contact(@message).deliver_now
      redirect_to contact_path
      flash[:success] = "Message recieved. Thank you for your feedback!"
    else
      flash[:danger] = "At least one of the fields was not entered. Please try again."
      render :new
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :body)
    end
end

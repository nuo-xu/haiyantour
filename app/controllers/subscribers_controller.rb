class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to root_url, notice: 'Thanks for keeping up to date with us!' }
      else
        format.html { redirect_to root_url, notice: 'Had an issue for subscribing!' }
      end
    end
  end

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(:email_address)
    end
end

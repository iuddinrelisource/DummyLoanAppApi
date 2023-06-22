class DealerSessionsController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
    def create
      @dealer = User.find_by(email: params[:email])
  
      if @dealer && @dealer.dealer? && @dealer.valid_password?(params[:password])
        render json: { message: 'Sign-in successful', loggedin: true }
      else
        render json: { message: 'Invalid email or password', loggedin: false }, status: :unauthorized
      end
    end
end

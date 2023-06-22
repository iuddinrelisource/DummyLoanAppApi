class DealerRegistrationsController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
    def create
      @dealer = User.new(dealer_params)
      @dealer.role = :dealer
      @dealer.status = 1
        
      if @dealer.save
        render json: @dealer, status: :created
      else
        render json: @dealer.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def dealer_params
      params.require(:dealer).permit(:name, :email, :password, :password_confirmation, :dob, :phone)
    end
end

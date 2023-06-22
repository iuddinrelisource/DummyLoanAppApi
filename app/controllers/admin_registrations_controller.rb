class AdminRegistrationsController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
    def create
      @admin = User.new(admin_params)
      @admin.role = :admin
      @admin.status = 1
        
      if @admin.save
        render json: @admin, status: :created
      else
        render json: @admin.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation, :dob, :phone)
    end
  end
  

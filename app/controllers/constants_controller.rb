require "#{Rails.root}/app/constants/DealerConstants.rb"
class ConstantsController < ApplicationController
    include DealerConstants
    def lists
        years = YEAR
        mileage = MILAGE
        render json: { years: years, mileage: mileage }
    end
end

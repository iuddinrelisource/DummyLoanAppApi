class MakesController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
    before_action :set_make, only: [:show, :update, :destroy]

  def index
    @makes = Make.all
    render json: @makes
  end

  def show
    render json: @make
  end

  def create
    @make = Make.new(make_params)

    if @make.save
      render json: @make, status: :created
    else
      render json: @make.errors, status: :unprocessable_entity
    end
  end

  def update
    if @make.update(make_params)
      render json: @make
    else
      render json: @make.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @make.destroy
    head :no_content
  end

  private

  def set_make
    @make = Make.find(params[:id])
  end

  def make_params
    params.require(:make).permit(:name, :status)
  end
end

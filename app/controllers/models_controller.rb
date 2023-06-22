class ModelsController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
    before_action :set_model, only: [:show, :update, :destroy]

  def index
    @models = Model.all
    render json: @models
  end

  def show
    render json: @model
  end

  def create
    @model = Model.new(model_params)

    if @model.save
      render json: @model, status: :created
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  def update
    if @model.update(model_params)
      render json: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @model.destroy
    head :no_content
  end
  
  private

  def set_model
    @model = Model.find(params[:id])
  end

  def model_params
    params.require(:model).permit(:name, :status, :make_id)
  end
end

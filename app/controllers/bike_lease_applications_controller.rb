class BikeLeaseApplicationsController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
    # GET /bike_lease_applications
  def index
    @bike_lease_applications = BikeLeaseApplication.all
    render json: @bike_lease_applications, include: { lessee: {}, colessee: {} }
  end

    # GET /bike_lease_applications/:id
    def show
        @bike_lease_application = BikeLeaseApplication.includes(:lessee, :colessee).find(params[:id])
        render json: @bike_lease_application, include: { lessee: {}, colessee: {} }
      end

  # POST /bike_lease_applications
  def create
    @bike_lease_application = BikeLeaseApplication.new(bike_lease_application_params)
    @bike_lease_application.status = 'pending'

    if @bike_lease_application.save
      render json: @bike_lease_application, status: :created
    else
      render json: @bike_lease_application.errors, status: :unprocessable_entity
    end
  end

  # POST /bike_lease_applications submit
  def submit_application
    @bike_lease_application = BikeLeaseApplication.find(params[:id])
    @bike_lease_application.status = 'submmitted'

    if @bike_lease_application.save
      render json: @bike_lease_application, status: :ok
    else
      render json: @bike_lease_application.errors, status: :unprocessable_entity
    end
  end

  # POST /bike_lease_applications/:id/lesse
  def createlesse
    @bike_lease_application = BikeLeaseApplication.find(params[:id])
    
    lessee = Lessee.new(lessee_params)

    if lessee.save
      @bike_lease_application.lessee = lessee
      @bike_lease_application.save
      render json: { message: 'Lessee created and associated with BikeLeaseApplication successfully.' }, status: :created
    else
      render json: lessee.errors, status: :unprocessable_entity
    end
  end

  # POST /bike_lease_applications/:id/lesse
  def createcolesse
    @bike_lease_application = BikeLeaseApplication.find(params[:id])

    colessee = Colesse.new(colessee_params)

    if colessee.save
      @bike_lease_application.colessee = colessee
      @bike_lease_application.save
      render json: { message: 'colesse created and associated with BikeLeaseApplication successfully.' }, status: :created
    else
      render json: colessee.errors, status: :unprocessable_entity
    end
  end
  private

  def bike_lease_application_params
    params.require(:bike_lease_application).permit(:make_id, :model_id, :year, :mileage, :downpayment)
  end

  def lessee_params
    params.require(:lessee).permit(:name, :address, :phone, :monthly_income, :dob)
  end

  def colessee_params
    params.require(:colessee).permit(:name, :address, :phone, :monthly_income, :dob)
  end
end

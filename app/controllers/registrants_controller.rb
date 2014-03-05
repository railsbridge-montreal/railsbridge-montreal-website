class RegistrantsController < ApplicationController
  before_action :set_registrant, only: [:show, :edit, :update, :destroy]

  # GET /registrants
  def index
    @registrants = Registrant.all
  end

  # GET /registrants/1
  def show
  end

  # GET /registrants/new
  def new
    @registrant = Registrant.new
  end

  # GET /registrants/1/edit
  def edit
  end

  # POST /registrants
  def create
    @registrant = Registrant.new(registrant_params)

    if @registrant.save
      redirect_to @registrant, notice: 'Registrant was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /registrants/1
  def update
    if @registrant.update(registrant_params)
      redirect_to @registrant, notice: 'Registrant was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /registrants/1
  def destroy
    @registrant.destroy
    redirect_to registrants_url, notice: 'Registrant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registrant
      @registrant = Registrant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registrant_params
      params.require(:registrant).permit(:name, :email)
    end
end

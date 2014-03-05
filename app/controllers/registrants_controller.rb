class RegistrantsController < ApplicationController
  respond_to :js

  def new
  end

  def create
    @registrant = Registrant.new(registrant_params)
    if @registrant.save
      Notifier.new_registration(@registrant).deliver
    end
    render layout: false
  end

  private
    # Only allow a trusted parameter "white list" through.
    def registrant_params
      params.require(:registrant).permit(:name, :email)
    end
end

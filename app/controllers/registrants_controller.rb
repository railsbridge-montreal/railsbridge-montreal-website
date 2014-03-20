class RegistrantsController < ApplicationController
  respond_to :js

  def create
    @registrant = Register.new.register(registrant_params)
    render layout: false
  end

  private
    # Only allow a trusted parameter "white list" through.
    def registrant_params
      params.require(:registrant).permit(
        :name,
        :email,
        :bringing_laptop,
        :rails_before,
        :programmed_before,
        :ruby_before,
        :rails_before,
        :special_needs
      )
    end
end

class RegistrantsController < ApplicationController
  respond_to :js

  def create
    @registrant = Register.new.register(registrant_params)
    @registrant = Registrant.new(registrant_params)
    if @registrant.save
      Notifier.new_registration(@registrant).deliver
    end
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
      )
    end
end

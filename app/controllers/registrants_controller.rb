class RegistrantsController < ApplicationController
  respond_to :js

  def new
    @question_submission_method = 'post'
  end

  def edit
    @yield_in_banner = true
    @question_submission_method = 'patch'
  end

  def validate_email
    @registrant = Registrant.find_by_email(registrant_params[:email])
    render layout: false
  end

  def create
    @registrant = Register.new.register(registrant_params)
    render layout: false
  end

  def update
    @registrant = Register.new.update(params[:registrant][:id], registrant_params)
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
        :special_needs,
        :language
      )
    end
end

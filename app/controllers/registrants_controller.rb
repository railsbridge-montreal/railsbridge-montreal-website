class RegistrantsController < ApplicationController
  respond_to :js, :json

  def new
    @question_submission_method = 'post'
  end

  def edit
    @yield_in_banner = true
    @question_submission_method = 'patch'
    @email_param = params[:email]
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

  def cancel
    @registrant = Registrant.find_by_email(params[:email])
    @registrant.update_attributes(cancelled_at: DateTime.now)
    render layout: false
  end

  def course
    @course = Course.find(params[:course_id])
    render json: @course.registrants.where(cancelled_at: nil).as_json(only: [:name], methods: [:group, :teachers])
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
        :language,
        :waitlisted
      )
    end
end

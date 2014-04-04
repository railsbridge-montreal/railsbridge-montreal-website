class ChecksController < ApplicationController
  http_basic_authenticate_with name: "volunteer", password: "railsbridge_montreal_3", only: :index
  skip_before_filter :verify_authenticity_token, except: :index
  layout :choose_layout

  def index
    @checks = Check.all.order('email ASC, created_at DESC')
  end

  def script
    render text: Rails.root.join('lib/rsvp.rb').read
  end

  def create
    @check = Check.new(check_params)

    if @check.save
      head :ok
    else
      head :bad_request
    end
  end

  private

    def check_params
      params.require(:check).permit(:email, :ruby_version, :ruby_platform)
    end

    def choose_layout
      "dashboard"
    end
end

class ChecksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render text: File.open(Rails.root + "lib/rsvp.rb").read
  end

  def create
    # XXX maybe do a find_or_create here
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
end

class AdminsController < ApplicationController
  http_basic_authenticate_with name: "volunteer", password: ENV["ADMIN_PASSWORD"]
  layout 'dashboard'

  def show
    @current_edition = Edition.where(registrations_open: true).includes(:registrants).take
    @children = Child.all
  end
end

class ChildcareController < ApplicationController
  def show

  end

  def register
    child = Struct.new(:name)
    @child = child.new(params[:childcare][:name])
  end
end

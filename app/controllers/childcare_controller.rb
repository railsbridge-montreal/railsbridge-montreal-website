class ChildcareController < ApplicationController
  def show

  end

  def register
    @child = Child.create child_params
  end

  private

  def child_params
    params.require(:childcare).permit(:email, :name, :age, :special_needs)
  end
end

class EmployeesController < ApplicationController
  before_action :authenticate_user!

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params.merge(user_id: current_user.id))

    if @employee.save
      flash[:notice] = t('common.create.success', model: @employee)
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:full_name, :address, :phone_number, :department_id)
  end
end

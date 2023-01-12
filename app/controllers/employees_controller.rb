class EmployeesController < ApplicationController
  before_action :authenticate_user!

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params.merge(user_id: current_user.id))

    if @employee.save
      redirect_to root_path, notice: 'Add Employee successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:full_name, :address, :phone_number, :department_id)
  end
end

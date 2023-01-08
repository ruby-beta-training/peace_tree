class EmployeesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :after_sign_in_path_for
  def index; end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employees_params)
      # user = User.find_by(email: params[:user][:email].downcase) if params[:user][:email].present?
      # user ||= current_user
    # user = User.find_by(email: params[:user][:email].downcase)
    @employee.user_id = current_user.id
    respond_to do |format|
      if @employee.save
        format.html { redirect_to root_path, notice: 'Add Employee successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_employee
    # @employee = Employee.new(user_id: current_user.id)
  end

  def employees_params
    params.require(:employee).permit(:full_name, :address, :phone_number)
  end
end

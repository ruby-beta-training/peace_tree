class Admin::EmployeesController < Admin::BaseController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @users = User.employees.includes([:employee]).order('created_at DESC')
    @users = @users.where('email LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @pagy, @users = pagy(@users)
    respond_to do |format|
      format.html
      format.json { render json: { html: render_html_table } }
    end
  end

  def show; end

  def new
    @user = User.new
    @user.build_employee
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = t('common.create.success', model: @user)
      redirect_to admin_employees_path
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @user.build_employee if @user.employee.present?
  end

  def update
    if @user.update(user_params)
      flash[:notice] = t('common.update.success', model: @user)
      redirect_to admin_employees_path
    else
      flash[:notice] = t('common.update.failed', model: @user)
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = t('common.destroy.success', model: @user.email)
    redirect_to admin_employees_path
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :password,
      employee_attributes: %i[full_name address phone_number department_id]
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def render_html_table
    render_to_string(partial: 'admin/employees/table', formats: [:html], layout: false, locals: { users: @users })
  end
end

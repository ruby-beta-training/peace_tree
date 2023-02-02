class Admin::ProjectsController < Admin::BaseController
  before_action :set_project, only: %i[show edit delete_employee update destroy]

  def index
    @projects = Project.order('created_at DESC')
    @pagy, @projects = pagy(@projects)
  end

  def show
    @activity = Activity.new
  end

  def new
    @project = Project.new
  end

  def create
    if Project.create(project_params)
      flash[:notice] = t('common.create.success', model: @project)
      redirect_to admin_projects_path
    else
      flash[:alert] = @project.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      flash[:notice] = t('common.update.success', model: @project)
      redirect_to admin_projects_path
    else
      flash[:notice] = t('common.update.failed', model: @project)
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = t('common.destroy.success', model: @project)
    redirect_to admin_projects_path
  end

  def delete_employee
    if @project.users.delete(params[:user_id])
      flash[:notice] = 'remove employee successfully'
    end
    redirect_to admin_project_path
  end

  def add_employee
    byebug
    # if @project.users<<
  end

  def show_employees
    @users = User.order('created_at DESC')
    @pagy, @users = pagy(@users, items: 8)
    respond_to do |format|
      format.html
      format.json { render json: { html: render_html_table } }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name, :project_type, :description, :address, :area, :status)
  end

  def render_html_table
    render_to_string(partial: 'admin/projects/all_employee', formats: [:html], layout: false, locals: { users: @users })
  end
end

class Admin::ProjectsController < Admin::BaseController
  before_action :set_project, only: %i[show edit show_employees_of_project delete_employee add_employee show_employees update destroy]
  def index
    @projects = Project.order('created_at DESC')
    @projects = @projects.projects_name(params[:search])
    @pagy, @projects = pagy(@projects)
    respond_to do |format|
      format.html
      format.json { render json: { html: render_html_employees } }
    end
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
    @user = User.find(params[:user_id]) if params[:user_id].present?
    @project.users << @user
    show_employees
  end

  def show_employees
    @us = @project.users
    @users = User.order('created_at DESC')
    @users = @users.where.not(id: @us.pluck(:id))
    @users = @users.employees_email(params[:search])
    @pagy, @users = pagy(@users, items: 8, link_extra: 'data-remote="true"')
    render json: {
      html: render_html_table, pagination: render_pagination_html
    }
  end

  def show_employees_of_project
    render json: {
      html: render_html_employees_of_project
    }
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name, :project_type, :description, :address, :area, :status)
  end

  def render_html_table
    render_to_string(
      partial: 'admin/projects/employees/table',
      formats: [:html], layout: false, locals: { users: @users, project: @project }
    )
  end

  def render_pagination_html
    render_to_string(
      partial: 'admin/projects/employees/pagination',
      formats: [:html], layout: false, locals: { users: @pagy }
    )
  end

  def render_html_employees
    render_to_string(partial: 'admin/projects/table_projects', formats: [:html], layout: false, locals: { projects: @projects })
  end

  def render_html_employees_of_project
    render_to_string(partial: 'admin/projects/employees', formats: [:html], layout: false, locals: { users: @project.users })
  end
end

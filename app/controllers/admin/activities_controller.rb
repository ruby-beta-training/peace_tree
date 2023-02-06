class Admin::ActivitiesController < Admin::BaseController
  def new
    @activity = Activity.new
  end

  def create
    if Activity.create(activity_params)
      flash[:notice] = t('common.create.success', model: @activity)
    else
      flash[:alert] = @activity.errors.full_messages.to_sentence
    end
    render :new
  end

  private

  def activity_params
    params.require(:activities).permit(:activity_name, :activity_time, :activity_description, arr_user: [])
  end
end

class EventsController < ApplicationController

  before_action :return_404_if_not_super_admin, only: [:edit, :new, :create, :delete]

  def index
    @today = Date.today
    @beginning_of_week = @today.at_beginning_of_week
    @end_of_week = @today.at_end_of_week
    @days_of_week = (@beginning_of_week..@end_of_week).to_a

    @ungrouped_events = Event
                          .where(start_at_date: @beginning_of_week..@end_of_week,
                                 deleted_at: nil,
                                 is_template: false,
                                )
                          .order(:start_at_date, :start_at_time)
    @events_by_date = @ungrouped_events.group_by(&:start_at_date)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.deleted_at = Time.now
    @event.save

    redirect_to root_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit('title',
                                  'description',
                                  'start_at_date',
                                  'start_at_hour',
                                  'start_at_minute',
                                  'location_name',
                                  'address')
  end


  def return_404_if_not_super_admin
    if ! user_super_admin?
      render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
    end
  end
end

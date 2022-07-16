class EventsController < ApplicationController

  def index
    @today = Date.today
    @beginning_of_week = @today.at_beginning_of_week
    @end_of_week = @today.at_end_of_week
    @days_of_week = (@beginning_of_week..@end_of_week).to_a

    @ungrouped_events = Event
                          .where(start_at_date: @beginning_of_week..@end_of_week, deleted_at: nil)
                          .order(:start_at_date, :start_at_time)
    @events_by_date = @ungrouped_events.group_by(&:start_at_date)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    start_at_date = Date.new(event_params["start_at_date(1i)"].to_i,
                             event_params["start_at_date(2i)"].to_i,
                             event_params["start_at_date(3i)"].to_i)
    hour = event_params['start_at_hour']
    minute = event_params['start_at_minute']
    start_at_time = if hour && minute
      "#{hour.to_i}:#{minute}.to_i"
    else
      nil
    end

    @event = Event.new(title: event_params[:title],
                       description: event_params[:description],
                       start_at_date: start_at_date,
                       start_at_time: start_at_time,
                       location_name: event_params[:location_name],
                       address: event_params[:address],
                      )

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
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

end

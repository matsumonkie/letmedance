class EventsController < ApplicationController

  def index
    @today = Date.today
    @beginning_of_week = @today.at_beginning_of_week
    @end_of_week = @today.at_end_of_week
    @days_of_week = (@beginning_of_week..@end_of_week).to_a

    @ungrouped_events = Event
                          .where(start_at_date: @beginning_of_week..@end_of_week)
                          .order(:start_at_date, :start_at_time)
    @events_by_date = @ungrouped_events.group_by(&:start_at_date)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @enable_start_at_time = params[:enable_start_at_time]
    @event = Event.new()
  end

  def create
    start_at_date = Date.new(event_params["start_at_date(1i)"].to_i,
                             event_params["start_at_date(2i)"].to_i,
                             event_params["start_at_date(3i)"].to_i)
    start_at_time = if params[:event][:enable_start_at_time]
      "#{event_params['start_at_time(4i)'].to_i}:#{event_params['start_at_time(5i)'].to_i}"
    else
      nil
    end

    @event = Event.new(title: event_params[:title],
                       description: event_params[:description],
                       start_at_date: start_at_date,
                       start_at_time: start_at_time
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
    @event.destroy

    redirect_to root_path, status: :see_other
  end

  private

    def event_params
      params.require(:event).permit('title', 'description', 'start_at_date', 'start_at_time')
    end

end

class EventsController < ApplicationController

  def index
    @events = Event.order(:start_at_date)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new()
  end

  def create

    start_at_date = Date.new(event_params["start_at_date(1i)"].to_i,
                             event_params["start_at_date(2i)"].to_i,
                             event_params["start_at_date(3i)"].to_i)
    start_at_time = Date.new(event_params["start_at_time(1i)"].to_i,
                             event_params["start_at_time(2i)"].to_i)

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
      params.require(:event).permit('title', 'description', 'start_at_date')
    end

end

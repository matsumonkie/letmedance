class NewEventsController < ApplicationController

  before_action :return_404_if_not_super_admin, only: [:new, :create]

  def new
    @start_at_time = params.has_key?(:start_at_time)
    @event = NewEvent.new()
  end

  def create
    start_at_date = Date.new(event_params["start_at_date(1i)"].to_i,
                             event_params["start_at_date(2i)"].to_i,
                             event_params["start_at_date(3i)"].to_i)
    hour = event_params['start_at_hour']
    minute = event_params['start_at_minute']
    start_at_time =
      if hour && minute
        "#{hour.to_i}:#{minute}"
      else
        nil
      end

    @event = NewEvent.new(title: event_params[:title],
                          description: event_params[:description],
                          is_template: event_params[:is_template],
                          start_at_date: start_at_date,
                          start_at_time: start_at_time,
                          location_name: event_params[:location_name],
                          address: event_params[:address],
                         )

    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:new_event).permit('title',
                                      'description',
                                      'start_at_date',
                                      'start_at_hour',
                                      'start_at_minute',
                                      'location_name',
                                      'address',
                                      'is_template')
  end


  def return_404_if_not_super_admin
    if ! user_super_admin?
      render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
    end
  end
end

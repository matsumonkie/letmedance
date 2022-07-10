class Event < ApplicationRecord

  validates :title, presence: true
  validates :start_at_date, presence: true
  # validates :start_at_time

  def human_start_at_time
    start_at_time.strftime('%H:%m')
  end
end

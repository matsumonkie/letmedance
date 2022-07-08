class Event < ApplicationRecord

  validates :title, presence: true
  validates :start_at_date, presence: true
end

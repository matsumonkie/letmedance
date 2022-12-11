class NewEvent < ApplicationRecord

  self.table_name = "events"

  validates :title, presence: true
  validates :start_at_date, presence: true
end

class Event < ApplicationRecord

  validates :title, presence: true
  validates :start_at_date, presence: true

  def human_start_at_date
    "#{I18n.t('date.day_names')[start_at_date.days_to_week_start].capitalize} #{I18n.l start_at_date, format: :short}"
  end

  def human_start_at_time
    I18n.l start_at_time
  end

  def human_start_at
    if start_at_time
      "#{human_start_at_date} à #{human_start_at_time}"
    else
      human_start_at_date
    end
  end

  def google_map_address_link
    if address
      "https://www.google.com/maps/search/?api=1&query=#{CGI.escape(address)}"
    else
      ""
    end
  end
end

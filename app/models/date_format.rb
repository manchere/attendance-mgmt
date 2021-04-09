module DateFormat
  def human_datetime(date_time)
    date_time.strftime('%d-%m-%Y %I:%M%p')
  end
end
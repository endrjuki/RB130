class Meetup
  require 'date'

  SCHEDULE_START_DATE = {
    first:  1,
    second: 8,
    third:  15,
    fourth: 22,
    last:   -7,
    teenth: 13
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    start_date = Date.new(@year, @month, SCHEDULE_START_DATE[schedule])
    end_date = start_date + 7

    start_date.upto(end_date) { |date| return date if date_fits_reqs(date, weekday) }
  end

  private

  def date_fits_reqs(date, weekday)
    date.public_send(weekday.to_s + '?')
  end
end
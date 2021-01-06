class Meetup
  require 'date'

  def initialize(month, year)
    @date = Date.new(year, month)
  end

  def day(weekday, schedule)
    last_date_of_month = Date.new(@date.year, @date.month, -1)
    count = 0
    date = nil

    @date.upto(last_date_of_month) do |date|      
      count += 1 if what_weekday_is(date) == weekday

      case schedule
      when :first
        return date if count == 1      
      when :second
        return date if count == 2
      when :third
        return date if count == 3
      when :fourth
        return date if count == 4
      when :last
        next unless count == 4 && what_weekday_is(date) == weekday
        return last_date_helper_method(date)
      when :teenth
        date = teenth_helper_method(date, weekday)
        return date unless date.nil?
      end
    end
  end 

  private  

  def what_weekday_is(date)
    date.strftime("%A").downcase.to_sym
  end

  def last_date_helper_method(date)
    if (date + 7).month == date.month
      date + 7
    else
      date
    end
  end

  def teenth_helper_method(date, weekday)
    if (13..19).include?(date.day) && what_weekday_is(date) == weekday
      date
    else
      nil
    end
  end
end
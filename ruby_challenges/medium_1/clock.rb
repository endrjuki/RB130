class Clock
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24

  def initialize(h, m)
    @hours = h
    @minutes = m
  end

  def self.at(hours, minutes=0)
    clock = Clock.new(hours, minutes)
  end

  def to_s
    format("%0.2d:%0.2d", @hours, @minutes)
  end

  def +(minutes)
    h = @hours
    m = @minutes + minutes
    h, m = adjust_hours_minutes!(h, m)
    Clock.new(h, m)
  end

  def -(minutes)
    h = @hours
    m = @minutes - minutes
    h, m = adjust_hours_minutes!(h, m)
    Clock.new(h, m)
  end

  def ==(other)
    self.to_s == other.to_s
  end

  private

  def adjust_hours_minutes!(hours, minutes)
    offset_hours, offset_minutes = minutes.divmod(MINUTES_IN_HOUR)
    hours = (hours + offset_hours) % HOURS_IN_DAY
    minutes = offset_minutes    
    [hours, minutes]
  end

end
class AssemblyLine
  BASE_CARS_PER_HOUR = 221
  SUCCESS_RATE_PER_SPEED = [
    {
      lower_bound: 1,
      upper_bound: 4,
      success_rate: 1.0,
    },
    {
      lower_bound: 5,
      upper_bound: 8,
      success_rate: 0.9,
    },
    {
      lower_bound: 9,
      upper_bound: 9,
      success_rate: 0.8,
    },
    {
      lower_bound: 10,
      upper_bound: 10,
      success_rate: 0.77,
    },
  ]
  def initialize(speed)
    @speed = speed
  end

  def current_success_rate
    SUCCESS_RATE_PER_SPEED.detect {|e| e[:lower_bound]<=@speed && e[:upper_bound]>=@speed}[:success_rate]
  end

  def production_rate_per_hour
    return @speed * BASE_CARS_PER_HOUR * current_success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end

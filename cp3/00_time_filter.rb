require 'time'

class TimeFilter
  attr_reader :start, :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def to_proc
    start = self.start
    finish = self.finish

    proc do |value|
      next false if start && value < start
      next false if finish && value > finish
      true
    end
  end
end

array_of_times = [
  Time.parse('2023-09-30T00:00:00'),
  Time.parse('2023-10-30T00:00:00'),
  Time.parse('2023-11-30T00:00:00'),
  Time.parse('2023-12-30T00:00:00')
]
time_filter = TimeFilter.new(Time.local(2023, 10), Time.local(2023, 11))
array_of_times.filter!(&time_filter)
pp array_of_times

array_of_times = [
  Time.parse('2023-09-30T00:00:00'),
  Time.parse('2023-10-30T00:00:00'),
  Time.parse('2023-11-30T00:00:00'),
  Time.parse('2023-12-30T00:00:00')
]
after_now = TimeFilter.new(Time.now, nil)
in_future, in_past = array_of_times.partition(&after_now)
pp in_future
pp in_past

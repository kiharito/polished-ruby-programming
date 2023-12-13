# frozen_string_literal: true

class Max
  def initialize(max)
    @max = max
  end

  def over?(n)
    @max < n
  end
end

class MaxBy < Max
  def over?(n, by: 0)
    @max + by < n
  end
end

class Anki
  def initialize(interval, reviews)
    @interval = interval.to_int
    @reviews = reviews
  end

  def determine_next_dates
    today = DateTime.now
    l = [['10 Minutes', 0.0069]]

    if @interval < 1 || @reviews == 0
      l << ['1 Day', @interval+1]
      l << ['2 Days', @interval+2]
      l << ['3 Days', @interval+3]
    else
      ints = @reviews < 3 ? [0, 1, 2] : [0, 10, 20]
      ints.each { |i| l << ["#{@interval + i} Days", @interval + i] }
    end

    return l
  end
end

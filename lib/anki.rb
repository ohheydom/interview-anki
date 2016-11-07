class Anki
  def initialize(challenge)
    @challenge = challenge
  end

  def determine_next_dates
    today = DateTime.now
    ten_mins = 0.0069
    l = [['10 Minutes', ten_mins]]
    interval = @challenge.interval.to_int

    if interval < 1 || @challenge.reviews == 0
      l << ['1 Day', interval+1]
      l << ['2 Days', interval+2]
      l << ['3 Days', interval+3]
    else
      ints = @challenge.reviews < 3 ? [0, 1, 2] : [0, 10, 20]
      ints.each { |i| l << ["#{interval + i} Days", interval + i] }
    end
    return l
  end
end

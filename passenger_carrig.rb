class PassengerCarrig < Carrig
  attr_reader :passenger_capacity

  def initialize
    super
    @passenger_capacity = 60
  end

  def to_s
    super + "вместимость: #{passenger_capacity} человек"
  end
end

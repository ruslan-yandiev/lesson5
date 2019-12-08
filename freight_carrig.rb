class FreightCarrig < Carrig
  attr_reader :cargo_capacity

  def initialize(numb)
    super(numb)
    @cargo_capacity = 5000
  end

  def to_s
    super + "грузоподъемность: #{cargo_capacity}"
  end
end

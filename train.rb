class Train
  attr_reader :number, :carrig

  def initialize
    @number = 1
    @speed = 0
    @route
    @arr_stations = []
    @train_now = nil
    @sum = 0
    @carrig = []
  end

  def number!(number_tr)
    @number += number_tr
  end

  def type_train
    puts self.class
  end

  def speed=(arg)
    @speed = arg if @speed > 0
  end

  def show_speed
    puts @speed
  end

  def start
    @speed = 100
  end

  def stop
    @speed = 0
  end

  def show_carriages
    puts "Поезд тип: #{self.class} №#{self.number} присоединено вагонов: #{@carrig.size}"
    @carrig.each { |carrig| puts carrig }
  end

  def show_route(arg = nil)
    if arg && @route
      @route.show_way(@train_now)
    elsif @route
      @route.show_way
    end
  end

  def add_carrig(carrig)
    if @speed.zero?
      @carrig << carrig
      carrig.change_status(self)
    else
      puts "На ходу нельзя цеплять вагоны!"
    end
  end

  def delete_carrig(carrig = nil)
    if @carrig.size.zero?
      puts "Вагонов уже не осталось."
    elsif carrig.nil? && @speed.zero?
      disconnect_carrig = @carrig.shift
      disconnect_carrig.change_status(self)
    elsif @speed.zero?
      @carrig.delete(carrig)
      carrig.change_status(self)
    else
      puts "На ходу нельзя отцеплять вагоны!"
    end
  end

  def add_route(route_train)
    @route = route_train
    @route.route.each { |x| @arr_stations << x}
    @arr_stations[0].get_train(self)
    @train_now = @arr_stations[0]
  end

  def go
    if @route.nil?
      puts "У поезда нет маршрута следования."
    elsif @sum == @arr_stations.size - 1
      puts 'Поезд находится на конечной станции'
    else
      start
      @sum += 1
      @train_now.send_train(self)
      @arr_stations[@sum].get_train(self)
      @train_now = @arr_stations[@sum]
    end
  end

  def go_back
    if @route.nil?
      puts "У поезда нет маршрута следования."
    elsif @sum == 0
      puts 'Поезд находится на начальной станции'
    else
      start
      @sum -= 1
      @train_now.send_train(self)
      @arr_stations[@sum].get_train(self)
      @train_now = @arr_stations[@sum]
    end
  end

  def show_where
    puts "Поезд находится на станции: #{@train_now.name}" if @route
  end

  #метод защищен так как нельзя стартовать не зная в каком направлении должен двигаться поезд.
  protected :start
end

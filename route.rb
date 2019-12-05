class Route
  attr_accessor :route, :name

  def initialize
    @name
    @route = []
  end

  def add_stations(new_route)
    @route << new_route
  end

  def delete_way(index)
    @route.delete_at(index)
  end

  def show_way(name_station = nil)
    if name_station
      num = @route.index(name_station)
      puts "Вы покинули станцию #{@route[num -1].name},\nСейчас находитесь на станции #{@route[num].name}\nСледующая остановка #{@route[num + 1].name}"
    else
      @route.each { |x| puts x.name }
    end
  end

  def name!
    print 'Введите наименование маршрута: '
    name_st = gets.chomp.capitalize
    @name = name_st
  end
end

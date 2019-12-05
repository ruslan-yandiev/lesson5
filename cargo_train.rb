class CargoTrain < Train
  def add_carrig(carrig)
    if carrig.instance_of? FreightCarrig
      super
    else
      puts 'Можно присоединить только грузовые вагоны!'
    end
  end
end

require_relative 'train'

class PassengerTrain < Train
  def add_carrig(carrig)
    if carrig.instance_of? PassengerCarrig
      super
    else
      puts 'Можно присоединить только пассажирские вагоны!'
    end
  end
end

train1 = PassengerTrain.new
train1.number!(1)
train2 = PassengerTrain.new
train2.number!(2)
train3 = PassengerTrain.new
train3.number!(3)
train4 = PassengerTrain.new
train4.number!(4)
train5 = PassengerTrain.new
train5.number!(5)

PassengerTrain.find(5)

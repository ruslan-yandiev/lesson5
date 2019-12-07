module InstanceCounter
  def self.included(arg_class)
    arg_class.extend ClassMethods
    arg_class.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @instances_object = 1000
    end
  end

  module InstanceMethods
    def register_instance
      @instances_object = 3333
      puts self.class.instances
    end

    # protected :register_instance
  end
end

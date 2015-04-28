module Charger
  class Gateway

    # Returns an array of descendant classes.
    def self.descendants
      descendants = []
      ObjectSpace.each_object(singleton_class) do |k|
        descendants.unshift k unless k == self
      end
      #descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

  end
end

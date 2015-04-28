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

    def self.display_descendants
      Hash[self.descendants.map {|d| [d.display_name, d.to_s]}]
    end

    def self.display_name
      "Default Gateway"
    end

    def self.display_description
      ""
    end

  end
end

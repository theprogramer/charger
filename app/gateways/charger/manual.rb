module Charger
  class Manual < Gateway

  	attr_accessor :name, :age, :weight

    def self.display_name
      "Manual"
    end

    def self.display_description
      "Manual payments"
    end

  end
end

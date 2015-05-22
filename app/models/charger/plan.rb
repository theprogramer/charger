module Charger
  class Plan < ActiveRecord::Base

    # Assotiations
    belongs_to :downgrade_to, class_name: "Plan", foreign_key: :downgrade_to_id

    # Interval Unit
    enum interval_unit: [
      :hourly,
      :weekly,
      :fortnightly,
      :monthly,
      :bimonthly,
      :quarterly,
      :semiannually,
      :annually
    ]

    # Scopes
    scope :visibles, -> { where(enabled: true) }

    # Validations
    validates_presence_of :name, :amount

    # Firendly Id
    extend ::FriendlyId
    friendly_id :slug_candidates, use: :slugged

    # Try building a slug based on the following fields in
    # increasing order of specificity.
    def slug_candidates
      [
        :name
      ]
    end

    def interval
      case Charger::Plan.interval_units[self.interval_unit]
      when Plan.interval_units[:hourly]
        (self.interval_length).hour
      when Plan.interval_units[:weekly]
        (self.interval_length).week
      when Plan.interval_units[:fortnightly]
        (self.interval_length*15).days
      when Plan.interval_units[:monthly]
        (self.interval_length).month
      when Plan.interval_units[:bimonthly]
        (self.interval_length*2).month
      when Plan.interval_units[:quarterly]
        (self.interval_length*3).month
      when Plan.interval_units[:semiannually]
        (self.interval_length*6).month
      when Plan.interval_units[:annually]
        (self.interval_length).year
      else
        (0).days
      end
    end

  end
end

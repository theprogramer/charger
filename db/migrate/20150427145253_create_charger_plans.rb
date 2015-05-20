class CreateChargerPlans < ActiveRecord::Migration
  def change
    create_table :charger_plans do |t|
      t.string :name, null: false
      t.string :slug, default: ''
      t.text :description
      t.decimal :amount, precision: 8, scale: 2, default: 0
      t.integer :interval_length, default: 1
      t.integer :interval_unit, default: 0
      t.decimal :setup_fee, precision: 8, scale: 2, default: 0
      t.boolean :renew, default: true
      t.integer :billing_cycles, default: 0
      t.integer :trial_days, default: 0
      t.boolean :hold_setup_fee, default: false
      t.boolean :enabled, default: true
      t.boolean :visible, default: true
      # t.boolean :max
      # t.integer :max_qty

      t.string :gateway, default: ''

      t.references :downgrade_to

      t.timestamps null: false
    end
  end
end

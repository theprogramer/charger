class CreateChargerBillings < ActiveRecord::Migration
  def change
    create_table :charger_billings do |t|

      t.references :subscription
      t.decimal :amount, default: 0
      t.text :description
      t.text :observation

      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end

class CreateChargerSubscriptions < ActiveRecord::Migration
  def change
    create_table :charger_subscriptions do |t|

      t.belongs_to :subscriber, polymorphic: true #, index: true
      t.references :plan
      t.integer :status
      
      t.integer :billings_count, default: 0

      t.datetime :first_payment_at
      t.datetime :last_payment_at

      t.timestamps null: false
    end
  end
end

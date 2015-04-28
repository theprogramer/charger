class CreateChargerWallets < ActiveRecord::Migration
  def change
    create_table :charger_wallets do |t|
      t.string :name, default: ''
      t.text :description
      t.belongs_to :holder, polymorphic: true, index: true

      t.decimal :total, default: 0

      t.timestamps null: false
    end
  end
end

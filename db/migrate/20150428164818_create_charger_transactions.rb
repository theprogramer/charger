class CreateChargerTransactions < ActiveRecord::Migration
  def change
    create_table :charger_transactions do |t|
      t.references :wallet, index: true, foreign_key: true
      t.text :description
      t.datetime :date
      t.decimal :expence
      t.decimal :income
      t.integer :status

      t.timestamps null: false
    end
  end
end

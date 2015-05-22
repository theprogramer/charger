class CreateChargerTransactions < ActiveRecord::Migration
  def change
    create_table :charger_transactions do |t|

      t.text :description
      t.text :result

      t.datetime :date
      t.decimal :expence
      t.decimal :income
      t.integer :status, default: 0

      # Gateway Infos
      t.string :current_ip, default: ''
      t.string :transaction_number, default: ''
      t.string :document_number, default: ''
      t.string :auth_code, default: ''

      t.references :billing #, index: true, foreign_key: true
      t.references :wallet #, index: true, foreign_key: true

      # Timestamps
      t.timestamps null: false
    end
  end
end

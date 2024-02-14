class CreateContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :contributions do |t|
      t.integer :amount
      t.datetime :date
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end

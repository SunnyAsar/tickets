class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.text :description, null: false
      t.integer :status, default: 0
      t.integer :costing, default: 0
      t.decimal :price
      t.integer :duration, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end

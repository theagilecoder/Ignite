class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :skuid
      t.string :description
      t.decimal :price
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.decimal :weight

      t.timestamps
    end
  end
end

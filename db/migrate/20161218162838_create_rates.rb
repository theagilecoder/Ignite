class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.integer :szip
      t.integer :dzip
      t.decimal :onelbs
      t.decimal :twolbs
      t.decimal :fivelbs
      t.decimal :tenlbs

      t.timestamps
    end
  end
end

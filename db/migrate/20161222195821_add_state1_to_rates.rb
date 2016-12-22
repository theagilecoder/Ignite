class AddState1ToRates < ActiveRecord::Migration[5.0]
  def change
    add_column :rates, :state1, :string
  end
end

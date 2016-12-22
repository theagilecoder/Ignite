class AddState2ToRates < ActiveRecord::Migration[5.0]
  def change
    add_column :rates, :state2, :string
  end
end

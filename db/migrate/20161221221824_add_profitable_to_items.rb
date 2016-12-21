class AddProfitableToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :profitable, :string
  end
end

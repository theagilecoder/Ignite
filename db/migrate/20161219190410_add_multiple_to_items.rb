class AddMultipleToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :multiple, :string
  end
end

class Item < ApplicationRecord
  
  #Check if all items in CSV are valid
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Item.create! row.to_hash
    end  
  end
 
end
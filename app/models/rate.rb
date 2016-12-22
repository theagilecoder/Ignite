class Rate < ApplicationRecord
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Rate.create! row.to_hash
    end  
  end
  
end

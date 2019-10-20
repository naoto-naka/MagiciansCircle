class Category < ApplicationRecord
  has_many :videos

   def display_name
    self.category_name
  end
end

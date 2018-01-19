class Category < ApplicationRecord
  belongs_to :film

  scope :search_categories, -> (content){
    where("content LIKE ?", "%#{content}%")
  }
end

class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :post_review
end

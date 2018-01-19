class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_review
  scope :desc_create_at, -> {order("created_at desc")}
  validates :content, presence: true
  
  def self.new_comments
    where("created_at > ?", Time.new.beginning_of_day)
  end
end

class PostReview < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ratings

  def approve_post?
    self.approve
  end
end

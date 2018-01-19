class PostReview < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  mount_uploader :image, PictureUploader
  validates :title,  presence: true, length: {maximum: Settings.user.name_maximum}
  scope :pending, -> {where(:approve => true)}
  scope :approved, -> {where(:approve => false)}
  scope :newest, -> {order("created_at desc")}

  def approved_post
    where(approve: true)
  end

  scope :search_post, -> (content){
    where("title LIKE ? OR content LIKE ? and approve = ?", "%#{content}%", "%#{content}%", true)
  }
  
  def self.new_post_reviews
    where("created_at > ?", Time.new.beginning_of_day)
  end
end

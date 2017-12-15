class Film < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :categorys, dependent: :destroy
  has_many :watching_time, dependent: :destroy
  has_many :users, through: :ratings
  validates :name, presence: true
  validates :play_time, presence: true
  validates :describe, presence: true,
    length: {maximum: Settings.film.describe_maximum}
  scope :desc_create_time, -> {order(created_at: :desc)}
end


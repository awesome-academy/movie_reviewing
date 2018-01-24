class Film < ApplicationRecord
  has_many :film_categories, dependent: :destroy
  has_many :categories, through: :film_categories
  has_many :watching_days, dependent: :destroy
  has_many :watching_times, through: :watching_days
  has_many :ratings, dependent: :destroy
  has_many :users, through: :ratings
  validates :name, presence: true
  validates :play_time, presence: true
  validates :describe, presence: true,
    length: {maximum: Settings.film.describe_maximum}
  mount_uploader :image, PictureUploader
  accepts_nested_attributes_for :film_categories, allow_destroy: true
  accepts_nested_attributes_for :watching_days, allow_destroy: true
  scope :desc_create_time, -> {order(created_at: :desc)}
  FILM_STATUS = {"old": "0", "now_playing": "1", "comming_soon": "2"}

  def self.select_film
    select("id, name, play_time, imdb_rate, status, avg_rate")
  end

  def self.film_now_playing
    where(status: 1)
  end

  scope :search_film, -> (content){
    where("name LIKE ?", "%#{content}%")
  }

  def audience_score
    self.update_attributes avg_rate: Rating.average(:mark)
  end
end

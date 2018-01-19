class Rating < ApplicationRecord
  after_save :audience_score
  belongs_to :user
  belongs_to :film
  validates :mark, presence: true
  validates :review, presence: true,
    length: {maximum: Settings.rating.review_maximum}
  scope :desc_create_time, -> {order(updated_at: :desc)}

  def audience_score
    self.film.update_attributes avg_rate: Rating.average(:mark)
  end
end

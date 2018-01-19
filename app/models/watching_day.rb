class WatchingDay < ApplicationRecord
  belongs_to :film
  has_many :watching_times, dependent: :destroy
  accepts_nested_attributes_for :watching_times,
   reject_if: :reject_watching_times, allow_destroy: true

  def reject_watching_times(attributes)
    attributes["time"].blank?
  end
end

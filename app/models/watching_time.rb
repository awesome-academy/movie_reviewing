class WatchingTime < ApplicationRecord
  after_create :update_remanning_ticket
  belongs_to :watching_day
  has_one :booking

  def update_remanning_ticket
    self.update_attributes(remaining_ticket: self.total_ticket)
  end
end

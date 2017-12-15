class WatchingTime < ApplicationRecord
  belongs_to :film
  belongs_to :booking
end

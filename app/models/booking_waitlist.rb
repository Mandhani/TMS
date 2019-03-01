class BookingWaitlist < ApplicationRecord
  belongs_to :booking
  belongs_to :tour
end

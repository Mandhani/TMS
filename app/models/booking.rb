class Booking < ApplicationRecord
  attr_accessor :option
  belongs_to :user
  belongs_to :tour
  has_many :booking_waitlists, :dependent => :delete_all
end

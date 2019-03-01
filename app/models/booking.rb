class Booking < ApplicationRecord
  attr_accessor :option
  belongs_to :user
  belongs_to :tour
end

class Tour < ApplicationRecord
  has_many :bookings, :class_name => "Booking", :dependent => :delete_all
end

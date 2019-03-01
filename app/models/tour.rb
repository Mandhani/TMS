class Tour < ApplicationRecord
  has_many :booking_waitlists, :dependent => :delete_all
  has_many :bookings, :dependent => :delete_all
  validates :name, presence: true
  validates :description, presence: true
  validates :price, :presence => true,  numericality: true
  validates :booking_deadline, presence: true
  validates :duration_start, :duration_end, presence: true
  validate :before_start_date

  validate :end_date_after_start_date
  # validates :start_location, inclusion:{in:ISO3166::Country.all.map(&:alpha2)}

  validates :start_location, presence: true
  validates :itenary, presence: true
  validates :contact, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  validates :status, presence: true
  # validates :waitlist, presence: true

  #https://medium.com/lightthefuse/ruby-on-rails-date-validation-in-a-booking-and-disabling-dates-in-date-picker-3e5b4e9b4640


  def end_date_after_start_date
    return if duration_start.blank? || duration_end.blank?

    if duration_end < duration_start
      errors.add(:end_date, "must be after the start date")
    end
  end

  def before_start_date
    return if duration_start.blank? || booking_deadline.blank?

    if booking_deadline > duration_start
      errors.add(:end_date, "Booking deadline must be before start date")
    end
  end


end

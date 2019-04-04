class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
  validates :start_date, uniqueness: { scope: :event_venue, 
    message: "has already been taken using this venue" }
  validate :start_date_must_be_greater_than_date_of_creation
  
  def start_date_must_be_greater_than_date_of_creation
    if created_at.present? && start_date.present? && start_date < created_at
      errors.add(:start_date, "must be later than date of creation")
    end
  end
end

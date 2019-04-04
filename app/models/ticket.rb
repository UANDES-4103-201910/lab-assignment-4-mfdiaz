class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  before_create :ensure_created_before_start_date
  
  private
    def ensure_created_before_start_date
      if ticket_type.event.start_date.present? && ticket_type.event.start_date < Date.today
        raise ActiveRecord::RecordInvalid
      end
    end
end

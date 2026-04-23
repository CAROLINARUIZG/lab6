class Treatment < ApplicationRecord
  belongs_to :appointment

  validates :date, :reason, :status, presence: true
end

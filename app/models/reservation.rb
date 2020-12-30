class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :start_date,  presence: true
  validates :finish_date,  presence: true
  validates :people_num,  presence: true

end

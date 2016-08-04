class Attendence < ApplicationRecord
	belongs_to :employee
	validates :in_time, uniqueness: {scope: :employee_id} 
  scope :today, -> { where('in_time::DATE =?', Time.current) }
  scope :this_month, -> { where(in_time: (Time.current.beginning_of_month..Time.current.end_of_month)) }
  scope :late, -> { where(status: "Late") }
end

class Attendence < ApplicationRecord
	belongs_to :employee
	validates :in_time, uniqueness: {scope: :employee_id} 
end

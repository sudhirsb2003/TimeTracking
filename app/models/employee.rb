class Employee < ApplicationRecord
	has_many :attendences

	validates_presence_of :username
	validates_uniqueness_of :username
	validate :check_empty_space

	def check_empty_space
	  if self.username.match(/\s+/)
	    errors.add(:username, "No empty spaces please :(")
	  end
	end	
end


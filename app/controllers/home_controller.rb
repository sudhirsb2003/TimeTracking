class HomeController < ApplicationController
  def index
     @employees = Attendence.order(in_time: :desc)
     @attendences = @employees.to_a.group_by { |w| w.in_time.to_date }       
  end 

  # this method will do the logic
  def login_time
  	emp = Employee.where('lower(username) =?', params[:username].downcase).first
 	  # get the emp username if exists 
  	if emp.present?
  		Attendence.create(employee_id: emp.id, in_time: Time.now.in_time_zone)
      redirect_to root_url, notice: "Thank You #{emp.username} !, your arrival has been successfully tracked."
  		# attendence will be logged for the day.
  	else
  		redirect_to root_url, alert: 'sorry we could not find you, try again or make a new user if u are a new user'
  		# notifies if does not exists
  	end
  end
end

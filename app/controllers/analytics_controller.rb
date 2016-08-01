class AnalyticsController < ApplicationController
  def index
  	if params[:u_name].present?
  		@employee = Employee.where(username: params[:u_name]).first
  		time = @employee.attendences
  	else
  		time = Attendence.all
  	end
		t = time.collect{ |w| w.in_time.to_i }
		average_time = (t.sum/t.count)
		@average =  Time.zone.parse(DateTime.strptime(average_time.to_s,'%s').to_s)
  end
end

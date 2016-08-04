class AnalyticsController < ApplicationController
  def index
  	if params[:u_name].present?
  		@employee = Employee.where(username: params[:u_name]).first
  		@a = @employee.attendences
  	else
  		@a = Attendence.today
  	end
		t = @a.collect{ |w| w.in_time.to_i }
    if t.present? && @a.present?
		  @average_time = (t.sum/t.count)
		  @average =  Time.zone.parse(DateTime.strptime(@average_time.to_s,'%s').to_s)
    else
      @average = 0
      @average_time = 0
    end
  end
end

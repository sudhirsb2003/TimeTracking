module ApplicationHelper
def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def get_attendences(name = nil)
    if name.present?
      name.attendences
    else  
      Attendence.all
    end
  end

  def attendence_status(a)
    in_time = a.in_time.strftime("%H:%M:%P")
    login_time_decided_by_office = Time.parse('10:00 am').strftime("%H:%M:%P")
    if in_time > login_time_decided_by_office
      a.update_attributes(status: 'Late')
      "<span class='btn btn-xs btn-danger'> #{a.status} </span>".html_safe
    else
      a.update_attributes(status: 'On Time')
      "<span class='btn btn-xs btn-success'> #{a.status} </span>".html_safe
    end
  end

  def average_late(date)
    
  end

  def averate_on_time(date)
    
  end

end


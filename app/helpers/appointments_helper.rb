module AppointmentsHelper

  # def user_option
  # end

  # def check
  #   # appointment = Appointment.new appointment_params
  #     date = params[:appointment][:appointment_date] + ' ' + params[:appointment][:appointment_time]
  #     appointment.appointment_date = date
  #     #initialise
  #     taken = false

  #     #validate date is in-range(Mon-Fri), time is in-range(0900-1700)
  #      check = DateTime.parse(appointment.appointment_date.to_s)

  #     # check = Time.local(appointment.appointment_date)
  #     if check.wday == 6 || check.wday == 7
  #         flash[:notice] = "Please chose Mon-Fri."
  #         render :new
  #      elsif check.hour > 9 || check.hour < 17
  #         flash[:notice] = "Please chose the range between 09:00-17:00. Last appointment time is 16:00"
  #        render :new
  #     elsif
  #       taken = true
  #       appointment.save
  #       flash[:notice]= "Appointment is saved."
  #       redirect_to appointment
  #      else
  #        render :new
  #     end
  #   end

end

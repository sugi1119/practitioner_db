class AppointmentsController < ApplicationController

  def index
       # raise'err'
    @appointments = Appointment.order('appointment_date ASC').all

    # raise
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new appointment_params
    date = params[:appointment][:appointment_date] + ' ' + params[:appointment][:appointment_time]
    @appointment.appointment_date = date
    ###initialise for validate the timeslot is taken
    @appointment[:taken] = false

    ###validate date is in-range(Mon-Fri), time is in-range(0900-1700)
    @check = DateTime.parse(@appointment.appointment_date.to_s)

    @check_taken = Appointment.where(taken: true)

    if check_valid
        @appointment[:taken] = true
        @appointment.save
        flash[:notice]= "Appointment is saved."
        redirect_to @appointment
        return
      else
        render :new
      end

  end


  def edit
    @appointment = Appointment.find params[:id]
  end

  def show
    @appointment = Appointment.find params[:id]
    # @appointments = Appointment.all
  end

  def update
    @appointment = Appointment.find params[:id]
    date = params[:appointment][:appointment_date] + ' ' + params[:appointment][:appointment_time]
    @appointment.appointment_date = date

    ###initialise for validate the timeslot is taken
    @appointment[:taken] = false

    ###validate date is in-range(Mon-Fri), time is in-range(0900-1700)
    @check = DateTime.parse(@appointment.appointment_date.to_s)

    @check_taken = Appointment.where(taken: true)

    if check_valid
        @appointment[:taken] = true
        @appointment.update appointment_params
        flash[:notice] = "Appointment is updated."
        redirect_to @appointment
        return
      else
        render :edit
      end
  end

  def destroy
    appointment = Appointment.find params[:id]
    appointment.destroy

    redirect_to appointments_path
  end

  private
    def appointment_params
      params.require(:appointment).permit(:practitioner_id, :patient_id, :taken)
    end

    def check_valid
      @check_taken.each do |c|
        if DateTime.parse(c.appointment_date.to_s) == @check
          # raise 'err'
          flash[:notice] = "Unable to book due to duble booking."
          return false
        else
              ### check = Time.local(appointment.appointment_date)s
          if @check.wday == 6 || @check.wday == 7
              flash[:notice] = "Please chose Mon-Fri."
              return false
          elsif @check.hour < 9 || @check.hour > 17
              flash[:notice] = "Please chose the range between 09:00-17:00. Last appointment time is 16:00"
             return false
          else
            return true
          end
        end
      end

    end

end

# t.datetime "appointment_date"
# t.integer  "practitioner_id"
# t.integer  "patient_id"


 #     appointments GET    /appointments(.:format)           appointments#index
 #                  POST   /appointments(.:format)           appointments#create
 #  new_appointment GET    /appointments/new(.:format)       appointments#new
 # edit_appointment GET    /appointments/:id/edit(.:format)  appointments#edit
 #      appointment GET    /appointments/:id(.:format)       appointments#show
 #                  PATCH  /appointments/:id(.:format)       appointments#update
 #                  PUT    /appointments/:id(.:format)       appointments#update
 #                  DELETE /appointments/:id(.:format)       appointments#destroy
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
# raise 'err'
    # @end_time = @appointment.appointment_date + 1.hour

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

        #check if the practitioner is already booked or not
        #1. check new booking date/time is same with the taken one or not
        #2. check practitioner_id is same or not
        #3. check the appointment is not overlapped. 1 appointment needs 1 hour.
        #4. if same patient / same pracititoner / same date, but change booking time to original booking time within +-1 hour, should be changed.
        @check_taken.each do |c|
          if c.practitioner_id == @appointment.practitioner_id
            if DateTime.parse(c.appointment_date.to_s) == @check
              flash[:notice] = "The practitioner is unavailable. Please check the other day/time"
              return false
            elsif Date.parse(c.appointment_date.to_s) == Date.parse(@check.to_s)
              if (@check.hour - c.appointment_date.hour) > -1 && (@check.hour - c.appointment_date.hour) < 1
                flash[:notice] = "Each consultation needs 1 hour. Please chose other day/time.#{@check.hour - c.appointment_date.hour}"

                return false
              end
            end
          end
        end


        #check the appointment made for business day / hour.
          if @check.wday == 6 || @check.wday == 7
              flash[:notice] = "Please chose Mon-Fri."
              return false
          elsif @check.hour < 9 || @check.hour >= 16
              flash[:notice] = "Please chose the range between 09:00-16:00. Last appointment time is 16:00"
             return false
          else
            return true
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
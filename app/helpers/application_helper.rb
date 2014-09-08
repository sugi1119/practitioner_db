module ApplicationHelper
  def smartnav
    links = ''
    if @current_user.try(:is_admin)
      links += "<li>" + link_to('View practitioners', practitioners_path) + "</li>"
    end

    if @current_user.present?
      links += "<li>"
      links += link_to('Logout ' + @current_user.email, login_path, :data => {:method => :delete, :confirm => 'Really logout?'})
      links += "</li>"

      links += '<li class="dropdown">'
      links += '<a href="#" class="dropdown-toggle" data-toggle="dropdown">Appointment<span class="caret"></span></a>'
      links += '<ul class="dropdown-menu" role="menu">'
      links += "<li>#{ link_to('Appointment information', appointments_path) }</li>"
      links += "<li>#{ link_to('Create new appointment', new_appointment_path) }</li>"
      links += '</ul>'

      links += '<a href="#" class="dropdown-toggle" data-toggle="dropdown">Patient<span class="caret"></span></a>'
      links += '<ul class="dropdown-menu" role="menu">'
      links += "<li>#{ link_to('Patient information', patients_path) }</li>"
      links += "<li>#{ link_to('Register new patient', new_patient_path) }</li>"
      links += '</ul>'

      links += '<a href="#" class="dropdown-toggle" data-toggle="dropdown">Supplement<span class="caret"></span></a>'
      links += '<ul class="dropdown-menu" role="menu">'
      links += "<li>#{ link_to('Supplement list', supplements_path) }</li>"
      links += "<li>#{ link_to('Register new supplement', new_supplement_path) }</li>"
      links += '</ul>'
      links += '</li>'

      links += "<li>#{ link_to('Invoice', invoices_path)}</li>"

      # links += "<li>#{ link_to('Service menu list', menus_path) }</li>"
      # links += "<li>#{ link_to('Register new service menu', new_menu_path) }</li>"



    else
      links += "<li>#{ link_to('Sign up', new_practitioner_path) }</li>"
      links += "<li>#{ link_to('Sign in', login_path) }</li>"

    end
      links
 end
end


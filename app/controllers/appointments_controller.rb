class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all.includes(:pet, :vet)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:pet_id, :vet_id, :status, :appointment_date, :reason)
  end
end

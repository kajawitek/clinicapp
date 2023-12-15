# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def new
    patient = Patient.find(params[:patient])
    appointment = Appointment.new(patient: patient)
    appointment_slot = AppointmentSlot.find(params[:appointment_slot])

    render :new, locals: { appointment: appointment, patient: patient, appointment_slot: appointment_slot }
  end

  def create
    appointment = Appointment.new(appointment_params)
    service = BookAppointmentService.new(appointment: appointment, appointment_slot: appointment.appointment_slot)
    service.call

    if service.errors.blank?
      redirect_to patients_path, notice: 'Appointment booked successfully!'
    else
      handle_error(appointment, service.errors)
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :price, :appointment_slot_id)
  end

  def handle_error(appointment, errors)
    flash.now[:alert] = 'Appointment not booked!'
    render :new, notice: errors.join(', '),
                 locals: { appointment: appointment, patient: appointment.patient,
                           appointment_slot: appointment.appointment_slot }
  end
end

# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def new
    patient = Patient.find(params[:patient])
    appointment = Appointment.new(patient: patient)
    slot = AppointmentSlot.find(params[:slot])

    render :new, locals: { appointment: appointment, patient: patient, slot: slot }
  end

  def create
    appointment = Appointment.new(appointment_params)
    notice_unavailable_slot = 'Appointment slot is unavailable. Please select another from the list below'

    redirect_to appointment_slots_path, notice: notice_unavailable_slot unless appointment.appointment_slot.available?

    begin
      ActiveRecord::Base.transaction do
        appointment.save!
        appointment.appointment_slot.update!(available: false)

        redirect_to patients_path, notice: 'Appointment booked successfully!'
      end
    rescue ActiveRecord::RecordInvalid => e
      patient = appointment.patient
      slot = appointment.appointment_slot
      flash.now[:alert] = 'Appointment not booked!'

      render :new, notice: e.message, locals: { appointment: appointment, patient: patient, slot: slot }
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :price, :appointment_slot_id)
  end
end

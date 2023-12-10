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

    if appointment.save
      redirect_to patients_path, notice: 'Appointment created successfully!'
    else
      patient = Patient.find(appointment_params[:patient_id])
      slot = AppointmentSlot.find(appointment_params[:appointment_slot_id])
      flash.now[:alert] = 'Appointment not created!'

      render :new, locals: { appointment: appointment, patient: patient, slot: slot }
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :price, :appointment_slot_id)
  end
end

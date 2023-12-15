# frozen_string_literal: true

class AppointmentSlotsController < ApplicationController
  def index
    q = AppointmentSlot.ransack(params[:q])
    items_amount = 10
    pagy, available_appointment_slots = pagy(q.result(distinct: true).where(available: true).includes(:doctor),
                                            items: items_amount)

    render :index, locals: { q: q, available_appointment_slots: available_appointment_slots, pagy: pagy,
                             items_amount: items_amount, doctors: Doctor.doctors_for_select, patient: patient }
  end

  private

  def patient
    @patient ||= Patient.find(params[:patient]) if params[:patient]
  end
end

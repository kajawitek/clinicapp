# frozen_string_literal: true

class AppointmentSlotsController < ApplicationController
  def index
    q = AppointmentSlot.ransack(params[:q])
    items_amount = 10
    pagy, appointment_slots = pagy(q.result(distinct: true).includes(:doctor), items: items_amount)
    doctors = Doctor.joins(:appointment_slots).distinct.map { |doctor| [doctor.full_name, doctor.id] }

    render :index, locals: { q: q,
                             appointment_slots: appointment_slots,
                             pagy: pagy,
                             items_amount: items_amount,
                             doctors: doctors }
  end
end

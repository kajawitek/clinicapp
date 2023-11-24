# frozen_string_literal: true

class PatientsController < ApplicationController
  def index
    q = Patient.ransack(params[:q])
    items_amount = 5
    pagy, patients = pagy(q.result(distinct: true), items: items_amount)
    render :index, locals: { q: q, patients: patients, pagy: pagy, items_amount: items_amount }
  end
end

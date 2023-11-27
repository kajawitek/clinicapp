# frozen_string_literal: true

class PatientsController < ApplicationController
  def index
    q = Patient.ransack(params[:q])
    q.sorts = 'created_at asc' if q.sorts.empty?
    items_amount = 10
    pagy, patients = pagy(q.result(distinct: true), items: items_amount)
    render :index, locals: { q: q, patients: patients, pagy: pagy, items_amount: items_amount }
  end
end

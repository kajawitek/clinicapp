# frozen_string_literal: true

class PatientsController < ApplicationController
  def index
    q = Patient.ransack(params[:q])
    patients = q.result(distinct: true)
    render :index, locals: { q: q, patients: patients }
  end
end

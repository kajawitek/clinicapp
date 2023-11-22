# frozen_string_literal: true

class PatientsController < ApplicationController
  def index
    render :index, locals: { patients: Patient.all }
  end
end

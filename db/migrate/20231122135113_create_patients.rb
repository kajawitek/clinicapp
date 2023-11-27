# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :pesel, null: false, index: { unique: true }
      t.string :gender, null: false
      t.datetime :date_of_birth, null: false
      t.string :city, null: false

      t.timestamps
    end
  end
end

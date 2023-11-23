# frozen_string_literal: true

class ChangeDateFormatInPatientsTable < ActiveRecord::Migration[7.1]
  def up
    change_column :patients, :date_of_birth, :date
  end

  def down
    change_column :my_table, :my_column, :datetime
  end
end

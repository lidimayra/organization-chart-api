# frozen_string_literal: true

class AddManagerToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :manager
    add_foreign_key :employees, :employees, column: :manager_id
  end
end

# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }

      t.references :company, foreign_key: true, null: false
      t.timestamps
    end
  end
end

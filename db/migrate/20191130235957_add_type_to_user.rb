# frozen_string_literal: true

class AddTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, default: 'teacher', null: false
  end
end

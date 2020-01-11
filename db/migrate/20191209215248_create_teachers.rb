# frozen_string_literal: true

class CreateTeachers < ActiveRecord::Migration[6.0]
  def up
    create_table :teachers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.references :user
    end

    User.all.each do |u|
      Teacher.create(user: u, first_name: u.first_name, last_name: u.last_name)
    end

    remove_column :users, :first_name
    remove_column :users, :last_name
  end

  def down
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    Teacher.all.each do |t|
      t.user.update(first_name: t.first_name, last_name: t.last_name)
    end

    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name, :string, null: false
    drop_table :teachers
  end
end

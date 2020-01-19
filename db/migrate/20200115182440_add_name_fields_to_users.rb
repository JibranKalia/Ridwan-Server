class AddNameFieldsToUsers < ActiveRecord::Migration[6.0]
  def up 
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    Teacher.all.each do |t|
      t.user&.update(first_name: t.first_name, last_name: t.last_name)
    end

    change_column_null :users, :first_name, false, 'First Name'
    change_column_null :users, :last_name, false, 'Last Name'

    remove_column :teachers, :first_name
    remove_column :teachers, :last_name
  end

  def down
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string

    Teacher.all.each do |teacher|
      u = teacher.user
      break if u.nil?
      teacher.update(first_name: u.first_name, last_name: u.last_name)
    end

    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end

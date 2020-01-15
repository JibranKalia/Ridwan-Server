class AddNameFieldsToUsers < ActiveRecord::Migration[6.0]
  def up 
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    Teacher.all.each do |t|
      t.user&.update(first_name: t.first_name, last_name: t.last_name)
    end

    User.where(first_name: nil).each do |u|
      u.update(first_name: "First Name")
    end

    User.where(last_name: nil).each do |u|
      u.update(last_name: "Last Name")
    end

    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name, :string, null: false

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

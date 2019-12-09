class CreateIndividuals < ActiveRecord::Migration[6.0]
  def up 
    create_table :individuals do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :type, null: false
      t.references :user
    end

    User.all.each do |u|
      Individual.create(user: u, first_name: u.first_name, last_name: u.last_name, type: 'teacher')
    end

    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :type
  end

  def down
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :type, :string, default: 'teacher', null: false

    Individual.where.not(user_id: nil).each do |p|
      p.user.update(first_name: p.first_name, last_name: p.last_name)
    end

    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name, :string, null: false
    drop_table :individuals
  end
end

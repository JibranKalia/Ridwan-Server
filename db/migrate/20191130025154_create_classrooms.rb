class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms do |t|
      t.string :name, null: false
      t.references :user, index: true, foreign_key: true
    end
  end
end

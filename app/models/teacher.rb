# == Schema Information
#
# Table name: teachers
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  user_id    :bigint
#
# Indexes
#
#  index_teachers_on_user_id  (user_id)
#

class Teacher < ApplicationRecord
  belongs_to :user
  has_many :classrooms
  has_many :enrollments, through: :classrooms

  validates :first_name, presence: true
  validates :last_name, presence: true
end

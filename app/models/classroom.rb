# == Schema Information
#
# Table name: classrooms
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  teacher_id :bigint           not null
#
# Indexes
#
#  index_classrooms_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (teacher_id => teachers.id)
#

class Classroom < ApplicationRecord
  belongs_to :user, required: true
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :user_id }
end

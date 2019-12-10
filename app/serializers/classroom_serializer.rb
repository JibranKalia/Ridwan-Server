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

class ClassroomSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :enrollments
  has_many :students
end

# frozen_string_literal: true

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
  belongs_to :teacher
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
  has_many :lesson_types

  after_create_commit :create_default_lesson_types
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :teacher_id }

  DEFAULT_LESSON_TYPES = ['New Lesson', 'New Revision', 'Revision']

  def create_default_lesson_types
    DEFAULT_LESSON_TYPES.each_with_index do |name, index|
      LessonType.find_or_create_by(classroom_id: id, name: name, position: index + 1)
    end
  end
end

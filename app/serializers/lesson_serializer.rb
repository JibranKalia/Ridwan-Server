# == Schema Information
#
# Table name: lessons
#
#  id            :bigint           not null, primary key
#  date          :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  enrollment_id :bigint           not null
#
# Indexes
#
#  index_lessons_on_enrollment_id  (enrollment_id)
#
# Foreign Keys
#
#  fk_rails_...  (enrollment_id => enrollments.id)
#

class LessonSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :type, :from_surah, :from_ayah, :to_surah, :to_ayah

  belongs_to :enrollment
  has_many :lesson_items
end

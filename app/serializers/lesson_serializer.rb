# == Schema Information
#
# Table name: lessons
#
#  id            :bigint           not null, primary key
#  date          :date             not null
#  name          :string           not null
#  type          :string           default("type_one"), not null
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
  attributes :id, :name, :date, :type

  belongs_to :enrollment
end

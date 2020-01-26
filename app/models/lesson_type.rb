# == Schema Information
#
# Table name: lesson_types
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  position     :integer          default(1), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :bigint           not null
#
# Indexes
#
#  index_lesson_types_on_classroom_id  (classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#

class LessonType < ApplicationRecord
  validates :name, presence: true
  validates :position, presence: true, uniqueness: { scope: :classroom_id }
  belongs_to :classroom
end

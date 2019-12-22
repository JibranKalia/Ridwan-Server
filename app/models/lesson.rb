# == Schema Information
#
# Table name: lessons
#
#  id            :bigint           not null, primary key
#  date          :date             not null
#  from_ayah     :integer
#  from_surah    :integer
#  name          :string           not null
#  to_ayah       :integer
#  to_surah      :integer
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

class Lesson < ApplicationRecord
  self.inheritance_column = 'column_that_is_not_type'
  extend Enumerize
  validates :name, presence: true
  validates :date, presence: true
  validates :type, presence: :true

  belongs_to :enrollment
  enumerize :type, in: [:type_one, :type_two, :type_three]
end

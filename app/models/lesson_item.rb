# frozen_string_literal: true

# == Schema Information
#
# Table name: lesson_items
#
#  id          :bigint           not null, primary key
#  from_ayah   :integer
#  from_surah  :integer
#  name        :string           not null
#  quality_one :integer          default(0), not null
#  quality_two :integer          default(0), not null
#  to_ayah     :integer
#  to_surah    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  lesson_id   :bigint
#
# Indexes
#
#  index_lesson_items_on_lesson_id  (lesson_id)
#
# Foreign Keys
#
#  fk_rails_...  (lesson_id => lessons.id)
#

class LessonItem < ApplicationRecord
  belongs_to :lesson

  validates :name, presence: true
  validates :from_surah, presence: true
  validates :from_ayah, presence: true
  validates :to_surah, presence: true
  validates :to_ayah, presence: true
  validates :quality_one, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quality_two, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

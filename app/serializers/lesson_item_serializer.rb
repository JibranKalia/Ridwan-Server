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
#  rating      :integer
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

class LessonItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :from_surah, :from_ayah, :to_surah, :to_ayah, :quality_one, :quality_two, :rating

  belongs_to :lesson
end

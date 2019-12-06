# == Schema Information
#
# Table name: classrooms
#
#  id      :bigint           not null, primary key
#  name    :string           not null
#  user_id :bigint
#
# Indexes
#
#  index_classrooms_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Classroom < ApplicationRecord
  belongs_to :user, required: true
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :user_id }
end

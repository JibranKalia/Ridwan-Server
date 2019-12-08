# == Schema Information
#
# Table name: enrollments
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :bigint           not null
#  student_id   :bigint           not null
#
# Indexes
#
#  index_enrollments_on_classroom_id  (classroom_id)
#  index_enrollments_on_student_id    (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (student_id => students.id)
#

class Enrollment < ApplicationRecord
  belongs_to :classroom
  belongs_to :student
end

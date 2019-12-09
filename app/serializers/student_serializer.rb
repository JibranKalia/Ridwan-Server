# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name

  has_many :enrollments
  has_many :classrooms
end

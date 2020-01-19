# frozen_string_literal: true

# == Schema Information
#
# Table name: teachers
#
#  id      :bigint           not null, primary key
#  user_id :bigint
#
# Indexes
#
#  index_teachers_on_user_id  (user_id)
#

class Teacher < ApplicationRecord
  belongs_to :user

  has_many :classrooms, dependent: :destroy
  has_many :enrollments, through: :classrooms

  validates :user_id, uniqueness: true
end

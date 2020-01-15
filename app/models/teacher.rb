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

  auto_strip_attributes :first_name, :last_name

  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]*\z/, message: 'Can only be letters' }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]*\z/, message: 'Can only be letters' }
end

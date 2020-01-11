# frozen_string_literal: true

# == Schema Information
#
# Table name: teachers
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  user_id    :bigint
#
# Indexes
#
#  index_teachers_on_user_id  (user_id)
#

class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name

  belongs_to :user
end

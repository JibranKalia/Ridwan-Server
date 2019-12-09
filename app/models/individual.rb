# == Schema Information
#
# Table name: individuals
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  type       :string           not null
#  user_id    :bigint
#
# Indexes
#
#  index_individuals_on_user_id  (user_id)
#

class Individual < ApplicationRecord
  self.inheritance_column = 'column_that_is_not_type'
  extend Enumerize

  belongs_to :user, optional: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :type, presence: true

  enumerize :type, in: [:teacher, :student], predicates: true
end

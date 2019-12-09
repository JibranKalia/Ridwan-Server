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

class IndividualSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name

  belongs_to :user
end

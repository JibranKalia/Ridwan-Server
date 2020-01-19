# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  image                  :string
#  last_name              :string           not null
#  nickname               :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("none"), not null
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

class User < ApplicationRecord
  extend Enumerize
  devise :database_authenticatable, :recoverable,
         :validatable, :registerable

  include DeviseTokenAuth::Concerns::User
  has_one :teacher, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 

  validates :first_name, presence: true, format: { with: /\A[a-zA-Z0-9 ]*\z/, message: 'Can only be letters' }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z0-9 ]*\z/, message: 'Can only be letters' }

  enumerize :role, in: %i[none teacher student], predicates: true, required: true

  auto_strip_attributes :first_name, :last_name
end

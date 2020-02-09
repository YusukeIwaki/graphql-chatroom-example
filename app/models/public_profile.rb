# == Schema Information
#
# Table name: public_profiles
#
#  id           :bigint           not null, primary key
#  display_name :string           not null
#  email        :string
#  github       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_public_profiles_on_display_name  (display_name) UNIQUE
#  index_public_profiles_on_user_id       (user_id) UNIQUE
#

class PublicProfile < ApplicationRecord
  belongs_to :user

  validates :display_name,
    format: { with: /\A[a-zA-Z](\.?[a-zA-Z0-9]+)*\z/, allow_blank: true }, # alphanumeric
    presence: true,
    uniqueness: true

  validates :email,
    email: { allow_blank: true }

  validates :github,
    uniqueness: true
end

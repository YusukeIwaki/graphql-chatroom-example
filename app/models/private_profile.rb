# == Schema Information
#
# Table name: private_profiles
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  real_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_private_profiles_on_email    (email) UNIQUE
#  index_private_profiles_on_user_id  (user_id) UNIQUE
#

class PrivateProfile < ApplicationRecord
  belongs_to :user

  validates :email,
    email: { allow_blank: true },
    presence: true,
    uniqueness: true

  validates :real_name,
    presence: true
end

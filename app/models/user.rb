class User < ApplicationRecord
   has_many :articles,dependent: :destroy
  # validates :email, uniqueness: true,presence: true
  validates :username, uniqueness: true,uniqueness: {case_sensitive: false},presence: true

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

   validates :email, presence: true, length: { maximum: 105 },

             uniqueness: { case_sensitive: false },

             format: { with: VALID_EMAIL_REGEX }
   has_secure_password

  end

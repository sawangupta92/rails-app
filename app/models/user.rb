class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  def self.ransackable_attributes(auth_object = nil)
    ["admin", "created_at", "email", "id", "id_value", "password_digest", "updated_at"]
  end
end

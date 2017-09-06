class User < ApplicationRecord
  validates :email, :hashed_password, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :email, uniqueness: { case_sensitive: false }

  def password
    hashed_password
  end

  def password=(password)
    @password = password
  end

  def self.hash_password(password)
    Digest::MD5.hexdigest(password)
  end

  private

  def initialize(attributes = {})
    attributes[:hashed_password] ||= User.hash_password(attributes[:password]) # Same as bash
    super(attributes)
  end
end

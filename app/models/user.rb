class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
                    before_validation { email.downcase! }
  validates :password, length: { minimum: 6 }, on: :create
  has_secure_password
  has_many :tasks, dependent: :destroy
  before_destroy :destroy_restrict

  def destroy_restrict
    throw :abort if self.authority && User.where(authority: true).count == 1
  end
end

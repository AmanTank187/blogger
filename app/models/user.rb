class User < ApplicationRecord 
    before_save { self.email = email.downcase }
    has_many :articles, dependent: :destroy #Articles depend on a user so when a user is deleted the articles will also be deleted. 
    validates :username, presence: true, length: {minimum: 3, maximum: 30 }, uniqueness: {case_sensitive: false}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 105 }, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
    has_secure_password
end 
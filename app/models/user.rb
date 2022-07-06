class User < ApplicationRecord
    require "securerandom" 
    has_secure_password

    #has_many :posts, dependent: :destroy
    #has_many :comments, dependent: :destroy
    #has_many :likes, dependent: :destroy

    validates :email, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }


end

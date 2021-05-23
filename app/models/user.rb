class User < ApplicationRecord
    has_secure_password
    has_many :phones
    has_many :macbooks
    has_many :ipads
  
    validates :name, :username, presence: true
    validates :username, uniqueness: true
  end
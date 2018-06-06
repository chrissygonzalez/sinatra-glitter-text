class User < ActiveRecord::Base
    validates_presence_of :username, :email, :password
    
    has_many :drawings
    has_secure_password
end
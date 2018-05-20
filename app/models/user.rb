class User < ActiveRecord::Base
    has_many :drawings
    has_secure_password
end
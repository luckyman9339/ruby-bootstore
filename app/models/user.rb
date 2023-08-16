class User < ApplicationRecord
    has_secure_password

    validates_presence_of :email

    def admin?
        role == 'admin'
    end

    def user?
        role == 'user'
    end
end

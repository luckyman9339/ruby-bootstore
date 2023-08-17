class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email

    # after_initialize :set_defaults

    # def set_defaults
    #     self.user_role ||= "user"
    # end
end

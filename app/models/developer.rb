class Developer < ApplicationRecord
    has_many :projects
    has_secure_password

    def self.create_with_omniauth(auth)
        Developer.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            # We can assign the user a password, if they are going through oauth
            u.password = SecureRandom.hex(16)
           end 
    end 
end

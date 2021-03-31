class Developer < ApplicationRecord
    has_many :projects
    has_secure_password
end

class Technology < ApplicationRecord
    has_many :resources
    has_many :projects, through: :resources
end

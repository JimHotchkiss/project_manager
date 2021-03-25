class Project < ApplicationRecord
    has_many :resources
    has_many :technologies, through: :resources
end

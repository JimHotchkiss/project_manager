class ProjectTechnology < ApplicationRecord
    belongs_to :technology 
    belongs_to :project 
end

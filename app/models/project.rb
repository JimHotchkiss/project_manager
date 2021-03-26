class Project < ApplicationRecord
    has_many :project_technologies
    has_many :technologies, through: :project_technologies
    # accepts_nested_attributes_for :technologies, reject_if: proc { |attributes|  attributes['name'].blank?  }
  
    def technologies_attributes=(technologies_attributes)
        technologies_attributes.values.each do |technology_attribute|
            if !technology_attribute["name"].blank?
                technology = Technology.find_or_create_by(name: technology_attribute["name"])
                self.project_technologies.build(:technology => technology)
            end 
        end
    end
end

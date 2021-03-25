class Project < ApplicationRecord
    has_many :project_technologies
    has_many :technologies, through: :project_technologies

    accepts_nested_attributes_for :technologies

    def technologies_attributes=(technology_attributes)
        technology_attributes.values.each do |technology_attribute|
        technology = Technology.find_or_create_by(technology_attribute)
        self.technologies << technology
        end
    end
end

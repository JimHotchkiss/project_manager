class Project < ApplicationRecord
    has_many :resources
    has_many :technologies, through: :resources

    def resources_attributes=(resources_attributes)
        resources_attributes.values.each do |resource_attribute|
            if !resource_attribute[:url].blank?
                self.resources << Resource.create(resource_attribute)
            end 
        end
    end


end

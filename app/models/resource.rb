class Resource < ApplicationRecord
    belongs_to :project
    belongs_to :technology

    def technology_attributes=(technology_attribute)
        if !technology_attribute[:name].blank?
            self.technology = Technology.find_or_create_by(name: technology_attribute[:name])
        end 
    end 


   
end

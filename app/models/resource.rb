class Resource < ApplicationRecord
    belongs_to :project
    belongs_to :technology

    def technology_attributes=(technology_attribute)
        if !technology_attribute[:name].blank? 
            self.technology = Technology.find_or_create_by(technology_attribute)
        end 
    end 

    # && !Technology.find_by(name: technology_attribute[:name])
    #         binding.pry
    #         self.technology = Technology.create(name: technology_attribute[:name])


   
end

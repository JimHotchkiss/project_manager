class Project < ApplicationRecord
    has_many :resources
    has_many :technologies, through: :resources
  
    # def technologies_attributes=(technologies_attributes)
    #     technologies_attributes.values.each do |technology_attribute|
    #         if !technology_attribute[:name].blank?
    #             technology = Technology.find_or_create_by(name: technology_attribute[:name])
    #             self.resources.build(:technology => technology)
    #         end 
    #     end
    # end

    def resources_attributes=(resources_attributes)
        resources_attributes.values.each do |resource_attribute|
            if !resource_attribute[:url].blank?
                # self.resource_build(url: resource_attribute[:url])
                self.resources << Resource.create(resource_attribute)
            end 
        end
    end


end

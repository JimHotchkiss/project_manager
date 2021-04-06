class Project < ApplicationRecord
    has_many :resources, dependent: :delete_all
    has_many :technologies, through: :resources
    belongs_to :developer, optional: true
    has_many :tasks

    validates :title, presence: true
    validates :description, presence: true

    def resources_attributes=(resources_attributes)
        resources_attributes.values.each do |resource_attribute|
            if !resource_attribute[:url].blank?
                self.resources << Resource.create(resource_attribute)
            end 
        end
    end


end

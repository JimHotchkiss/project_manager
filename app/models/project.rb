class Project < ApplicationRecord
    has_many :resources
    has_many :technologies, through: :resources
    accepts_nested_attributes_for :technologies, reject_if: proc { |attributes| attributes['name'].blank? }

    # def technologies_attributes=(technology_attributes)
    #     technology_attributes.values.each do |technology_attribute|
    #     technology = Technology.find_or_create_by(technology_attribute)
    #         unless self.technologies.include?(technology) 
    #             self.technologies << technology 
    #         end
    #     end
    # end
end

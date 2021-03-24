class CreateProjectTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :project_technologies do |t|
      t.string :name
      t.belongs_to :project, foreign_key: true
      t.belongs_to :technology, foreign_key: true
      t.timestamps
    end
  end
end

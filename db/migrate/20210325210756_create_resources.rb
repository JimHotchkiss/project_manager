class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :url
      t.belongs_to :technology, foreign_key: true
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :number_of_developers
      t.text :description
      t.integer :developer_id

      t.timestamps
    end
  end
end

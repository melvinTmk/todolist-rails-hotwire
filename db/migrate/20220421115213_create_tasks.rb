class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :description, limit: 200
      t.boolean :completed
      t.integer :position
      t.timestamps
    end
  end
end

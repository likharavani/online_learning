class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.decimal :price,:precision => 8, :scale => 2
      t.string :description
      t.timestamps
    end
  end
end

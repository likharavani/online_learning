class CreatePdfs < ActiveRecord::Migration[7.0]
  def change
    create_table :pdfs do |t|
      t.string :name
      t.string :path
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end

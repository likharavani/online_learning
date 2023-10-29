class CreateProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.integer  :pdf_watched,default:0
      t.float :percentage_completion,default:0.0
      t.timestamps
    end
  end
end

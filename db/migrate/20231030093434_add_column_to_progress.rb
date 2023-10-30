class AddColumnToProgress < ActiveRecord::Migration[7.0]
  def change
    add_column :progresses, :pdf_watched_history, :string, array: true, default: []
  end
end

class Renametable < ActiveRecord::Migration[7.0]
  def change
    rename_table :courses_users, :history
  end
end

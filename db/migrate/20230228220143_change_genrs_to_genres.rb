class ChangeGenrsToGenres < ActiveRecord::Migration[6.1]
  def change
    rename_table :genrs, :genres
  end
end

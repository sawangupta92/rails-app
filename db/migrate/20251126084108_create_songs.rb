class CreateSongs < ActiveRecord::Migration[8.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.integer :duration
      t.string :genre
      t.date :release_date

      t.timestamps
    end
  end
end

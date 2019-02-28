class CreateGraffittis < ActiveRecord::Migration[5.2]
  def change
    create_table :graffittis do |t|
      t.string :title
      t.string :description
      t.string :location
      t.integer :artist_id

      t.timestamps
    end
  end
end

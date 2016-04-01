class CreateClassVideos < ActiveRecord::Migration
  def change
    create_table :class_videos do |t|
      t.string :title
      t.string :speakers
      t.string :cover_image
      t.integer :play_count
      t.string :video
      t.string :description
      t.timestamps null: false
    end
  end
end

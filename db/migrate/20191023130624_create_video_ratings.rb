class CreateVideoRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :video_ratings do |t|
      t.float :rate
      t.text :comment
      t.references :end_user, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end
  end
end

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :end_user, foreign_key: true
      t.references :video, foreign_key: true

      t.index [:end_user_id, :video_id], unique: true
      t.timestamps
    end
  end
end

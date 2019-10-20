class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos , :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'  do |t|
      t.string :title
      t.string :video
      t.integer :limit
      t.integer :views,default: 0
      t.text :description
      t.integer :category_id, foreign_key: true
      t.integer :end_user_id, foreign_key: true
      t.timestamps
    end
  end
end

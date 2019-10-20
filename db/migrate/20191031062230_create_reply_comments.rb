class CreateReplyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_comments do |t|
      t.text :comment
      t.references :video_rating, foreign_key: true
      t.timestamps
    end
  end
end

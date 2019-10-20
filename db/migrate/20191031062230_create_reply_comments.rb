class CreateReplyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_comments,:options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.text :comment
      t.references :video_rating, foreign_key: true
      t.timestamps
    end
  end
end

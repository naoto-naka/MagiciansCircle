class AddEndUserIdToReplyComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :reply_comments, :end_user, foreign_key: true
  end
end

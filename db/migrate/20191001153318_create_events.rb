class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :fee
      t.string :venue
      t.text :address
      t.text :description
      t.string :access
      t.text :official_site
      t.references :end_user, foreign_key: true
      t.string :image
      t.timestamps
    end
  end
end

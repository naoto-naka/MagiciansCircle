class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end

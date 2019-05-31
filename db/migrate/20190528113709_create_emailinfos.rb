class CreateEmailinfos < ActiveRecord::Migration[5.1]
  def change
    create_table :emailinfos do |t|
      t.string :uniqueid
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end

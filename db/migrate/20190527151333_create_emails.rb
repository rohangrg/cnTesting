class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :from
      t.string :to
      t.string :subject
      t.string :body
      t.string :timing
      t.string :uniqueid

      t.timestamps
    end
  end
end

class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :fname
      t.string :lname
      t.text :bio

      t.timestamps null: false
    end
  end
end

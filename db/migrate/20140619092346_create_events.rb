class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.string :name
      t.text :description
      t.string :address

      t.timestamps
    end
    add_index :events, :user_id
  end
end

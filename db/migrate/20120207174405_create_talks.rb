class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.integer :person_id
      t.integer :event_id
      t.string :title
      t.text :body


    end
  end
end

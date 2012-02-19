class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.text :announcement
      t.text :report
      t.datetime :scheduled_at 
     
      t.timestamps
    end
  end
end

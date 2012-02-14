class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text    :body
      t.text    :report
      t.datetime :created_at, :default => Time.now
      t.datetime :scheduled_at 

    
    end
  end
end

class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :person_id  
      t.integer :event_id 

     
    end
  end
end

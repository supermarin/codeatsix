class CreateSubmits < ActiveRecord::Migration
  def change
    create_table :submits do |t|
      t.string :name
      t.string :surname
      t.string :email

      t.timestamps
    end
  end
end

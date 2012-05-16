class AddTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :whatisit, :string
  end
end

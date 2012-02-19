class AddActiveIndicatorToEvents < ActiveRecord::Migration
  def change
    add_column :events, :is_active, :boolean
  end
end

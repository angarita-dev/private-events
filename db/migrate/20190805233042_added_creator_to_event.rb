class AddedCreatorToEvent < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :author_id, :creator
  end
end

class RemoveDateAndAddAssociation < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :creator, foreign_key: { to_table: :users }
    remove_index :events, :created_at
    remove_column :events, :date, :datetime
  end
end

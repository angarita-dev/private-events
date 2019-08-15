class DeletedRedundantDateInEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :date
  end
end

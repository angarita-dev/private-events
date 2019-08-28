# frozen_string_literal: true

class NameCorrectionUsersTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :user, :users
  end
end

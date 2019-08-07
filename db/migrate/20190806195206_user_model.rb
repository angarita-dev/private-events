class UserModel < ActiveRecord::Migration[5.2]
  def change
    create_table :user do |t|
      t.string :name
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end
  end
end

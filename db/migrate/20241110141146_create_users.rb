# db/migrate/xxxx_create_users.rb
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :role, null: false

      t.timestamps
    end
  end
end

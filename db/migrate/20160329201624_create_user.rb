class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :avator_url
      t.string :occupation
      t.string :live
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin, default: false
      t.string :color

      t.timestamps
    end
  end
end

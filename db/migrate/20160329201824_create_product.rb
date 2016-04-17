class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.text :about
      t.string :based_on
      t.string :url
      t.integer :degree
      t.string :color

      t.timestamps
    end
  end
end

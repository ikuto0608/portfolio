class CreateSkill < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.integer :degree
      t.string :type
      t.string :color

      t.timestamps
      t.index :type
    end
  end
end

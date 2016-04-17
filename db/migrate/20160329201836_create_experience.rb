class CreateExperience < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.integer :year
      t.text :language
      t.string :color

      t.timestamps
    end
  end
end

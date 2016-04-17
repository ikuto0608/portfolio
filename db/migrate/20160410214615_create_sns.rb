class CreateSns < ActiveRecord::Migration
  def change
    create_table :sns do |t|
      t.belongs_to :user, index: true
      t.string :url
      t.integer :kind

      t.timestamps
    end
  end
end

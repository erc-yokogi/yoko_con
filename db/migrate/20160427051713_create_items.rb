class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item
      t.string :tanka
      t.string :suryo
      t.references :contract, index: true

      t.timestamps
    end
  end
end

class CreateContractHaikibutsus < ActiveRecord::Migration
  def change
    create_table :contract_haikibutsus do |t|
      t.string :haikibutsu
      t.string :suryo
      t.string :tanka
      t.references :contract, index: true

      t.timestamps
    end
  end
end

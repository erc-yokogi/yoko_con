class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :itakumoto
      t.string :itakusaki
      t.timestamps :kaishibi
      t.timestamps :syuryobi

      t.timestamps
    end
  end
end

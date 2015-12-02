class AddItakukikanToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :itakustart, :string
    add_column :contracts, :itakuend, :string
  end
end

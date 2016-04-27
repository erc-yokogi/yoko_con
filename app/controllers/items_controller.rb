class ItemsController < ApplicationController

  def create
    @contract = Contract.find(params[:contract_id])
    @item = @contract.items.create(item_params)
    redirect_to contract_path(@contract)
  end

  def destroy
    @contract = Contract.find(params[:contract_id])
    @item = @contract.items.find(params[:id])
    @item.destroy
    redirect_to contract_path(@contract)
  end

  private
  def item_params
    params.require(:item).permit(:item, :suryo, :tanka)
  end

end

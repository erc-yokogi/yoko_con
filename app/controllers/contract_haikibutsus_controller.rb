class ContractHaikibutsusController < ApplicationController



  def create
    @contract = Contract.find(params[:contract_id])
    @contracthaikibutsu = @contract.contracthaikibutsus.create(haikibutsu_params)
    redirect_to contract_path(@contract)
  end

  private
  def haikibutsu_params
    params.require(:contracthaikibutsu).permit(:haikibutsu, :suryo, :tanka)
  end

end

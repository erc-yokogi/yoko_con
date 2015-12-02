class ContractsController < ApplicationController

  def new
   @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    #byebug
    if @contract.save
      #sign_in @user
      flash[:success] = "Insert OK!!"
      redirect_to @contract
      #byebug
    else
      render 'new'
    end
  end

  def index
    @contracts = Contract.paginate(page: params[:page])
    #contracts = Contract.all
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def edit
   @contract = Contract.find(params[:id])
  end

  def update
    @contract = Contract.find_by_id(params[:id])

    if @contract.update_attributes(contract_params)
      flash[:success] = "Profile updated"
      redirect_to @contract
    else
      render 'edit'
    end

#  @contract = Contract.find_by_id(params[:id])
#  @contract.update_attributes(contract_params)
#  flash[:success] = "Product donated!"

  end

  def destroy
    Contract.find(params[:id]).destroy
    flash[:success] = "Contract deleted."
    redirect_to contracts_url
  end

  private

    def contract_params
      params.require(:contract).permit(:itakumoto, :itakusaki)
    end

end

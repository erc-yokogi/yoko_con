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

# branch prep_search 2015/12/02
    if params[:search]
      jyoken = params[:search]
      sql = 'SELECT C.* FROM contracts C WHERE itakumoto LIKE ?', "%#{jyoken}%"
     #byebug
     #@contracts = Contract.search(params[:search])
     @contracts = Contract.paginate_by_sql(sql,:page => params[:page], :per_page => 5)

# branch prep_search 2015/12/02 end
    else
     @contracts = Contract.paginate(page: params[:page],:per_page => 5)
    end

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
      params.require(:contract).permit(:itakumoto, :itakusaki, :itakustart, :itakuend)
    end

end

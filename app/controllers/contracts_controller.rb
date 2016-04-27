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

    sql = 'SELECT C.* FROM contracts C'


    conditionflg = 0

    if params[:search].present? && params[:searchsaki].present?
#      jyoken = params[:search]
#      sql = sql + ' WHERE itakumoto LIKE ?', "%#{jyoken}%"
#      conditionflg = 1

#     if params[:searchsaki]
      jyoken = params[:search]
      jyoken2 = params[:searchsaki]
#      sql = sql + ' WHERE itakumoto LIKE ?', "%#{jyoken}%"
#      sql = sql + ' AND itakusaki LIKE ?', "%#{jyoken2}%"
#      sql = sql + ' WHERE itakumoto LIKE ?', "%#{jyoken}%", ' AND itakusaki LIKE ?', "%#{jyoken2}%"
      sql = sql + ' WHERE itakumoto LIKE ? AND itakusaki LIKE ?', "%#{jyoken}%", "%#{jyoken2}%"
#      sql = sql + ' WHERE itakumoto LIKE "%1%" AND itakusaki LIKE "%2%"'
#     else
#      # do nothing
#     end
      #byebug
      #@contracts = Contract.search(params[:search])
      #@contracts = Contract.paginate_by_sql(sql,:page => params[:page], :per_page => 5)
      conditionflg = 1
# branch prep_search 2015/12/02 end
    else

     if params[:searchsaki].present?
#      jyoken = params[:search]
      jyoken2 = params[:searchsaki]
      sql = sql + ' WHERE itakusaki LIKE ?', "%#{jyoken2}%"
      conditionflg = 1
     elsif params[:search].present?
      jyoken = params[:search]
      #jyoken2 = params[:searchsaki]
      sql = sql + ' WHERE itakumoto LIKE ?', "%#{jyoken}%"
      conditionflg = 1
     else

     end

    end

    if conditionflg == 1
     @contracts = Contract.paginate_by_sql(sql,:page => params[:page], :per_page => 5)
    else
     @contracts = Contract.paginate(page: params[:page],:per_page => 5)
    end

  end

  def show
    @contract = Contract.find(params[:id])
    #2016/02/10 add seigoseierror
    #flash.now[:error] = build_error_messages

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
      #flash.now[:error] = build_error_messages
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

  #2016/02/10 add method
  def build_error_messages
    messages = []
    messages += @contract.errors[:base] unless @contract.valid?#(:contract_detail)
    messages
#    #messages = ["kikan error"]
  end

  private

    def contract_params
      params.require(:contract).permit(:itakumoto, :itakusaki, :itakustart, :itakuend)
    end

end

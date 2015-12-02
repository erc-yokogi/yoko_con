module ContractsHelper

  def current_contract
    @current_contract ||= Contract.find(params[:id])
  end
end

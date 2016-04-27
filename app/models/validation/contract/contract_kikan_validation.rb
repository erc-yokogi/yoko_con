# -*- coding: utf-8 -*-

# 契約期間_終了年月日の検証
module Validation::Contract::ContractKikanValidation
#  include DataMapper::Validations
  include Validation::DefineGroup

  define_validation_group {|contexts|
    lambda {|m|
      validates_with_method :base, method: :contract_kikan_reverse? #, when: contexts
    }
  }

#  def contract_kikan_reverse?
#    return true if self.itakustart.nil? || ! self.itakustart.is_a?(Date)
#    if self.itakustart.to_date > itakuend.to_date
#      true
#    else
#      return [false, ::I18n.t(:invalid_contract_kikan, scope: "validation.contract.contract_kikan")]
#    end
#  end
end

# coding: utf-8

# 契約付帯情報整合性チェック
module Validation::Contract::IncidentValidation
#  include DataMapper::Validations
#  include Validation::DefineGroup

#  include Validation::Contract::ContractKikanValidation
#
#
#  define_validation_group {|contexts|
#    lambda {|m|
#      validates_with_method :base, method: :contract_kikan_reverse? #, when: contexts, if: :scratch_register?
#    }
#  }

  def contract_kikan_reverse?
    return true if self.itakustart.nil? || ! self.itakustart.is_a?(Date)
    if self.itakustart.to_date > itakuend.to_date
      true
    else
      #return [false, ::I18n.t(:invalid_contract_kikan, scope: "validation.contract.contract_kikan")]
      return
    end
  end

end
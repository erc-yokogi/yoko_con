# -*- coding: utf-8 -*-

module Validation::Loader
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    # mod      - 検証module
    # contexts - modによる検証をを有効にするcontextを指定
    #
    # Example
    #
    #   class Contract
    #     include Validation::Loader
    #
    #     load_validation_group Validation::Contract::TemporaryStatusValidation, [:temporary]
    #
    #     def valid_for_persist
    #       self.valid? # => 暗黙に:defaultコンテキストでの検証となる
    #       self.valid?(:temporary) # => Validation::Contract::TemporaryStatusValidationの持つ検証が実行される
    #     end
    def load_validation_group(contexts)#(mod, contexts)
     # include mod
     # class_eval &(mod.const_get(:VALIDATION_GROUP).call(contexts))
    end
  end
end

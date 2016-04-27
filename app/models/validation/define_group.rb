# -*- coding: utf-8 -*-

module Validation::DefineGroup
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def define_validation_group(&block)
      const_set(:VALIDATION_GROUP, block)
    end
  end
end

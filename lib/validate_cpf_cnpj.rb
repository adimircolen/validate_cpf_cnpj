require 'active_model'
require 'validate/cnpj'
require 'validate/cpf'

module ValidateCpfCnpj
end

class CnpjFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    if value.blank?
      object.errors.add(attribute, :blank, options)
    elsif value.gsub(/[^\d]/,"").size != 14
      object.errors.add(attribute, :wrong_length, :count => 14)
    elsif !ValidateCpfCnpj::Cnpj.validate(value)
      object.errors.add(attribute, :invalid, options)
    end
  end
end

class CpfFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    if value.blank?
      object.errors.add(attribute, :blank, options)
    elsif value.gsub(/[^\d]/,"").size != 11
      object.errors.add(attribute, :wrong_length, :count => 11)
    elsif !ValidateCpfCnpj::Cpf.validate(value)
      object.errors.add(attribute, :invalid, options)
    end
  end
end
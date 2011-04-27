module ValidateCpfCnpj
  module Cpf
    def self.validate(cpf)
        cpf = cpf.gsub(/[^\d]/,"")
        if !cpf || cpf.match(/^(1{11,11}|2{11,11}|3{11,11}|4{11,11}|5{11,11}|6{11,11}|7{11,11}|8{11,11}|9{11,11}|0{11,11})$/)
          return false
        else
          numbers = cpf[0...9]
          generated_cpf = numbers

          generated_cpf += generate_cpf_digit(numbers)
          return cpf == generated_cpf
        end
    end

    private
      def self.generate_cpf_digit(cpf)
        j = 0
        generated_digit = 0

        cpf.size == 9 ? j = 10 : j = 11

        (0...j).each do |i|
          generated_digit += cpf.split('')[i].to_i * (j-i)
        end

        generated_digit %= 11
        generated_digit = 11 - generated_digit

        if generated_digit > 9
          generated_digit = 0
        end

        if cpf.length == 9
          return generated_digit.to_s + generate_cpf_digit(cpf+generated_digit.to_s)
        else
          return generated_digit.to_s
        end
      end
  end
end
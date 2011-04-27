module ValidateCpfCnpj
  module Cnpj
    CNPJ_ALGS_1 = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
    CNPJ_ALGS_2 = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

    def self.validate(cnpj)
      cnpj = cnpj.gsub(/[^\d]/,"")

      numbers = cnpj[0...12]
      generated_cnpj = numbers

      generated_cnpj += generate_cnpj_digit(numbers, CNPJ_ALGS_1)
      cnpj == generated_cnpj
    end
    
    private
      def self.generate_cnpj_digit(cnpj, algs)
        generated_digit = 0

        cnpj.scan(/\d{1}/).each_with_index {|e,i| generated_digit += e.to_i * algs[i]}

        generated_digit %= 11
        generated_digit = 11 - generated_digit

        if generated_digit == 10 or generated_digit == 11
          generated_digit = 0
        end

        if cnpj.length == 12
          return generated_digit.to_s + generate_cnpj_digit(cnpj+generated_digit.to_s, CNPJ_ALGS_2)
        else
          return generated_digit.to_s
        end
      end
  end
end
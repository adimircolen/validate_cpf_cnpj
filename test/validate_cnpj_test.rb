require 'test_helper'
require 'fixtures/person'

class ValidateCnpjTest < ActiveSupport::TestCase
  test "validate lenght of cnpj" do
    company = Company.new(:cnpj => "6910360400016")
    assert !company.valid?
    assert_equal ["is the wrong length (should be 14 characters)"], company.errors[:cnpj]
  end
  
  test "validate presence of cnpj" do
    company = Company.new(:cnpj => nil)
    assert !company.valid?
    assert_equal ["can't be blank"], company.errors[:cnpj]
  end
  
  test "validate format of cnpj" do
    company = Company.new(:cnpj => "11111111111111")
    assert !company.valid?
    assert_equal ["is invalid"], company.errors[:cnpj]
  end
end
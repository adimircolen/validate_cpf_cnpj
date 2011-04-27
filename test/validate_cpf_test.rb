require 'test_helper'
require 'fixtures/person'

class ValidateCpfTest < ActiveSupport::TestCase
  test "validate presence of cpf" do
    person = Person.new(:cpf => nil)
    assert !person.valid?
    assert_equal ["can't be blank"], person.errors[:cpf]
  end

  test "validate lenght of cpf" do
    person = Person.new(:cpf => "1114447773")
    assert !person.valid?
    assert_equal ["is the wrong length (should be 11 characters)"], person.errors[:cpf]
  end

  test "validate format of cpf" do
    person = Person.new(:cpf => "11111111111")
    assert !person.valid?
    assert_equal ["is invalid"], person.errors[:cpf]
  end
  
  test "validate formatted cpf" do
    person = Person.new(:cpf => "111.444.777-35")
    assert person.valid?
  end
end
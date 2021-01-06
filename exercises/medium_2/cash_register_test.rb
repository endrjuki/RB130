require 'pry'
require 'minitest/autorun'
#require 'minitest/reporters'

#Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(0)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_give_receipt
    item_cost = 20
    register = CashRegister.new(0)
    transaction = Transaction.new(item_cost)
    expected_receipt = "You've paid $#{item_cost}.\n"

    assert_output(expected_receipt) { register.give_receipt(transaction) }
  end

  def test_change
    item_cost = 20
    money_paid = 50

    register = CashRegister.new(0)
    transaction = Transaction.new(item_cost)
    transaction.amount_paid = money_paid

    assert_equal money_paid - item_cost, register.change(transaction)
  end
  
  def test_prompt_for_payment_valid
    item_cost = 20.0
    transaction = Transaction.new(item_cost)
    mock_input = StringIO.new("#{item_cost}\n")

    expected_output = "You owe $#{item_cost}.\nHow much are you paying?\n"
    #binding.pry
    assert_output(expected_output) { transaction.prompt_for_payment(input: mock_input) }
  end
  
  def test_prompt_for_payment_invalid
    item_cost = 20.0
    money_paid = 10.0
    transaction = Transaction.new(item_cost)
    mock_input = StringIO.new("#{money_paid}\n")
    mock_output = StringIO.new

    expected_output = "You owe $#{item_cost}.\nHow much are you paying?\n" \
                      "That is not the correct amount. " \
                      "Please make sure to pay the full cost.\n"

    assert_output(expected_output) { transaction.prompt_for_payment(input: mock_input) }
  end
  


end
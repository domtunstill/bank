# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

# account class which handles balance and transaction history
class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, transaction = Transaction)
    @balance += amount
    @transactions.insert(
      0, transaction.new(deposit: amount, current_balance: @balance)
    )
  end

  def withdraw(amount, transaction = Transaction)
    if @balance >= amount
      @balance -= amount
      @transactions.insert(
        0, transaction.new(withdrawal: amount, current_balance: @balance)
      )
    else
      'There is not enough money in the account.'
    end
  end

  def print_statement(statement = Statement)
    statement.new.print(@transactions)
  end
end

# frozen_string_literal: true
require 'transaction'

class Account
    
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def print_statement
    statement = "date || credit || debit || balance"
    @transactions.each do |transaction|
      statement += "\n#{transaction.date} || #{transaction.deposit} || #{transaction.withdrawal} || #{transaction.current_balance}"
    end
    statement
  end

  def deposit(amount, transaction=Transaction)
    @balance += amount
    @transactions.insert(0, transaction.new(deposit: format_amount(amount), date: format_date, current_balance: format_amount(@balance)))
  end

  def withdraw(amount, transaction=Transaction)
    if @balance >= amount
        @balance -= amount 
        @transactions.insert(0, transaction.new(withdrawal:format_amount(amount), date: format_date, current_balance: format_amount(@balance)))
    else
        'There is not enough money in the account.'
    end
  end

  private

  def format_date
    Time.now.strftime('%d/%m/%Y')
  end

  def format_amount(amount)
    ('%.2f' % amount)
  end
end

# frozen_string_literal: true

# Class

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def print_statement
    statement = "date || credit || debit || balance \n"
    @transactions.each do |transaction|
      statement += "#{transaction[:date]} || #{transaction[:deposit]} || #{transaction[:withdrawal]} || #{transaction[:balance]} \n"
    end
    statement
  end

  def deposit(amount)
    @balance += amount
    @transactions << { deposit: format_amount(amount), date: format_date, balance: format_amount(@balance) }
  end

  def withdraw(amount)
    if @balance >= amount
        @balance -= amount 
        @transactions << { withdrawal:format_amount(amount), date: format_date, balance: format_amount(@balance) }
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

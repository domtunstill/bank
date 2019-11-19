# transaction class which stores information about transaction

# frozen_string_literal: true

class Transaction
  attr_reader :deposit, :withdrawal, :date, :current_balance

  def initialize(deposit: nil, withdrawal: nil, current_balance:)
    @deposit = deposit
    @withdrawal = withdrawal
    @date = Time.now
    @current_balance = current_balance
  end
end

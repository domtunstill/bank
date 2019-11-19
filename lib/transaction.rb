# frozen_string_literal: true

# transaction class which stores information about transaction
class Transaction
  attr_reader :deposit, :withdrawal, :date, :current_balance

  def initialize(deposit: 0, withdrawal: 0, current_balance:)
    @deposit = deposit
    @withdrawal = withdrawal
    @date = Time.now
    @current_balance = current_balance
  end
end

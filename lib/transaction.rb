# frozen_string_literal: true

class Transaction

    attr_reader :deposit, :withdrawal, :date, :current_balance

    def initialize(deposit: nil, withdrawal: nil, date:, current_balance:)
        @deposit = deposit
        @withdrawal = withdrawal
        @date = date
        @current_balance = current_balance
    end

end
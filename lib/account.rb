class Account

    attr_reader :balance, :transactions

    def initialize 
        @balance = 0
        @transactions = []
    end

    def print_statement
        'date || credit || debit || balance'
    end

end
class Account

    attr_reader :balance

    def initialize 
        @balance = 0
    end

    def print_statement
        'date || credit || debit || balance'
    end

end
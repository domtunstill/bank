class Account

    attr_reader :balance, :transactions

    def initialize 
        @balance = 0
        @transactions = []
    end

    def print_statement
        'date || credit || debit || balance'
    end

    def deposit(amount)
        date = Time.now.strftime('%d/%m/%Y')
        @balance += amount
        @transactions << {:deposit => amount, :date => date, :balance => @balance}
    end

end
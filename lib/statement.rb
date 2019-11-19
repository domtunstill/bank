# frozen_string_literal: true

class Statement

    def print(transactions)
        statement = "date || credit || debit || balance"
        transactions.each do |transaction|
            statement += "\n#{format_date(transaction.date)}||#{format_amount(transaction.deposit)}||#{format_amount(transaction.withdrawal)}||#{format_amount(transaction.current_balance)}"
          end
        statement
    end

    private

    def format_date(date)
      date.strftime('%d/%m/%Y ')
    end
  
    def format_amount(amount)
        return (' %.2f ' % amount) unless amount == nil
        " "
    end

end
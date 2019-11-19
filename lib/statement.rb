# frozen_string_literal: true

# statement class which returns a printed history of transactions
class Statement
  def print(transactions)
    puts 'date || credit || debit || balance'
    transactions.each do |transaction|
      puts "#{format_date(transaction.date)}||" \
           "#{format_amount(transaction.deposit)}||" \
           "#{format_amount(transaction.withdrawal)}||" \
           "#{format_amount(transaction.current_balance)}"
    end
  end

  private

  def format_date(date)
    date.strftime('%d/%m/%Y ')
  end

  def format_amount(amount)
    return format(' %<number>.2f ', number: amount) unless amount.nil?

    ' '
  end
end

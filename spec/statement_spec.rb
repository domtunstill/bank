# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:transaction) do
    double(:transaction,
           date: Time.new(2012, 0o1, 10),
           deposit: 1000, withdrawal: nil,
           current_balance: 1000)
  end
  let(:transaction_2) do
    double(:transaction,
           date: Time.new(2012, 0o1, 14),
           deposit: nil,
           withdrawal: 500,
           current_balance: 500)
  end

  describe '#print' do
    it 'returns an empty statement at the start' do
      transactions = []
      expect(
        subject.print(transactions)
      ).to eq 'date || credit || debit || balance'
    end
    it 'returns a deposit on the statement after deposit transaction is made' do
      transactions = [transaction]
      expect(subject.print(transactions)).to include(
        '10/01/2012 || 1000.00 || || 1000.00'
      )
    end
    it 'returns a withdrawl on statement after transaction is made' do
      transactions = [transaction_2, transaction]
      expect(subject.print(transactions)).to include(
        '14/01/2012 || || 500.00 || 500.00'
      )
    end
    it 'returns a transactions in order' do
      transactions = [transaction_2, transaction]
      expect(subject.print(transactions)).to include(
        "14/01/2012 || || 500.00 || 500.00 \n10/01/2012 || 1000.00 || || 1000.00"
      )
    end
  end
end

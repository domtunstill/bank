# frozen_string_literal: true

require 'statement'

describe Statement do

  let(:transaction) { double(:transaction, date: Time.new(2012,01,10), deposit: 1000, withdrawal: nil, current_balance: 1000)}
  let(:transaction_2) { double(:transaction, date: Time.new(2012,01,14), deposit: nil, withdrawal: 500, current_balance: 500)}

    describe '#print' do
    it 'returns an empty statement at the start' do
      transactions = []
      expect(subject.print(transactions)).to eq "date || credit || debit || balance"
    end
    it 'returns a deposit on the statement after deposit transaction is made' do
      transactions = [transaction]
      expect(subject.print(transactions)).to include('10/01/2012 || 1000.00 || || 1000.00')
    end
    it 'returns a withdrawl on the statement after withdrawal transaction is made' do
        transactions = [transaction_2, transaction]
        expect(subject.print(transactions)).to include('14/01/2012 || || 500.00 || 500.00')
    end
    it 'returns a transactions in order' do
        transactions = [transaction_2, transaction]
        expect(subject.print(transactions)).to include("14/01/2012 || || 500.00 || 500.00 \n10/01/2012 || 1000.00 || || 1000.00")
    end
  end

end
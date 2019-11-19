# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'returns the deposited ammount' do
    transaction = Transaction.new(deposit: 100, current_balance: 900)
    expect(transaction.deposit).to eq 100
  end

  it 'returns the withdrawn ammount' do
    transaction = Transaction.new(withdrawal: 100, current_balance: 900)
    expect(transaction.withdrawal).to eq 100
  end

  it 'returns the date of the transaction' do
    allow(Time).to receive(:now).and_return(Time.new(2012, 0o1, 10))
    transaction = Transaction.new(withdrawal: 100, current_balance: 900)
    expect(transaction.date).to eq Time.new(2012, 0o1, 10)
  end

  it 'returns the current balance after the transaction occured' do
    transaction = Transaction.new(withdrawal: 100, current_balance: 900)
    expect(transaction.current_balance).to eq 900
  end
end

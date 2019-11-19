# frozen_string_literal: true

require 'account'

describe Account do

  let(:transaction) { double(:transaction, date: '10/01/2012', deposit: '1000.00', withdrawal: nil, current_balance: '1000.00')}
  let(:transaction_class) { double(:transaction_class, new: transaction) }
  let(:transaction_2) { double(:transaction, date: '14/01/2012', deposit: nil, withdrawal: '500.00', current_balance: '500.00')}
  let(:transaction_class_2) { double(:transaction_class, new: transaction_2) }

  describe '#initialization' do
    it 'starts with a balance of 0' do
      expect(subject.balance).to eq (0)
    end
    it 'starts with an empty list of transactions' do
      expect(subject.transactions).to be_empty
    end
  end

  describe '#print_statement' do
    it 'returns an empty statement at the start' do
      expect(subject.print_statement).to eq "date || credit || debit || balance"
    end
    it 'returns a deposit on the statement after deposit transaction is made' do
      subject.deposit(1000, transaction_class)
      expect(subject.print_statement).to include('10/01/2012 || 1000.00 ||  || 1000.00')
    end
    it 'returns a withdrawl on the statement after withdrawal transaction is made' do
        subject.deposit(1000, transaction_class)
        subject.withdraw(500, transaction_class_2)
        expect(subject.print_statement).to include('14/01/2012 ||  || 500.00 || 500.00')
    end
    it 'returns a transactions in order' do
        subject.deposit(1000, transaction_class)
        subject.withdraw(500, transaction_class_2)
        expect(subject.print_statement).to include("14/01/2012 ||  || 500.00 || 500.00\n10/01/2012 || 1000.00 ||  || 1000.00")
    end
  end
  
  describe '#desposit' do
    it 'takes 1 argument' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end
    it 'updates the balance by adding the deposited amount' do
      subject.deposit(1000, transaction_class)
      expect(subject.balance).to eq 1000
    end
    it 'deposit is stored in the transactions array' do
      subject.deposit(1000, transaction_class)
      expect(subject.transactions.length).to eq 1
    end
    it 'deposit amount stored in the transactions array' do
      subject.deposit(1000, transaction_class)
      expect(subject.transactions[0].deposit).to eq '1000.00'
    end
    it 'balance after deposit stored in the transactions array' do
      subject.deposit(1000, transaction_class)
      expect(subject.transactions[0].current_balance).to eq '1000.00'
    end
    it 'deposit date stored in the transactions array' do
      subject.deposit(1000, transaction_class)
      expect(subject.transactions[0].date).to eq '10/01/2012'
    end
  end

  describe '#withdraw' do
    it 'takes 1 argument' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end
    it 'updates the balance by subtracting the withdrawn amount' do
      subject.deposit(1000, transaction_class)
      subject.withdraw(500, transaction_class_2)
      expect(subject.balance).to eq (500)
    end
    it 'customer can not withdraw if amount is more than balance' do
      subject.withdraw(500, transaction_class_2)
      expect(subject.balance).to eq (0)
    end
    it 'customer notified they do not have enough money' do
        expect(subject.withdraw(500, transaction_class_2)).to eq ('There is not enough money in the account.')
    end
    it 'withdrawal is stored in the transactions array' do
      subject.deposit(1000, transaction_class)
      subject.withdraw(500, transaction_class_2)
      expect(subject.transactions.length).to eq 2
    end
    it 'withdrawal is not stored if transaction is more than balance' do
        subject.withdraw(500, transaction_class_2)
        expect(subject.transactions.length).to eq 0
    end
    it 'withdrawal amount stored in the transactions array' do
      subject.deposit(1000, transaction_class)
      subject.withdraw(500, transaction_class_2)
      expect(subject.transactions[0].withdrawal).to eq '500.00'
    end
    it 'balance after withdrawal stored in the transactions array' do
      subject.deposit(1000, transaction_class)
      subject.withdraw(500, transaction_class_2)
      expect(subject.transactions[0].current_balance).to eq '500.00'
    end
    it 'withdrawal date stored in the transactions array' do
      subject.deposit(1000, transaction_class)
      subject.withdraw(500, transaction_class_2)
      expect(subject.transactions[1].date).to eq '10/01/2012'
    end
  end

end

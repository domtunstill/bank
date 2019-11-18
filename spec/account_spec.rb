# frozen_string_literal: true

require 'account'

describe Account do

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
      expect(subject.print_statement).to eq "date || credit || debit || balance \n"
    end
    it 'returns a deposit on the statement after deposit transaction is made' do
      allow(Time).to receive(:now).and_return(Time.new(2012, 01, 10))
      subject.deposit(1000.00)
      expect(subject.print_statement).to include('10/01/2012 || 1000.00 || || 1000.00')
    end
  end

  describe '#desposit' do
    it 'takes 1 argument' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end
    it 'updates the balance by adding the deposited amount' do
      subject.deposit(1000)
      expect(subject.balance).to eq 1000
    end
    it 'deposit is stored in the transactions array' do
      subject.deposit(1000)
      expect(subject.transactions.length).to eq 1
    end
    it 'deposit amount stored in the transactions array' do
      subject.deposit(1000)
      expect(subject.transactions[0][:deposit]).to eq '1000.00'
    end
    it 'balance after deposit stored in the transactions array' do
      subject.deposit(1000)
      expect(subject.transactions[0][:balance]).to eq '1000.00'
    end
    it 'deposit date stored in the transactions array' do
      allow(Time).to receive(:now).and_return(Time.new(2012, 01, 10))
      subject.deposit(1000)
      expect(subject.transactions[0][:date]).to eq '10/01/2012'
    end
  end

  describe '#withdraw' do
    it 'takes 1 argument' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end
    it 'updates the balance by subtracting the withdrawn amount' do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.balance).to eq (500)
    end
    it 'customer can not withdraw if amount is more than balance' do
      subject.withdraw(500)
      expect(subject.balance).to eq (0)
    end
    it 'withdrawal is stored in the transactions array' do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.transactions.length).to eq 2
    end
    it 'withdrawal is not stored if transaction is more than balance' do
        subject.withdraw(500)
        expect(subject.transactions.length).to eq 0
    end
    # it 'deposit amount stored in the transactions array' do
    #   subject.deposit(1000)
    #   expect(subject.transactions[0][:deposit]).to eq '1000.00'
    # end
    # it 'balance after deposit stored in the transactions array' do
    #   subject.deposit(1000)
    #   expect(subject.transactions[0][:balance]).to eq '1000.00'
    # end
    # it 'deposit date stored in the transactions array' do
    #   allow(Time).to receive(:now).and_return(Time.new(2012, 0o1, 10))
    #   subject.deposit(1000)
    #   expect(subject.transactions[0][:date]).to eq '10/01/2012'
    # end
  end

end

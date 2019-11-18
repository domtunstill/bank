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
            expect(subject.print_statement).to eq ('date || credit || debit || balance')
        end
    end

    describe '#desposit' do
        it 'takes 1 argument' do
            expect(subject).to respond_to(:deposit).with(1).argument
        end
        it 'updates the balance by adding the deposited amount' do
            subject.deposit(1000)
            expect(subject.balance).to eq (1000)
        end
        it 'deposit is stored in the transactions array' do
            subject.deposit(1000)
            expect(subject.transactions.length).to eq (1)
        end
        it 'deposit amount stored in the transactions array' do
            subject.deposit(1000)
            expect(subject.transactions[0][:deposit]).to eq (1000)
        end
    end

end
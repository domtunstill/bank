require 'account'

describe Account do
    describe '#balance' do
        it 'starts with a balance of 0' do
            expect(subject.balance).to eq (0)
        end 
    end
    describe '#transactions' do
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
    end

end
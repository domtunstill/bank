require 'account'

describe Account do
    describe '#print_statement' do
        it 'returns an empty statement at the start' do
            expect(subject.print_statement).to eq ('date || credit || debit || balance')
        end
    end
    describe '#balance' do
        it 'starts with a balance of 0' do
            expect(subject.balance).to eq (0)
        end 
    end
end
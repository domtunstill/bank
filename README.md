# Bank

Bank is a Ruby library that allows a user to add deposits and withdrawals for a bank account and return a printed statement of the transactions and current balance.

## Specification

### Requirements

* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Testing Criteria

| Criteria      | Input         | Output|
| ------------- |:-------------:| -----:|
| Account balance to be 0 on initializaton   | none | Balance to be 0 |
| Account initilizes with an empty history of transactions  | none | Transactions to be empty |
| Prints empty statement at start | none |date &#124;&#124; credit &#124;&#124; debit &#124;&#124; balance|
| Balance updated: Customer deposits 1000 | 1000 |Balance to be 1000|
| Transaction saved: Customer deposits 1000 | 1000 | 1 transaction to be stored in transactions|
| Transaction amount saved: Customer deposits 1000 | 1000 | 1000 to be returned |
| Post transaction balance is saved: Customer deposits 1000 | 1000 | 1000 to be returned |
| Transaction date saved: Customer deposits 1000 | 1000 | 10/01/2012 |
| Print statement after customer deposits 1000 on 10-01-2012 | 1000 | 10/01/2012 &#124;&#124; 1000.00 &#124;&#124; &#124;&#124; 1000.00|
| Balance updated: Customer withdraws 500 (with balance of 1000) | 500 |Balance to be 500|
| Customer can't withdraw if withdrawal is more than balance | 500 |Balance to be 0|
| Transaction saved: Customer withdraws 500 | 500 | 2 transaction to be stored in transactions|
| Transaction amount saved: Customer withdraws 500 | 500 | 500 to be returned |
| Post transaction balance is saved: Customer withdraws 500 (with balance of 1000) | 500 | 500 to be returned |
| Transaction date saved: Customer withdraws 500 | 500 | 14/01/2012 |
| Print statement after customer withdraws 500 on 14-01-2012 | 500 | 14/01/2012 &#124;&#124; 500.00 &#124;&#124; &#124;&#124; 500.00|


[comment]: <> ( | Client makes a deposit | 10/01/2012  1000  |  Balance to be 1000 |)
[comment]: <> (| Client makes a deposit | 10/01/2012  1000  |  10/01/2012 &#124;&#124; 1000.00 &#124;&#124; &#124;&#124; 1000.00|)

### Edge Cases

- Amount given with an extra decimal place will still print to balance
- Can withdraw amount more than balance
- String given as deposit or withdrawal amount
[comment]: <>(- 2 deposits same date, balance order)
[comment]: <>(- Transactions not entered in correct order, statement balance incorrect)

## App 

Ruby version '2.6.3'

### Testing and Code Quality

Framework - RSpec 

Linter - Rubocop

Test Coverage Analyser - Simplecov

## Installation

Run the following command in the project directory:

```
$ bundle install
```

## Usage

Add the following to the top of your project files which require the Bank app.

```ruby
require 'bank'
```

Example below of a project file using the Bank app.

```ruby
require 'bank'

# foobar.pluralize('word') # returns 'words'
# foobar.pluralize('goose') # returns 'geese'
# foobar.singularize('phenomena') # returns 'phenomenon'
```

Run the following command in the project directory to run the tests:

```
$ rspec
```

Run the following command in the project directory to check code quality:

```
$ rubocop
```

## Contributing


## License
[MIT](domtunstill)
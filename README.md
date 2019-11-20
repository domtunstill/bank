# Bank

Bank is a Ruby library that allows a user to add deposits and withdrawals for a bank account and return a printed statement of the transactions and current balance.

## Specification

### Requirements

* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance Criteria

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

### Edge Cases

- Amount given with an extra decimal place will still print to balance - currently rounds to the nearest decimal place
- Can withdraw amount more than balance - added checking so balance cannot be negative, (future feature: add custom overdraft amount for each customer)
- String given as deposit or withdrawal amount - currently gives error TypeError (String can't be coerced into Integer) and does not save the transaction

## Approach and Code Structure

### Approach

* I added the first few testing criteria below, which were the simpliest features to implement.
* Initiailly I started with a single class and worked through the criteria.
* After each passing test, I refactored and made new criteria for new features.
* After the app was fully working and meeting the acceptance criteria I looked as ways to improve the code.
* Using SRP I decided that the Account class was doing too much and decided to extract it into 3 classes

### Structure

The code is split into 3 classes.

Account Class

* This is the main class the user interacts with and is the 'manager class'
* It keeps a history of the transactions on the account.

Transaction Class

* Stores the information about each transaction; deposit or withdrawal, amount and date made.

Statement Class

* Handles producing a statement from the transaction history.


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

Add the following to the top of your project files which require the Bank app or use in IRB (or similar).

```ruby
require 'account'
```

Example below of a project file using the Bank app.

```ruby
require 'account'

account = Account.new

account.deposit(500) # adds 500 to the account and saves transaction
account.withdraw(500) # withdraws 500 from the account and saves transaction
account.print_statement # returns a printed statement of all transactions
```

### App Screenshot

![App Usage](/images/AppUsageScreenshot.png)

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

require 'csv'
require 'pry'

business_acct_tran = []
purchasing_acct_tran = []

begin
transactions.each do |key|
  if key[0][:account] == ('Purchasing Account')
    purchasing_acct_tran << key
  elsif
    business_acct_tran << key
  end
end
end

class BankTransaction
  def initialize(date,amount,description)
    @date = date
    @amount = amount
    @description = description
  end
  def credit?
    if @amount < 0
      "CREDIT"
    end
  end
  def debit?
    if @amount > 0
      "DEBIT"
    end
  end
  def summary
    print "$#{'%.2f' % @amount}"
    print BankTransaction.credit?
    print BankTransaction.debit?
    puts "#{@date} - #{@description}"
  end
end
class BankAccount
  def initialize(balance)
    @transactions = []
    @balance = balance
    @start_balance = balance
  end
  def add_transaction(tran)
    @transactions << tran
    #Running variable to affect balance with each transaction
  end
  def starting_balance
    @start_balance
  end
  def ending_balance
    #@balance + total_tran_value
    @balance
  end
  def summary
    #PLACEHOLDER
  end
end

transactions = Hash[ CSV.read('bank_data.csv', headers: true).map do |row|
  [ date: row[0], amount: row[1].to_i, description: row[2], account: row[3] ]
end]

balances = Hash[ CSV.read('balances.csv', headers: true).map do |row|
  [ row[0], [row[1].to_i]  ]
end]

#purchasing_account = BankAccount.new(balances['Purchasing Account'])
#purchasing_acct_tran.each do |tran|



puts "==== Purchasing Account ===="
puts "Starting Balance: $#{'%.2f' % purchasing_account.starting_balance}"
puts "Ending Balance: $#{'%.2f' % purchasing_account.ending_balance}\n\n"

purchasing_account.summary
                                                        #$500.33  CREDIT 09/14/2013 - Sales Deposit
                                                        #$35.19   DEBIT  09/15/2013 - Staples.com
puts "============================"


puts "==== Business Checking ===="

puts "==========================="


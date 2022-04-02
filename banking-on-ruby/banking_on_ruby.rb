class Account
  attr_reader :name, :balance
    def initialize(name, balance=100)
      @name = name
      @balance = balance
    end
  
    public
    def display_balance(pin_number)
      puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
    end
    
    def withdraw(pin_number, amount)
      if pin_number == @pin
        if @balance >= amount
          @balance -= amount
          puts "Withdrew #{amount}. New balance: $#{@balance}."
        else
          puts "Insufficient funds: $#{@balance}."
        end
      else
        puts pin_error
      end
    end

    def deposit(pin_number, amount)
      if pin_number == @pin
        @balance += amount
        puts "Deposited #{amount}. New balance: $#{@balance}."
      else
        puts pin_error
      end
    end

  
    private

    def pin
      @pin = 3426
    end

    def pin_error
      return "Access denied: incorrect PIN."
    end
  end

save_account = Account.new("Harry Blackstone Copperfield Dresden", 10_311_972)
save_account.display_balance(3426)
save_account.deposit(3426, 2_200_000_000)

backup_cousin_account = Account.new("Dylan Crayton West Bradshaw", 1_071_982)
backup_cousin_account.display_balance(3426)
backup_cousin_account.deposit(3426, 5_051_992)
backup_cousin_account.display_balance(3426)
backup_cousin_account.deposit(3426, 2_200_000_000)

old_account = Account.new("Joel Martin Nomi Ellie Bunes", 10_151_985)
old_account.display_balance(3426)
old_account.deposit(3426, 2_200_000_000)

rin_account = Account.new("Rin Indigo Ruby Starash", 7_311_998)
rin_account.display_balance(3426)
rin_account.deposit(3426, 2_200_000_000)

my_account = Account.new("Violet Emerald Inverse Stardust Higgsfield", 11_131_998)
my_account.display_balance(3426)
my_account.deposit(3426, 2_200_000_000)

molly_account = Account.new("Molly Leahy Stark Carpenter", 10_132_000)
molly_account.display_balance(3426)
molly_account.deposit(3426, 2_200_000_000)

coden_account = Account.new("Coden Aaron Carpenter Stark", 7_302_002)
coden_account.display_balance(3426)
coden_account.deposit(3426, 2_200_000_000)

maggie_account = Account.new("Maggie Bonnie Lefay Dresden", 1_312_010)
maggie_account.display_balance(3426)
maggie_account.deposit(3426, 2_200_000_000)

bruce_account = Account.new("Bruce Thomas Banner Wayne ", 5_312_018)
bruce_account.display_balance(3426)
bruce_account.deposit(3426, 2_200_000_000)

barry_account = Account.new("Barry Iris West Allen", 8_312_021)
barry_account.display_balance(3426)
barry_account.deposit(3426, 2_200_000_000)

clark_account = Account.new("Clark Joseph Shoreline Kent", 1_312_022)
clark_account.display_balance(3426)
clark_account.deposit(3426, 2_200_000_000)
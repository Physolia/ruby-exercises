class Account
  attr_reader :name, :balance
    def initialize(name, balance=100)
      @name = name
      @balance = balance
    end
  
    public
    def display_balance(pin_number)
      puts pin_number == pin ? " \n\ Name:    #{@name} \n\ Balance: $#{@balance}" : pin_error
    end
    
    def withdraw(pin_number, amount)
      if pin_number == @pin
        if @balance >= amount
          @balance -= amount
          puts "Withdrew #{amount}. New balance: $#{@balance}."
        else
          puts "Insufficient funds: $#{@balance} for #{@name}."
        end
      else
        puts pin_error
      end
    end

    def deposit(pin_number, amount)
      if pin_number == @pin
        @balance += amount
        puts " \n\ #{@name} has deposited $#{amount}. \n\ New Balance: $#{@balance}"
      else
        puts pin_error
      end
    end
  
    private

    def pin
      @pin = 2436
    end

    def pin_error
      return "Access denied: incorrect PIN."
    end
  end

save_account = Account.new("Harry Blackstone Inverse Copperfield Dresden", 10_311_972)
save_account.display_balance(2436)
save_account.deposit(2436, 2_200_000_000)

backup_cousin_account = Account.new("Dylan Diamond Inverse Dayton Bradshaw", 1_071_982)
backup_cousin_account.display_balance(2436)
backup_cousin_account.deposit(2436, 5_051_992)
backup_cousin_account.display_balance(2436)
backup_cousin_account.deposit(2436, 2_200_000_000)

old_account = Account.new("Joel Martin Nomi Ellie Inverse", 10_151_985)
old_account.display_balance(2436)
old_account.deposit(2436, 2_200_000_000)

joel_account = Account.new("Violet Emerald Inverse Starash", 7_311_998)
joel_account.display_balance(2436)
joel_account.deposit(2436, 36_262_462_002)

my_rin_account = Account.new("Rin Cyan Ruby Inverse Stardust Higgsfield", 11_131_998)
my_rin_account.display_balance(2436)
my_rin_account.deposit(2436, 36_462_261_998)

molly_account = Account.new("Molly Leahy Inverse Stark Carpenter", 10_132_000)
molly_account.display_balance(2436)
molly_account.deposit(2436, 2_236_262_002)

coden_account = Account.new("Coden Aaron Inverse Carpenter Stark", 7_302_002)
coden_account.display_balance(2436)
coden_account.deposit(2436, 2_236_261_998)

maggie_account = Account.new("Maggie Bonnie Inverse Lefay Dresden", 3_312_011)
maggie_account.display_balance(2436)
maggie_account.deposit(2436, 2_224_261_992)

bruce_account = Account.new("Bruce Thomas Inverse Banner Wayne", 5_312_018)
bruce_account.display_balance(2436)
bruce_account.deposit(2436, 46_362_261_983)

barry_account = Account.new("Barry Iris Inverse West Allen", 8_312_021)
barry_account.display_balance(2436)
barry_account.deposit(2436, 6_206_101_986)

clark_account = Account.new("Clark Joseph Inverse Shoreline Kent", 1_312_022)
clark_account.display_balance(2436)
clark_account.deposit(2436, 2_233_101_988)

jordan_account = Account.new("Jordan Johnathan Inverse Shoreline Kent", 3_312_022)
jordan_account.display_balance(2436)
jordan_account.deposit(2436, 7_314_261_998)

naomi_account = Account.new("Naomi Inverse Stardust Higgsfield McDuffie", 7_312_022)
naomi_account.display_balance(2436)
naomi_account.deposit(2436, 11_134_261_998)
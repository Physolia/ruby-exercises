class Computer
  @@users = {}
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    
    puts "#{filename} was created with timestamp #{time} by #{@username}"
  end

  def self.get_users
    return @@users
  end
end

my_computer = Computer.new('Nomi', 'flashway')

my_computer.create('The Universe')
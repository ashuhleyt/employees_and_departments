# lib/employee.rb
class Employee
  attr_reader :name, :age, :salary

  def initialize(data)
    @name = data[:name]
    @age = data[:age]
    @salary = data[:salary]
  end

  def give_raise(amount)
    @salary = "$" + (@salary.gsub('$', '').to_i + amount).to_s
  end
end

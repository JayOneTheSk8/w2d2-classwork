require 'byebug'

class Employee

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

  protected
  attr_reader :name
  attr_accessor :title, :boss, :salary
end

class Manager < Employee

  def initialize(name, title, salary, boss = nil)
    super #(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    all_salaries * multiplier
  end

  def all_salaries
    employees.reduce(0) { |salaries, employee| salaries + employee.salary }
  end

  def add_employees(*employee)
    self.employees += employee
  end

  protected
  attr_accessor :employees
end

ned = Manager.new("Ned", "Founder", 1_000_000)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)

ned.add_employees(darren, shawna, david)
darren.add_employees(shawna, david)


p ned.bonus(5) == 500_000
p darren.bonus(4) == 88_000
p david.bonus(3) == 30_000

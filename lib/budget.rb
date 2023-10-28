class Budget 
  attr_reader :year, 
              :departments 

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(dept)
    @departments << dept
  end

  def departments_with_low_expenses
    departments.find_all{ |department| department.expenses <= 500 }
  end
end
require './lib/budget'
require './lib/employee'
require './lib/department'

RSpec.describe Budget do 
  before :each do 
    @budget1 = Budget.new("2020")
    @customer_service = Department.new("Customer Service")  
    @hr = Department.new("Human Resources")
    @marketing = Department.new("Marketing")
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@budget1).to be_a(Budget)
    end

    it 'with attributes' do 
      expect(@budget1.year).to eq("2020")
    end
  end

  describe '.departments' do 
    it 'starts with no departments as an empty array' do 
      expect(@budget1.departments).to eq([])
    end

    it 'can add departments to the departments array' do 
      @budget1.add_department(@customer_service)
      @budget1.add_department(@hr)
      @budget1.add_department(@marketing)

      expect(@budget1.departments).to eq([@customer_service, @hr, @marketing])
    end
  end

  describe '.departments_with_low_expenses' do 
    it 'returns an array of departments with expenses less than 500' do 
      @budget1.add_department(@customer_service)
      @budget1.add_department(@hr)
      @customer_service.expense(150)
      @customer_service.expense(25)
      @hr.expense(500)
      @hr.expense(450)
      @marketing.expense(199)

      expect(@budget1.departments_with_low_expenses).to eq([@customer_service])
    end
  end
end
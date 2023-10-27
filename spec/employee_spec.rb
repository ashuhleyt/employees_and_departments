require './lib/employee.rb'

RSpec.describe Employee do 
  before :each do 
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@bobbi).to be_an(Employee)
    end

    it 'with attributes' do 
      expect(@bobbi.name).to eq("Bobbi Jaeger")
      expect(@bobbi.age).to eq("30")
      expect(@bobbi.salary).to eq("$100000")
    end
  end

  describe '.give_raise' do 
    it 'increases salary by amount given' do 
      @bobbi.give_raise(5000)
      
      expect(@bobbi.salary).to eq("$105000")
    end
  end
end
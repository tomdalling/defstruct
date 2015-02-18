require 'defstruct'

RSpec.describe DefStruct do
  TestStruct = DefStruct.new{{name: 'Phil'}}.reopen do
    def hello
      "My name is Dr. #{name}"
    end
  end

  it 'is a struct with defaults' do
    inst = TestStruct.new
    expect(inst).to be_a(Struct)
    expect(inst.name).to eq('Phil')
  end

  it 'has a constructor that takes attributes as the only parameter' do
    inst = TestStruct.new(name: 'Sally')
    expect(inst.name).to eq('Sally')
  end

  it 'disallows attributes that dont exist' do
    expect{ TestStruct.new(age: 10) }.to raise_error
  end
  
  it 'can be reopened to add methods' do
    expect(TestStruct.new.hello).to eq('My name is Dr. Phil')
  end
end

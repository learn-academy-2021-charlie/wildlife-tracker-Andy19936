require 'rails_helper'

RSpec.describe Animal, type: :model do

  it "is valid and has attributes" do
    spider_monkey = Animal.create common_name: 'Spider Monkey', latin_name: 'spiderus monkeyus', kingdom: 'mountain do'
    expect(spider_monkey).to be_valid
  end

  it "is not valid without a common_name" do
    spider_monkey = Animal.create  latin_name: 'spiderus monkeyus', kingdom: 'mountain do'
    expect(spider_monkey.errors[:common_name]).to_not be_empty
  end

  it "is not valid without a latin_name" do
    spider_monkey = Animal.create  common_name: 'spiderus monkeyus', kingdom: 'mountain do'
    expect(spider_monkey.errors[:latin_name]).to_not be_empty
  end

  it "is not valid without a kingdom" do
    spider_monkey = Animal.create  common_name: 'spiderus monkeyus', latin_name: "present" 
    expect(spider_monkey.errors[:kingdom]).to_not be_empty
  end
  
end

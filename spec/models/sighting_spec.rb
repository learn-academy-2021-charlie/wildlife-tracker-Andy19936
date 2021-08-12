require 'rails_helper'

RSpec.describe Sighting, type: :model do
  
  it "has attributes and is valid" do
    spider_monkey = Animal.create common_name: 'Spider Monkey', latin_name: 'spiderus monkeyus', kingdom: 'mountain do'
    spider_sighting = Sighting.create date: Date.today.to_s, longitude:35, latitude: 23, animal_id:spider_monkey.id
    expect(spider_sighting).to be_valid
  end

  it "can not be valid without a date" do
    spider_monkey = Animal.create common_name: 'Spider Monkey', latin_name: 'spiderus monkeyus', kingdom: 'mountain do'
    spider_sighting = Sighting.create longitude:35, latitude: 23, animal_id:spider_monkey.id
    expect(spider_sighting.errors[:date]).to_not be_empty
  end

  it "can not be valid without a latitude" do
    spider_monkey = Animal.create common_name: 'Spider Monkey', latin_name: 'spiderus monkeyus', kingdom: 'mountain do'
    spider_sighting = Sighting.create date: Date.today.to_s, longitude:35, animal_id:spider_monkey.id
    expect(spider_sighting.errors[:latitude]).to_not be_empty
  end

  it "can not be valid without a longitude" do
    spider_monkey = Animal.create common_name: 'Spider Monkey', latin_name: 'spiderus monkeyus', kingdom: 'mountain do'
    spider_sighting = Sighting.create date: Date.today.to_s,  latitude: 23, animal_id:spider_monkey.id
    expect(spider_sighting.errors[:longitude]).to_not be_empty
    end
end

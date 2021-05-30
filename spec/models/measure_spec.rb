require 'rails_helper'

RSpec.describe Measure, type: :model do
  let (:measure) {build:measure}
  
  it "creates valid new measure" do
    measure.day = "2021-01-01"
    measure.measure = 20
    measure.comentary = "notes"

    expect(measure).to be_valid
  end
end

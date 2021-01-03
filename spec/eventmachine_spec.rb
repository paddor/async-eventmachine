# frozen_string_literal: true

require 'eventmachine'

RSpec.describe '::EventMachine' do
  it "is Async::EventMachine" do
    assert_same ::EventMachine, Async::EventMachine
  end
end

RSpec.describe '::EM' do
  it "is alias" do
    assert_same ::EM, ::EventMachine
  end
end

# frozen_string_literal: true

RSpec.describe Async::EventMachine do
  describe '.run' do
    it 'runs until stopped', em: false do
      Async::EventMachine.run do
        Async::EventMachine.stop
      end
    end
  end
end

# frozen_string_literal: true

require 'async'

module Async
  module EventMachine
    def self.run
      @stop_condition = Async::Condition.new

      Sync do |t|
        t.async do
          @stop_condition.wait
          t.stop
        end

        yield
      end
    end


    def self.stop
      @stop_condition.signal
    end


    def self.stop_event_loop
      stop
    end

  end
end

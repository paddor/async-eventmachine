# frozen_string_literal: true

module Async
  module EventMachine
    def self.add_timer(interval, callback = nil, &block)
      Timer.new interval, callback || block
    end


    def self.add_periodic_timer(interval, callback = nil, &block)
      PeriodicTimer.new interval, callback || block
    end


    def self.cancel_timer(timer)
      timer.cancel
    end


    class Timer
      def initialize(interval, callback = nil, &block)
        @interval = interval
        @code = callback || block
        schedule
      end


      def schedule
        Async do |t|
          t.sleep @interval
          @code.() unless @cancelled
        end
      end


      def cancel
        @cancelled = true
      end
    end



    class PeriodicTimer
      def initialize(interval, callback = nil, &block)
        @interval = interval
        @code = callback || block
        schedule
      end


      def schedule
        Async do |t|
          until @cancelled
            t.sleep @interval
            @code.() unless @cancelled
          end
        end
      end


      def cancel
        @cancelled = true
      end
    end


    def self.add_periodic_timer *args, &block
      interval = args.shift
      code = args.shift || block

      PeriodicTimer.new(interval, code)
    end


  end
end

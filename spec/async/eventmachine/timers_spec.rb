# frozen_string_literal: true

module Async
  RSpec.describe EventMachine do
    describe '.add_timer' do
      it 'adds timer' do
        timer = EventMachine.add_timer(1) { }
        assert_kind_of EventMachine::Timer, timer
      end
    end

    describe '.add_periodic_timer' do
      it 'adds periodic timer' do
        timer = EventMachine.add_periodic_timer(1) { }
        assert_kind_of EventMachine::PeriodicTimer, timer
      end
    end
  end


  RSpec.describe EventMachine::Timer do
    it 'fires after interval' do
      t0 = Time.now

      EventMachine::Timer.new 0.1 do
        t1 = Time.now
        assert_in_delta 0.1, t1 - t0, 0.01
      end
    end

    it 'does not block' do
      t0 = Time.now

      EventMachine::Timer.new(0.1) { }

      t1 = Time.now
      assert_in_delta t0, t1, 0.001
    end

    it 'can be canceled' do
      fired = false
      timer = EventMachine::Timer.new(0.01) { fired = true }
      timer.cancel
      sleep 0.05
      refute fired
    end

  end

  RSpec.describe EventMachine::PeriodicTimer do
    it 'fires repeatedly after interval' do
      t0 = Time.now

      fires = []
      timer = EventMachine::PeriodicTimer.new 0.001 do
        fires << Time.now
      end
      sleep 0.01
      timer.cancel

      fires.each_cons 2 do |t0, t1|
        assert_in_delta 0.001, t1 - t0, 0.001
      end

    end

    it 'does not block' do
      t0 = Time.now

      EventMachine::PeriodicTimer.new(0.1) { }

      t1 = Time.now
      assert_in_delta t0, t1, 0.001
    end

    it 'can be canceled' do
      fired = false
      timer = EventMachine::PeriodicTimer.new(0.01) { fired = true }
      timer.cancel
      sleep 0.05
      refute fired
    end

  end
end

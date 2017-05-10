#!/usr/bin/env ruby

# file: pinx.rb

# This is a base clase used by gems rpi_pwm, rpi_led_simulator, 
# myfirmata-plugin-led, and simple_wiimote.

class PinX
  
  HIGH = true
  LOW = false

  attr_reader :id

  def initialize(id)
    @id = id
    @on, @blinking = false, false
  end

  def blinking?()
    @blinking
  end
  
  def on(durationx=nil, duration: nil)
    
    set_pin HIGH
    @on, @blinking = true, false
    duration ||=  durationx
    
    @off_thread.exit if @off_thread
    @on_thread = Thread.new {(sleep duration; off()) } if duration

  end

  def off(durationx=nil, duration: nil)
    
    set_pin LOW
    @on, @blinking = false, false      
    duration ||=  durationx
    
    @on_thread.exit if @on_thread
    @off_thread = Thread.new { (sleep duration; on()) } if duration

  end    
  
  alias start on
  alias high on # opposite of low
  alias open on # opposite of close
  alias lock on # opposite of unlock
  
  alias stop off        
  alias low off
  alias close off
  alias unlock off
  

  def blink(seconds=0.5, duration: nil)

    self.stop if blinking?
    
    @blinking = true
    t2 = Time.now + duration if duration

    Thread.new do
      while @blinking do
        
        set_pin HIGH
        sleep seconds / 2.0
        break if !@blinking
        sleep seconds / 2.0 
        break if !@blinking
        
        set_pin LOW
        sleep seconds / 2.0
        break if !@blinking
        sleep seconds / 2.0 
        break if !@blinking
        
        self.off if duration and Time.now >= t2
      end
      
    end
  end
  
  alias oscillate blink
  
  def on?()  @on  end
  def off?() !@on end
  
  def to_s()
    @id
  end
  
  protected
  
  # set val with 0 (off) or 1 (on)
  #    
  def set_pin(val)
    @on  = val
  end
end
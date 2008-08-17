module Knock
  def ok(passed, desc=nil, errmsg=nil)
    testing desc do
      desc = (Thread.current[:knock_prefix] || []).join(" - ")
      desc = " - " + desc  unless desc.empty?
      
      if passed
        puts "ok#{desc}"
      else
        puts "not ok - %s%s" % [caller.find { |pos| pos !~ /\/knock/ }, desc]
        puts "# #{errmsg}"  if errmsg
      end
    end
    
    passed
  end
  
  def testing(desc, &block)
    (Thread.current[:knock_prefix] ||= []) << desc  if desc
    yield
  rescue => e
    ok false, "RAISED: #{e}"
    puts "#  " + e.backtrace.find_all { |pos| pos !~ /\/knock/ }.join("\n#  ")
  ensure
    Thread.current[:knock_prefix].pop  if desc
  end
  
  def     is(a, b, desc=nil)  ok a == b, desc  end
  def   isnt(a, b, desc=nil)  ok a != b, desc  end
  def   like(a, b, desc=nil)  ok a =~ b, desc  end
  def unlike(a, b, desc=nil)  ok a !~ b, desc  end
  
  def   pass(desc=nil)        ok   true, desc  end
  def   fail(desc=nil)        ok  false, desc  end
  
  def can(obj, *methods)
    desc = methods.pop  if methods.last.kind_of? String
    ok methods.all? { |m| obj.respond_to? m }, desc
  end
  
  def is_a(obj, klass, desc=nil)
    ok obj.kind_of?(klass), desc
  end
  
  def expect(value, &block)
    testing "expecting #{value.kind_of?(Class) && value <= Exception ?
                           "exception" : "value"} #{value.inspect}" do
      begin
        r = block.call
      rescue Object => e
        ok e.instance_of?(value)
      else
        ok r == value
      end
    end
  end

  def d(*obj)
    obj.each { |o| puts o.inspect.gsub(/^/, '# ') }
  end
end

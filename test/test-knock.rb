#!/usr/bin/env ruby

require '../knock.rb'
include Knock

testing "Knock" do
  testing "ok" do
    ok 1 == 1
    ok 1 == 1, "one equals one"
    
    ok 1 == 2
    ok 1 == 2, "one equals two"
  end

  testing "is" do
    is 1, 1
    is 1, 1, "one equals one"
    
    is 1, 2
    is 1, 2, "one equals two"
  end

  testing "isnt" do
    isnt 1, 2
    isnt 1, 2, "one doesn't equal two"

    isnt 1, 1
    isnt 1, 1, "one doesn't equal one"
  end
  
  testing "fail" do
    fail
    fail "meh"
  end
  
  testing "pass" do
    pass
    pass "yay"
  end

  testing "can" do
    can [1,2,3], :each, :reverse, :map
    can 3, :reverse
  end

  testing "is_a" do
    is_a "foo", String
    is_a 3, String
  end

  testing "d" do
    d "It's now #{Time.now}"
  end

  testing "error" do
    raise "meh"
  end

  testing "like" do
    like "foo", /o/
    like "bar", /o/
  end

  testing "unlike" do
    unlike "bar", /o/
    unlike "foo", /o/
  end

  testing "expect" do
    expect 5 do 2+3 end
    expect ZeroDivisionError do 1/0 end
  end
end

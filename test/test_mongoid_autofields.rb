require 'helper'

class TestMongoidAutofields < Test::Unit::TestCase
  context "Testing data types without declaration" do
    setup do
      class Basic
        include Mongoid::Document
        include Mongoid::Autofields
      end
    end

    should "test string fields without declartion" do
      b = Basic.create :data => 'very basic model'
      assert_equal String,  Basic.last.data.class
      assert_equal 'very basic model',  Basic.last.data
    end

    should "test fixnum fields without declartion" do
      b = Basic.create :data => 1234
      assert_equal Fixnum,  Basic.last.data.class
      assert_equal 1234,  Basic.last.data
    end

    should "test float fields without declartion" do
      class Person
        include Mongoid::Document
        field :data, :type => Float
      end
      p = Person.create :data => 12.34
      b = Basic.create :data => 12.34
      assert_equal Person.last.data,  Basic.last.data
      assert_equal Float,  Basic.last.data.class
      assert_equal 12.34,  Basic.last.data
    end

    should "test hash fields without declartion" do
      b = Basic.create :data => { :name => 'blah', :year => 23 }
      assert_equal BSON::OrderedHash,  Basic.last.data.class
      assert_equal( { 'name' => 'blah', 'year' => 23 },  Basic.last.data)
    end

    should "test array fields without declartion" do
      b = Basic.create :data => [1,2,3]
      assert_equal Array,  Basic.last.data.class
      assert_equal( [1,2,3],  Basic.last.data)
    end

    should "test boolean fields without declartion" do
      b = Basic.create :data => true
      assert_equal TrueClass,  Basic.last.data.class
      assert_equal( true,  Basic.last.data)
    end

    should "test time fields without declartion" do
      time = Time.now
      b = Basic.create :data => time
      assert_equal Time,  Basic.last.data.class
      assert_equal( time.to_i,  Basic.last.data.to_i)
    end

    should "test symbol fields without declartion" do
      b = Basic.create :data => :moop
      assert_equal Symbol,  Basic.last.data.class
      assert_equal( :moop,  Basic.last.data)
    end
  end
end

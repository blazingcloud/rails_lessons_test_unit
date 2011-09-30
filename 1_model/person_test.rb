require 'test/unit'
class PersonTest < Test::Unit::TestCase
  def test_first_and_last_name
    p = Person.new(:first_name => "Eve", :last_name => "Smith")
    p.first_name.should == "Eve"
    p.last_name.should == "Smith"
  end
  def test_full_name
    p = Person.new(:first_name => "Eve", :last_name => "Smith")
    p.full_name.should == "Eve Smith"
  end
  def test_valid_record_with_first_and_last_name
    p = Person.new(:first_name => "Eve", :last_name => "Smith")
    p.should be_valid
  end
  def test_invalid_with_only_first_name 
    p = Person.new(:first_name => "Eve")
    assert !p.valid?
    assert p.errors[:last_name].include?("can't be blank")
  end
  def test_invalid_with_only_last_name 
    p = Person.new(:last_name => "Smith")
    assert !p.valid?
    assert p.errors[:first_name].include?("can't be blank")
  end
end

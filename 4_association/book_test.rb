require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Book do
  it 'should have title and year published' do
    b = Book.new(:title => "Oliver Twist", :year => 1838)
    b.title.should == "Oliver Twist"
    b.year.should == 1838
  end

  describe "authors" do
    it 'should have many authors' do
      pending
      b = Book.new(:title => "Oliver Twist", :year => 1838)
      assert b.respond_to? :authors, "should respond to authors"
    end

    it 'should have no authors in a new record' do
      pending
      b = Book.new(:title => "Oliver Twist", :year => 1838)
      assert b.authors.empty?, "should be empty on new record"
    end

    it 'should allow creation of an author' do
      pending
      b = Book.new(:title => "Oliver Twist", :year => 1838)
      # assert_difference instead of lambda {}.should change(...)
      assert_difference 'Person.count', 1 do
        b.authors.create!(:first_name => "Charles", :last_name => "Dickens")  
      end
      b.authors.first.last_name.should == "Dickens"
    end
  end
end






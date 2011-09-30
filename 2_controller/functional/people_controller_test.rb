require 'test_helper'

class PeopleControllerTest <  ActionController::TestCase
  def setup
    @emmy = Person.create! :first_name => "Emmy", :last_name => "Noether"
    @marie = Person.create! :first_name => "Marie", :last_name => "Curie"
    @lise = Person.create! :first_name => "Lise", :last_name => "Meitner"   
  end

  test "GET index renders renders" do
    get :index
    assert_template(:index,%%should render_template :index%) 
  end

  test "GET index renders sets up the whole list of people" do
    get :index
    assigns[:people].should == [@emmy, @marie, @lise]
  end

  test "POST creates a person record" do
    Person.where(:first_name => "Barbara", :last_name => "Liskov").first.should be_nil    
    post :create, :person => {:first_name => "Barbara", :last_name => "Liskov"}      
    @barbara = Person.where(:first_name => "Barbara", :last_name => "Liskov").first
    @barbara.should_not be_nil
  end

  test "POST create redirects" do
    Person.where(:first_name => "Barbara", :last_name => "Liskov").first.should be_nil    
    post :create, :person => {:first_name => "Barbara", :last_name => "Liskov"}      
    @barbara = Person.where(:first_name => "Barbara", :last_name => "Liskov").first
    response.should redirect_to person_path(@barbara)
  end

  test "with invalid data does not create a person" do
    @total_people = Person.count
    post :create, :person => {:first_name => "Barbara"}         
    Person.count.should == @total_people
  end
  test "with invalid data should render new template" do
    @total_people = Person.count
    post :create, :person => {:first_name => "Barbara"}         
    assert_template(:new,%%should render_template :new%)
  end

  test "GET new should render new page" do
    get :new
    assert_template(:new,%%should render_template :new%)
  end
  test "GET new assigns a new record" do
    get :new
    assigns[:person].should be_new_record
  end

  test "GET edit should render edit page" do
    get :edit, :id => @emmy.id
    assert_template(:edit,%%should render_template :edit%)
  end

  test "GET edit assigns a the emmy record" do
    get :edit, :id => @emmy.id
    assigns[:person].should == @emmy
  end

  test "PUT update updates the record" do
    put :update, {:id => @emmy.id, :person => {:last_name => "Lou Harris"}}
    @emmy.reload
    @emmy.last_name.should == "Lou Harris"
  end    
  test "PUT update redirects to show page" do
    put :update, {:id => @emmy.id, :person => {:last_name => "Lou Harris"}}
    response.should redirect_to person_path(@emmy)      
  end

  test "with invalid attributes should not update the record" do
    put :update, {:id => @emmy.id, :person => {:last_name => ""}}
    @emmy.reload
    @emmy.last_name.should_not == ""
  end
  it "with invalid attributes should render to edit page" do
    put :update, {:id => @emmy.id, :person => {:last_name => ""}}
    assert_template(:edit,%%should render_template :edit%)
  end

  test "DELETE destroy should destroy the record" do
    delete :destroy, {:id => @emmy}
    Person.find_by_id(@emmy.id).should be_nil
  end

  test " DELETE destroy should redirect to people page" do
    delete :destroy, {:id => @emmy}
    response.should redirect_to people_path
  end
end


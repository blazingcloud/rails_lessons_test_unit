require 'test_helper'

class ArticlesControllerTest <  ActionController::TestCase
  def setup
    @a1 = {
      :title => "Using the New Gem Bundler Today",
      :url => "http://yehudakatz.com/2009/11/03/using-the-new-gem-bundler-today/",
      :author => "Yehuda Katz",
      :published_on => Date.new(2009, 11, 3)}

    @a2 = {
      :title => "Make Rails Associations Faster by Optimizing Named Blocks and String Callbacks",
      :url => "http://blog.pluron.com/2008/02/rails-faster-as.html",
      :author => "Alexander Dymo",
      :published_on => Date.new(2008, 2, 13)}

    @a3 = {
      :title => "Rails REST 101 meets Rails 2.0",
      :url => "http://www.softiesonrails.com/2008/1/29/rails-rest-101-meets-rails-2-0",
      :author => nil,
      :published_on => Date.new(2008, 1, 28)}

    @a4 = {
      :title => "Understanding Rails Routes",
      :url => "http://railsnotes.com/213-understanding-routes-rb/",
      :author => "Melvin Ram",
      :published_on => nil}

    @article1 = Article.create!(@a1)
    @article2 = Article.create!(@a2)
    @article3 = Article.create!(@a3)
    @article4 = Article.create!(@a4)
  end

  test "GET index renders" do
    get :index
    assigns[:articles].should == [@article1, @article2, @article3, @article4]
    assert_template('index',%%should render_template 'index'%)
  end

  test "GET new renders" do
    fail 'pending'
    get :new
    assigns[:article].should be_new_record
    assert_template('edit',%%should render_template 'edit'%)
  end

  test "GET edit renders" do
    fail 'pending'
    get :edit, {:id => @article1.id}
    assigns[:article].should == @article1
    assert_template('edit',%%should render_template 'edit'%)
  end

end



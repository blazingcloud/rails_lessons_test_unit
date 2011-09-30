require 'test_helper'

class EchoControllerTest <  ActionController::TestCase
  describe "GET index" do
    it "renders" do
      get :index
      assert_template('echo/index',%%should render_template 'echo/index'%)
    end
     
    it "renders with text param" do
      text = "something"
      get :index, {:text => text}
      assigns[:text].should == text
      assert_template('echo/index',%%should render_template 'echo/index'%)
    end
  end
end

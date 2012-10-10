require File.dirname(__FILE__) + '/../spec_helper'

describe ConferencesController do
  fixtures :all
  render_views

  let!(:valid_attributes) {{ :name => "Test", 
                            :starts_at => Time.now,
                            :url => "http://something.com" }}

  let!(:conference) { Conference.create!(valid_attributes) }

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Conference.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  pending "create action should render new template when model is invalid" do
    post :create, valid_attributes.merge(:name => "")
    response.should render_template(:new)
  end

  it "create action should create a conference when it is valid" do
    expect {
      post :create, :conference => valid_attributes
    }.to change {Conference.count}.by(1)
  end

  it "edit action should render edit template" do
    get :edit, :id => Conference.first
    response.should render_template(:edit)
  end

  pending "update action should render edit template when model is invalid" do
    put :update, :id => Conference.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    put :update, :id => Conference.first, 
                 :conference => valid_attributes.merge(:name => "Next Test")
    response.should redirect_to(conference_url(assigns[:conference]))
  end

  it "destroy action should destroy model and redirect to index action" do
    delete :destroy, :id => conference
    response.should redirect_to(conferences_url)
    Conference.exists?(conference.id).should be_false
  end
end

require "spec_helper"

describe GoalsController do
  describe "routing" do

    it "routes to #index" do
      get("users/1/goals").should route_to("goals#index", user_id: "1")
    end

    it "routes to #new" do
      get("users/1/goals/new").should route_to("goals#new", user_id: "1")
    end

    it "routes to #show" do
      get("/users/1/goals/1").should route_to("goals#show", user_id: "1", id: "1")
    end

    it "routes to #edit" do
      get("/users/1/goals/1/edit").should route_to("goals#edit", user_id: "1", id: "1")
    end

    it "routes to #create" do
      post("/users/1/goals").should route_to("goals#create", user_id: "1")
    end

    it "routes to #update" do
      put("/users/1/goals/1").should route_to("goals#update", user_id: "1", id: "1")
    end

    it "routes to #destroy" do
      delete("/users/1/goals/1").should route_to("goals#destroy", user_id: "1", id: "1")
    end

  end
end

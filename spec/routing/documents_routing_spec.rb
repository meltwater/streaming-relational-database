require "rails_helper"

describe DocumentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/documents").to route_to("documents#index")
    end

    it "routes to #show" do
      expect(get: "/documents/1").to route_to("documents#show", :id => "1")
    end
  end
end

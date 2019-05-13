defmodule HoundTest do
  use ExUnit.Case
  use Racelist.FeatureCase
  use Hound.Helpers
  import Racelist.Router.Helpers
  import Racelist.TestHelpers
  
  describe "main page" do
    test "homepage loads successfully", _meta do
      navigate_to("/")
      assert page_title() == "Hello Racelist!"
    end
  end
end

defmodule Racelist.MainPageTest do
  use ExUnit.Case
  use Racelist.FeatureCase
  use Hound.Helpers

  describe "main page" do
    
    test "homepage loads successfully", _meta do
      navigate_to("/")
      assert page_title() == "Hello Racelist!"
    end
  end

  describe "signing in" do
    test "successfull signing in with Google", _meta do
      navigate_to("/")
      Racelist.TestHelpers.sign_in_user()

      _navigation = find_element(:xpath, ~s|//*[@id="nav-mobile"]|)

      assert current_url() == "http://localhost:4001/#"
      assert page_source() =~ "My races"
      assert page_source() =~ "Profile"
      assert page_source() =~ "Sign out"
      assert page_source() =~ "Welcome, Olga"
    end
  end
end

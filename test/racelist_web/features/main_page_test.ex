defmodule HoundTest do
  use ExUnit.Case
  use Racelist.FeatureCase
  use Hound.Helpers
  
  describe "main page" do
    @tag :skip
    test "homepage loads successfully", _meta do
      navigate_to("/")
      assert page_title() == "Hello Racelist!"
    end
  end

  describe "registration" do
    test "successfull registration", _meta do
      navigate_to("/")
    
      element = find_element(:id, "sign-in-link")
      element |> click()
      
      email = find_element(:xpath, "//input[@aria-label='Email or phone']")
      email |> fill_field(System.get_env("GMAIL"))

      next_button = find_element(:xpath, ~s|//*[@id="identifierNext"]|)
      next_button |> click()
      
      password = find_element(:xpath, "//input[@aria-label='Enter your password']")
      :timer.sleep(4000)
      password |> fill_field(System.get_env("TEST_GMAIL_PASSWORD"))

      submit = find_element(:xpath, ~s|//*[@id="passwordNext"]|)
      submit |> click()
      :timer.sleep(3000)

      assert current_url() == "http://localhost:4001/#"
      assert page_source() =~ "My races"
      assert page_source() =~ "Profile"
      assert page_source() =~ "Sign out"
      assert page_source() =~ "Welcome, Olga"
    end
  end
end

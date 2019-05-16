defmodule HoundTest do
    use ExUnit.Case
    use Racelist.FeatureCase
    use Hound.Helpers

    describe "races" do
      test "page is not available to a not-signed in user" do
        navigate_to("/races")

        assert page_source() =~ "Please sign in to see this page"
      end

      test "successfully adding race to the list", _meta do
        navigate_to("/races")
      
        element = find_element(:id, "sign-in-link")
        element |> click()
        
        email = find_element(:xpath, "//input[@aria-label='Email or phone']")
        email |> fill_field(System.get_env("TEST_GMAIL"))
  
        next_button = find_element(:xpath, ~s|//*[@id="identifierNext"]|)
        next_button |> click()
        
        password = find_element(:xpath, "//input[@aria-label='Enter your password']")
        password |> fill_field(System.get_env("TEST_GMAIL_PASSWORD"))
  
        submit = find_element(:xpath, ~s|//*[@id="passwordNext"]|)
        submit |> click()

        add_button = find_element(:xpath, ~s|//*[@id="add-race-button"]|)
        add_button |> click()

        race_title = find_element(:xpath, "//input[@id='race_title']")
        race_title |> fill_field("NYC Marathon test")

        race_distance = find_element(:xpath, "//select[@id='race_distance']")
        selected_distance = find_element(:css, "#race_distance option[value='5']")
        selected_distance |> click()

        race_distance_unit = find_element(:xpath, "//select[@id='race_distance_unit']")
        selected_unit = find_element(:css, "#race_distance_unit option[value='km']")
        selected_unit |> click()

        race_race_date_year = find_element(:xpath, "//select[@id='race_race_date_year']")
        selected_year = find_element(:css, "#race_race_date_year option[value='2020']")
        selected_year |> click()

        race_race_date_month = find_element(:xpath, "//select[@id='race_race_date_month']")
        selected_month = find_element(:css, "#race_race_date_month option[value='11']")
        selected_month |> click()

        race_race_date_day = find_element(:xpath, "//select[@id='race_race_date_day']")
        selected_day = find_element(:css, "#race_race_date_day option[value='2']")
        selected_day |> click()

        race_location = find_element(:xpath, "//input[@id='race_location']")
        race_location |> fill_field("NYC")

        submit_button = find_element(:xpath, "//button[@type='submit']")
        submit_button |> click()
        _race_list = find_element(:tag, "h4")

        assert current_url() == "http://localhost:4001/races"
        assert page_source() =~ "race created"
        assert page_source() =~ "My races"
        assert page_source() =~ "NYC Marathon test"
      end
    end
  end
  
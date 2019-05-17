defmodule Racelist.TestHelpers do
  alias Racelist.{Repo, User}
  use Hound.Helpers
  
  def user_fixture(attrs \\ %{}) do
    params =
      attrs
      |> Enum.into(%{
        first_name: "Tony",
        last_name: "Stark",
        email: "ironman#{System.unique_integer([:positive])}@example.com",
        token: "2u9dfh7979hfd",
        provider: "google"
      })
  
    {:ok, user} =
      User.changeset(%User{}, params)
      |> Repo.insert()
  
    user
  end

  def sign_in_user() do
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
  end

  def add_race() do
    add_button = find_element(:xpath, ~s|//*[@id="add-race-button"]|)
    add_button |> click()

    race_title = find_element(:xpath, "//input[@id='race_title']")
    race_title |> fill_field("NYC Marathon test")

    selected_distance = find_element(:css, "#race_distance option[value='5']")
    selected_distance |> click()

    selected_unit = find_element(:css, "#race_distance_unit option[value='km']")
    selected_unit |> click()

    selected_year = find_element(:css, "#race_race_date_year option[value='2020']")
    selected_year |> click()

    selected_month = find_element(:css, "#race_race_date_month option[value='11']")
    selected_month |> click()

    selected_day = find_element(:css, "#race_race_date_day option[value='2']")
    selected_day |> click()

    race_location = find_element(:xpath, "//input[@id='race_location']")
    race_location |> fill_field("NYC")

    submit_button = find_element(:xpath, "//button[@type='submit']")
    submit_button |> click()
  end
end
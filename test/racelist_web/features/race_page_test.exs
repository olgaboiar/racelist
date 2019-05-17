defmodule Racelist.RacePageTest do
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

        Racelist.TestHelpers.sign_in_user()
        Racelist.TestHelpers.add_race()

        _race_list = find_element(:tag, "h4")

        assert current_url() == "http://localhost:4001/races"
        assert page_source() =~ "race created"
        assert page_source() =~ "My races"
        assert page_source() =~ "NYC Marathon test"
      end

      test "successfully editing existing race", _meta do
        navigate_to("/races")

        Racelist.TestHelpers.sign_in_user()
        Racelist.TestHelpers.add_race()
        Racelist.TestHelpers.edit_race()

        _race_list = find_element(:tag, "h4")

        assert current_url() == "http://localhost:4001/races"
        assert page_source() =~ "Race updated"
        assert page_source() =~ "My races"
        assert page_source() =~ "NYC Marathon edited"
      end
    end
  end
  
require "application_system_test_case"

class IsasTest < ApplicationSystemTestCase
  setup do
    @isa = isas(:one)
  end

  test "visiting the index" do
    visit isas_url
    assert_selector "h1", text: "Isas"
  end

  test "creating a Isa" do
    visit isas_url
    click_on "New Isa"

    fill_in "Name", with: @isa.name
    click_on "Create Isa"

    assert_text "Isa was successfully created"
    click_on "Back"
  end

  test "updating a Isa" do
    visit isas_url
    click_on "Edit", match: :first

    fill_in "Name", with: @isa.name
    click_on "Update Isa"

    assert_text "Isa was successfully updated"
    click_on "Back"
  end

  test "destroying a Isa" do
    visit isas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Isa was successfully destroyed"
  end
end

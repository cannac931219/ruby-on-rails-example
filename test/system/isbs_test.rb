require "application_system_test_case"

class IsbsTest < ApplicationSystemTestCase
  setup do
    @isb = isbs(:one)
  end

  test "visiting the index" do
    visit isbs_url
    assert_selector "h1", text: "Isbs"
  end

  test "creating a Isb" do
    visit isbs_url
    click_on "New Isb"

    fill_in "Isa Id", with: @isb.isa_id_id
    fill_in "Name", with: @isb.name
    click_on "Create Isb"

    assert_text "Isb was successfully created"
    click_on "Back"
  end

  test "updating a Isb" do
    visit isbs_url
    click_on "Edit", match: :first

    fill_in "Isa Id", with: @isb.isa_id_id
    fill_in "Name", with: @isb.name
    click_on "Update Isb"

    assert_text "Isb was successfully updated"
    click_on "Back"
  end

  test "destroying a Isb" do
    visit isbs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Isb was successfully destroyed"
  end
end

require "application_system_test_case"

class ImagesTest < ApplicationSystemTestCase
  setup do
    @image = images(:one)
  end

  test "visiting the index" do
    visit images_url
    assert_selector "h1", text: "Images"
  end

  test "creating a Image" do
    visit images_url
    click_on "New Image"

    fill_in "Date", with: @image.date
    fill_in "Description", with: @image.description
    fill_in "File Type", with: @image.file_type
    fill_in "Image", with: @image.image_id
    fill_in "Image Owner", with: @image.image_owner_id
    fill_in "Image Title", with: @image.image_title
    fill_in "Is Approved", with: @image.is_approved
    fill_in "Licensing", with: @image.licensing
    fill_in "Location", with: @image.location
    fill_in "Tag", with: @image.tag_id
    click_on "Create Image"

    assert_text "Image was successfully created"
    click_on "Back"
  end

  test "updating a Image" do
    visit images_url
    click_on "Edit", match: :first

    fill_in "Date", with: @image.date
    fill_in "Description", with: @image.description
    fill_in "File Type", with: @image.file_type
    fill_in "Image", with: @image.image_id
    fill_in "Image Owner", with: @image.image_owner_id
    fill_in "Image Title", with: @image.image_title
    fill_in "Is Approved", with: @image.is_approved
    fill_in "Licensing", with: @image.licensing
    fill_in "Location", with: @image.location
    fill_in "Tag", with: @image.tag_id
    click_on "Update Image"

    assert_text "Image was successfully updated"
    click_on "Back"
  end

  test "destroying a Image" do
    visit images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Image was successfully destroyed"
  end
end

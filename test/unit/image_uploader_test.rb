# encoding: utf-8

require File.expand_path('../../test_helper', __FILE__)

class ImageUploaderVersionTest < ActiveSupport::TestCase
  setup do
    ImageUploader.enable_processing = true
    @uploader = ImageUploader.new(duels(:dystopia), :image)
    @uploader.store!((Rails.root + 'test/fixtures/images/appie.jpg').open)
  end

  teardown do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  test "creates the 'big' version which has a height of 506 pixels while retaining the aspect ratio" do
    image = MiniMagick::Image.open(@uploader.current_path)
    assert_equal [466, 506], [image[:width], image[:height]]
  end

  test "creates a 'small' version which has a height of 230 pixels while retaining the aspect ratio" do
    image = MiniMagick::Image.open(@uploader.thumb.current_path)
    assert_equal [212, 230], [image[:width], image[:height]]
  end
end

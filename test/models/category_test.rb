require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end

  test "create new category" do
    assert @category.valid?
  end

  test "name must be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name must be unique" do 
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name minimum is 4" do
    @category.name = "aa"
    assert_not @category.valid?
  end

  test "name maximum is 25" do
    @category.name = "aa" * 26
    assert_not @category.valid?
  end
end
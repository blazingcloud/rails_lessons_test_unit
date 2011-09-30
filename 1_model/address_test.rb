require 'test/unit'
class AddressTest < Test::Unit::TestCase
  def setup
    @valid_attributes = {
      :house_number => 1,
      :street => "Penny Lane",
      :city => "San Francisco",
      :state => "CA",
      :zip => "94132"
    }
  end
  def test_valid_new_instance
     Address.create!(@valid_attributes)
  end
  def test_valid_new_instance_with_ext_zip
    @valid_attributes[:zip] = "94132-4555"
    Address.create!(@valid_attributes)
  end
  def test_invalid_needs_house_to_be_number
      invalid_attributes = @valid_attributes.merge(:house_number => "a")
      a = Address.new(invalid_attributes)
      assert !a.valid?, 'expected invalid Address - house number is number'
  end

  def test_invalid_needs_street
      invalid_attributes = @valid_attributes
      invalid_attributes.delete(:street)
      a = Address.new(invalid_attributes)
      assert !a.valid?, 'expected invalid Address - needs street'
  end

  def test_invalid_needs_city
      invalid_attributes = @valid_attributes
      invalid_attributes.delete(:city)
      a = Address.new(invalid_attributes)
      assert !a.valid?, 'expected invalid Address - needs city'
  end

  def test_state_must_be_2_chars
      invalid_attributes = @valid_attributes.merge(:state => "test")
      a = Address.new(invalid_attributes)
      assert !a.valid?
  end

  def test_state_must_not_be_1_char
      invalid_attributes = @valid_attributes.merge(:state => "a")
      a = Address.new(invalid_attributes)
      assert !a.valid?
  end
  def test_invalid_zip_letters
    fail "implement me"
  end
  def test_invalid_zip_length
    fail "implement me"
  end
  def test_invalid_zip_dash_plus_4_if_longer_than_5
    fail "implement me"
  end
end

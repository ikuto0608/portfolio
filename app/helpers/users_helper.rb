module UsersHelper
  def antagonistic_color(color)
    rgb = color.slice(1, 6).scan(/.{1,#{2}}/).map{|c| c.hex }
    reference_value = 255
    rgb = rgb.inject([]) {|a, c| a << reference_value - c; a }
    rgb.inject("#") {|s, c| s += c.to_s(16); s }
  end

  def complementary_color(color)
    rgb = color.slice(1, 6).scan(/.{1,#{2}}/).map{|c| c.hex }
    reference_value = rgb.max + rgb.min
    rgb = rgb.inject([]) {|a, c| a << reference_value - c; a }
    rgb.inject("#") {|s, c| s += c.to_s(16); s }
  end
end

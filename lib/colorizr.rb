class String
  @colors_dic = {
    :red => 31,
    :green => 32,
    :yellow => 33,
    :blue => 34,
    :pink => 95,
    :light_blue => 94,
    :white => 97,
    :light_grey => 37,
    :black => 30
  }
  
  def self.color
    return @colors_dic.keys
  end
  
  def self.create_colors
    @colors_dic.each do |color, value|
      color_method = %Q{
        def #{color}
          escape = "\e["
          num = #{value}
          return escape + num.to_s + "m" + self.to_s + escape + "0m"
        end
      }
      class_eval(color_method)
    end
  end
  
  def self.sample_colors
    @colors_dic.each do |color, value|
      escape = "\e["
      num = value.to_s
      puts "This is " + escape + num + "m" + color.to_s + escape + "0m"
    end
  end
end

String.create_colors
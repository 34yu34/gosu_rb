class Static_Text
  def initialize(text, height, width, pos_x, pos_y)
    @image = Image.from_text(text, height, width: width, align: :center)
    @image.draw(pos_x, pos_y, Layer::BOARD)
    @left_x = pos_x
    @right_x = pos_x + width
    @top_y = pos_y
    @bottom_y = pos_y + height
  end

  def next_pos_x
    @right_x
  end

  def next_pos_y
    @bottom_y
  end

end

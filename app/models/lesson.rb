class Lesson
  attr_reader :title, :content

  def initialize(args)
    @title = args[:title]
    @content = args[:content]
  end
end

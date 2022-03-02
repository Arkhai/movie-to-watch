class Film
  attr_reader :genre

  def initialize(params)
    @name = params[:name]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Жанр(ы): #{@genre} — «#{@name}» (#{@year})"
  end
end

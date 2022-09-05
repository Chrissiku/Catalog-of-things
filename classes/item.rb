class Item
  attr_accessor :publish_date
  attr_reader :genre, :label, :author, :archived, :source

  def initialize(date)
    @id = Random.rand(1..1000)
    @publish_date = Date.strptime(date, '%Y-%m-%d')
    @archived = false
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

  def move_to_archive
    true if can_be_archived?
  end

  private :can_be_archived?
end

class Tribe
  attr_reader :name, :members

  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end

    puts to_s
  end

  def to_s
    name
  end

end

require 'scalar'

class Numeric

  def to_length(units = :metres)
    Length.new(self, units)
  end

  def millimetres
    to_length(:millimetres)
  end
  
  def centimetres
    to_length(:centimetres)
  end
  
  def metres
    to_length(:metres)
  end
  
  def kilometres
    to_length(:kilometres)
  end
  
  def inches
    to_length(:inches)
  end
  
  def feet
    to_length(:feet)
  end
  
  def yards
    to_length(:yards)
  end
  
  def miles
    to_length(:miles)
  end

  alias_method :millimetre, :millimetres
  alias_method :centimetre, :centimetres
  alias_method :metre, :metres
  alias_method :kilometre, :kilometres
  alias_method :inch, :inches
  alias_method :foot, :feet
  alias_method :yard, :yards
  alias_method :mm, :millimetres
  alias_method :cm, :centimetres
  alias_method :m, :metres
  alias_method :km, :kilometres
  alias_method :in, :inches
  alias_method :ft, :feet
  alias_method :yard, :yards
  alias_method :mile, :miles

end

class Length

  include Scalar

  @@conversion_table = {
    'millimetres' => 0.001, 
    'centimetres' => 0.01, 
    'metres' => 1.0, 
    'kilometres' => 1000.0,
    'inches' => 0.0254,
    'feet' => 0.3048,
    'yards' =>  0.9144,
    'miles' => 1609.344
  }
  
  
  @@formats = {
    'millimetres' => "%smm",
    'centimetres' => "%scm",
    'metres' => "%sm",
    'kilometres' => "%sKm",
    'inches' => "%s in.",
    'feet' => "%s ft." ,
    'yards' => "%s yd.",
    'miles' => "%s mi."
  }

end

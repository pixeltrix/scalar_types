require 'scalar'

class Numeric

  def to_area(units = :square_metres)
    Area.new(self, units)
  end

  def square_millimetres
    to_area(:square_millimetres)
  end

  def square_centimetres
    to_area(:square_centimetres)
  end
  
  def square_metres
    to_area(:square_metres)
  end
  
  def square_kilometres
    to_area(:square_kilometres)
  end
  
  def hectares
    to_area(:hectares)
  end
  
  def square_inches
    to_area(:square_inches)
  end
  
  def square_feet
    to_area(:square_feet)
  end
  
  def square_yards
    to_area(:square_yards)
  end

  def square_miles
    to_area(:square_miles)
  end
  
  def acres
    to_area(:acres)
  end

  alias_method :square_millimetres, :square_millimetres
  alias_method :square_centimetre, :square_centimetres
  alias_method :square_metre, :square_metres
  alias_method :square_kilometre, :square_kilometres
  alias_method :hectare, :hectares
  alias_method :square_inch, :square_inches
  alias_method :square_foot, :square_feet
  alias_method :square_yard, :square_yards
  alias_method :square_mile, :square_yards
  alias_method :mm2, :square_millimetres
  alias_method :cm2, :square_centimetres
  alias_method :m2, :square_metres
  alias_method :km2, :square_kilometres
  alias_method :Km2, :square_kilometres
  alias_method :sq_in, :square_inches
  alias_method :sq_ft, :square_feet
  alias_method :sq_yd, :square_yards
  alias_method :sq_mi, :square_miles
  alias_method :acre, :acres

end

class Area

  include Scalar

  @@conversion_table = {
    'square_millimetres' => 0.000001, 
    'square_centimetres' => 0.0001, 
    'square_metres' => 1.0, 
    'hectares' => 10000.0,
    'square_kilometres' => 1000000.0, 
    'square_inches' => 0.00064516, 
    'square_feet' => 0.09290304, 
    'square_yards' => 0.83612736, 
    'square_miles' => 2589988.110336,
    'acres' => 4046.8564224
  }
  
  @@formats = {
    'square_millimetres' => "%smm²",
    'square_centimetres' => "%scm²",
    'square_metres' => "%sm²",
    'hectares' => "%sha",
    'square_kilometres' => "%sKm²",
    'square_inches' => "%s sq. in.",
    'square_feet' => "%s sq. ft.",
    'square_yards' => "%s sq. yd.",
    'square_miles' => "%s sq. mi.",
    'acres' => "%s ac."
  }

end

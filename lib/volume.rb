require 'scalar'

class Numeric

  def to_volume(units = :cubic_metres)
    Volume.new(self, units)
  end

  def cubic_millimetres
    to_volume(:cubic_millimetres)
  end
  
  def cubic_centimetres
    to_volume(:cubic_centimetres)
  end
  
  def cubic_metres
    to_volume(:cubic_metres)
  end
  
  def cubic_kilometres
    to_volume(:cubic_kilometres)
  end
  
  def cubic_inches
    to_volume(:cubic_inches)
  end
  
  def cubic_feet
    to_volume(:cubic_feet)
  end
  
  def cubic_yards
    to_volume(:cubic_yards)
  end

  def cubic_miles
    to_volume(:cubic_miles)
  end
  
  def microlitres
    to_volume(:microlitre)
  end

  def millilitres
    to_volume(:millilitres)
  end
  
  def litres
    to_volume(:litres)
  end
  
  def fluid_ounces
    to_volume(:fluid_ounces)
  end
  
  def pints
    to_volume(:pints)
  end
  
  def gallons
    to_volume(:gallons)
  end

  alias_method :cubic_millimetre, :cubic_millimetres
  alias_method :cubic_centimetre, :cubic_centimetres
  alias_method :cubic_metre, :cubic_metres
  alias_method :cubic_kilometre, :cubic_kilometres
  alias_method :cubic_inch, :cubic_inches
  alias_method :cubic_foot, :cubic_feet
  alias_method :cubic_yard, :cubic_yards
  alias_method :cubic_mile, :cubic_miles
  alias_method :cc, :cubic_centimetres
  alias_method :cm3, :cubic_centimetres
  alias_method :cm3, :cubic_centimetres
  alias_method :m3, :cubic_metres
  alias_method :cu_in, :cubic_inches
  alias_method :cu_ft, :cubic_feet
  alias_method :cu_yd, :cubic_yards
  alias_method :microlitre, :microlitres
  alias_method :millilitre, :millilitres
  alias_method :ml, :millilitres
  alias_method :litre, :litres
  alias_method :l, :litres
  alias_method :fluid_ounce, :fluid_ounces
  alias_method :pint, :pints
  alias_method :gallon, :gallons

end

class Volume

  include Scalar

  @@conversion_table = {
    'cubic_millimetres' => 0.000000001, 
    'cubic_centimetres' => 0.000001, 
    'cubic_metres' => 1.0,
    'cubic_kilometres' => 1000000000.0,
    'microlitre' => 0.000000001, 
    'millilitres' => 0.000001, 
    'litres' => 0.001,
    'cubic_inches' => 0.0000163871,
    'cubic_feet' => 0.0283168466,
    'cubic_yards' => 0.764554858,
    'cubic_miles' => 4168181825.4405794,
    'fluid_ounces' => 0.0000284131,
    'pints' => 0.0005682613,
    'gallons' => 0.00454609
  }
    
  @@formats = {
    'cubic_millimetres' => "%smm³",
    'cubic_centimetres' => "%scm³",
    'cubic_metres' => "%sm³",
    'cubic_kilometres' => "%sKm³",
    'microlitre' => "%sµl",
    'millilitres' => "%sml",
    'litres' => "%sl",
    'cubic_inches' => "%s cu. in.",
    'cubic_feet' => "%s cu. ft." ,
    'cubic_yards' => "%s cu. yd.",
    'cubic_miles' => "%s cu. mi.",
    'fluid_ounces' => "%s fl. oz.",
    'pints' => "%s pt." ,
    'gallons' => "%s gal."
  }

end

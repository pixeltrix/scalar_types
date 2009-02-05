require 'scalar'

class Numeric

  def to_weight(units = :kilograms)
    Weight.new(self, units)
  end

  def grams
    to_weight(:grams)
  end
  
  def kilograms
    to_weight(:kilograms)
  end
  
  def ounces
    to_weight(:ounces)
  end
  
  def pounds
    to_weight(:pounds)
  end
  
  def stones
    to_weight(:stones)
  end
  
  alias_method :gram, :grams
  alias_method :g, :grams
  alias_method :kilogram, :kilograms
  alias_method :kilos, :kilograms
  alias_method :kilo, :kilograms
  alias_method :kg, :kilograms
  alias_method :Kg, :kilograms
  alias_method :ounce, :ounces
  alias_method :oz, :ounces
  alias_method :pound, :pounds
  alias_method :lbs, :pounds
  alias_method :lb, :pounds
  alias_method :stone, :stones
  alias_method :st, :stones

end

class Weight

  include Scalar

  @@conversion_table = {
    'micrograms' => 0.000000001,
    'milligrams' => 0.000001,
    'centigrams' => 0.00001,
    'decigrams' => 0.0001,
    'grams' => 0.001, 
    'dekagrams' => 0.01, 
    'hectogram' => 0.1,
    'kilograms' => 1.0,
    'megagrams' => 1000.0,
    'metric_tons' => 1000.0,
    'tonnes' => 1000.0,
    'ounces' => 0.0283495231, 
    'pounds' => 0.45359237, 
    'stones' => 6.35029318,
    'hundredweight' => 50.80234544,
    'tons' => 1016.0469088
  }

  @@formats = {
    'micrograms' => "%sµg",
    'milligrams' => "%smg",
    'centigrams' => "%scg",
    'decigrams' => "%sdg",
    'grams' => "%sg",
    'dekagrams' => "%sdag",
    'hectogram' => "%sHg",
    'kilograms' => "%sKg",
    'megagrams' => "%sMg",
    'metric_tons' => "%st",
    'tonnes' => "%st",
    'ounces' => "%soz",
    'pounds' => "%slb",
    'stones' => "%sst",
    'hundredweight' => "%scwt",
    'tons' => "%sT"
  }

end

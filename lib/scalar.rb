module Scalar
  
  def self.included(base)
    base.extend(ClassMethods)
    base.class_eval do    
      attr_reader :amount, :units
      cattr_reader :conversion_table
      cattr_reader :formats
    end
  end
  
  module ClassMethods
    def units
      conversion_table.keys
    end
  end

  def initialize(amount, units = self.base_units)
    @amount, @units = amount.to_d, units.to_s
  end
    
  def > (other)
    amount > other.to_units(units).to_d
  end
  
  def < (other)
    amount < other.to_units(units).to_d
  end
  
  def >= (other)
    amount >= other.to_units(units).to_d
  end
  
  def <= (other)
    amount <= other.to_units(units).to_d
  end
  
  def <=> (other)
    amount <=> other.to_units(units).to_d
  end
  
  def == (other)
    amount == other.to_units(units).to_d
  end

  def === (other)
    amount == other.to_units(units).to_d
  end
  
  def + (other)
    raise ArgumentError, "Only similar scalar types can be added together" unless other.is_a?(self.class)
    self.class.new(amount + other.to_units(units).amount, units)
  end
  
  def - (other)
    raise ArgumentError, "Only similar scalar types can be subtracted" unless other.is_a?(self.class)
    self.class.new(amount - other.to_units(units).amount, units)
  end
  
  def * (other)
    
    if other.is_a?(Numeric)
      self.class.new(amount * other.to_d, units)
    elsif self.is_a?(Length) && other.is_a?(Length)
      case units
        when 'millimetres' then (amount * other.millimetres.to_d).to_area(:square_millimetres)
        when 'centimetres' then (amount * other.centimetres.to_d).to_area(:square_centimetres)
        when 'metres' then (amount * other.metres.to_d).to_area(:square_metres)
        when 'kilometres' then (amount * other.kilometres.to_d).to_area(:square_kilometres)
        when 'inches' then (amount * other.inches.to_d).to_area(:square_inches)
        when 'feet' then (amount * other.feet.to_d).to_area(:square_feet)
        when 'yards' then (amount * other.yards.to_d).to_area(:square_yards)
        when 'miles' then (amount * other.miles.to_d).to_area(:square_miles)
        else (self.metres.to_d * other.metres.to_d).to_area(:square_metres)
      end
    elsif self.is_a?(Length) && other.is_a?(Area)
      case units
        when 'millimetres' then (amount * other.square_millimetres.to_d).to_volume(:cubic_millimetres)
        when 'centimetres' then (amount * other.square_centimetres.to_d).to_volume(:cubic_centimetres)
        when 'metres' then (amount * other.square_metres.to_d).to_volume(:cubic_metres)
        when 'kilometres' then (amount * other.square_kilometres.to_d).to_volume(:cubic_kilometres)
        when 'inches' then (amount * other.square_inches.to_d).to_volume(:cubic_inches)
        when 'feet' then (amount * other.square_feet.to_d).to_volume(:cubic_feet)
        when 'yards' then (amount * other.square_yards.to_d).to_volume(:cubic_yards)
        when 'miles' then (amount * other.square_miles.to_d).to_volume(:cubic_miles)
        else (self.metres.to_d * other.square_metres.to_d).to_volume(:cubic_metres)
      end
    elsif self.is_a?(Area) && other.is_a?(Length)
      case units
        when 'square_millimetres' then (amount * other.millimetres.to_d).to_volume(:cubic_millimetres)
        when 'square_centimetres' then (amount * other.centimetres.to_d).to_volume(:cubic_centimetres)
        when 'square_metres' then (amount * other.metres.to_d).to_volume(:cubic_metres)
        when 'square_kilometres' then (amount * other.kilometres.to_d).to_volume(:cubic_kilometres)
        when 'square_inches' then (amount * other.inches.to_d).to_volume(:cubic_inches)
        when 'square_feet' then (amount * other.feet.to_d).to_volume(:cubic_feet)
        when 'square_yards' then (amount * other.yards.to_d).to_volume(:cubic_yards)
        when 'square_miles' then (amount * other.miles.to_d).to_volume(:cubic_miles)
        else (self.square_metres.to_d * other.metres.to_d).to_volume(:cubic_metres)
      end
    else
      raise ArgumentError, "Invalid multiplier type"
    end
    
  end
  
  def / (other)
  
    if other.is_a?(Numeric)
      self.class.new(amount / other.to_d, units)
    elsif other.is_a?(self.class)
      amount / other.to_units(units).to_d
    else
      raise ArgumentError, "Invalid divisor type"
    end
    
  end

  def zero?
    amount.zero?
  end
    
  def round(n = 0, mode = BigDecimal.mode(BigDecimal::ROUND_MODE))
    self.class.new(amount.round(n, mode), units)
  end
  
  def to_s(precision = nil)
    if precision
      sprintf("%0.#{precision}f", amount)
    else
      amount.frac.zero? ? amount.to_i.to_s : amount.to_s
    end
  end
    
  def to_formatted_s(precision = nil)
    sprintf(self.class.formats[units], to_s(precision))
  end
  
  def to_d
    amount
  end
  
  def to_i
    amount.round(0).to_i
  end
  
  def to_f
    amount.to_f
  end

  def to_r
    amount.to_r
  end
  
  def to_units(new_units)
   units == new_units.to_s ? self : self.class.new(amount * conversion_rate(new_units.to_s), new_units)
  end
  
  def inspect
    to_formatted_s
  end
  
  def method_missing(method, *args)
  
    if conversion_table.key?(method.to_s)
      to_units(method)
    else
      super
    end
  
  end
  
  protected
  
    def conversion_table
      self.class.conversion_table
    end
    
    def conversion_rate(new_units)
      conversion_table[units] / conversion_table[new_units]
    end
    
    def base_units
      self.class.conversion_table.index(1.0)
    end

end

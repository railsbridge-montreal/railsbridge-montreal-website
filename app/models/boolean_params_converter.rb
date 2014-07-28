# Converts a params hash containing string representations of booleans to
# 'real' booleans.
#
class BooleanParamsConverter
  def call(params)
    convert_booleans(params)
  end

  private

  def convert_booleans(params)
    params.each do |k, v|
      params[k] = true if v == 'true'
      params[k] = false if v == 'false'
    end
  end
end

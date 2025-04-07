require 'net/http'
require 'json'

require_relative 'native_binding'

URL = 'http://api.worldbank.org/v2/en/country/AR/indicator/SI.POV.GINI?format=json'.freeze

# @return [Hash]
def get_gini_rates_for_ar
  JSON.parse(Net::HTTP.get(URI(URL)))
end

# It's ensured that at least one year from the pile of data has a GINI index.
# @return [Array(String, Float)] year, and GINI index respectively
def get_latest_useful_value(json)
  # seek first entry with useful data
  json.last.each do |entry|
    if(gini_index = entry['value'])
      return [entry['date'], gini_index]
    end
  end
end

=begin
RUNTIME
=end

puts("Looking for latest GINI index entry for Argentina...")
year, gini_index = get_latest_useful_value(get_gini_rates_for_ar())
puts("Found! #{year}: #{gini_index}")
# handle data to next lower layer
puts("Passing #{gini_index} float value to lower level computing, expecting #{gini_index.to_i + 1}...")
modified_gini_index = NativeBinding.float_to_int(gini_index)
puts("Result: #{modified_gini_index}.")

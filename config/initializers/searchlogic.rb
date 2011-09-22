# hack searchlogic to work with date_select / datetime_select in search form
module Searchlogic
  class Search
    # Accepts a hash of conditions.
    def conditions=(values)
      values.each do |condition, value|
        if condition =~ /(.*)\(1i\)$/
          date_scope_name = $1
          date_parts = (1..6).to_a.map do |idx|
            values.delete("#{ date_scope_name }(#{ idx }i)")
          end.reject{|s| s.blank? }.map{|s| s.to_i }

          if date_parts.length == 3 || date_parts.length == 5
            values[date_scope_name] = Time.local(*date_parts)
          end
        end
      end

      values.each do |condition, value|
        value.delete_if { |v| ignore_value?(v) } if value.is_a?(Array)
        next if ignore_value?(value)
        send("#{condition}=", value)
      end
    end
  end
end
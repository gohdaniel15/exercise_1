a = File.new('file1.txt')

number_of_elements = a.gets.to_i
element_array = a.gets.split(' ').map(&:to_i)
@result = []

# Recursively creates and pushes sub arrays for an element.
# Each recurse calls the next with different arguments, modifying the sub array size and the occurance of sub arrays for that size.
# Example: [1 1 1]
# Given
#   element = 1
#   element_count = 3

# Expected result
#   [[1], [1], [1], [1, 1], [1, 1], [1, 1, 1]]
def process_for_one_element(el, no_of_subarrs, no_of_els = 1)
  no_of_subarrs.times { |n| @result << [el] * no_of_els }
  if no_of_els <= no_of_subarrs
    process_for_one_element(el, no_of_subarrs - 1, no_of_els + 1)
  end
end

# Calls `process_for_one_element` for each unique element from the input.
element_array.uniq.each do |element|
  no_of_uniq_elements = element_array.count(element)
  process_for_one_element(element, no_of_uniq_elements)
end

puts @result.size

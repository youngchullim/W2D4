def my_min(list) #O(n^2)
  list.each do |num|
    i = 0
    list.each do |ele|
      i += 1 if num <= ele
    end
    return num if i == list.length - 1
  end
end

def min(list) #O(n)
  smallest = list[0]
  list.each do |num|
    if num < smallest
      smallest = num
    end
  end
  smallest
end

def subset(array)
  max_value = array[0]
  max_array = nil

  array.each_with_index do |num, idx|
    temp = [num]
    
    if num > max_value
      max_value = num
      max_array = [num]
    end
    (idx + 1..array.length - 1).each do |index|
      temp << array[index]
      value = temp.reduce(&:+) 

      if value > max_value
        max_value = value
        max_array = temp.dup
      end 
    end
  end
 max_value
end

def better_subset(array)
  max_sum = array[0] 
  curr_sum = array[0] 
  curr_sum = 0 if curr_sum < 0
  array[1..-1].each do |num|
    curr_sum += num
    # p max_sum
    # p curr_sum
    if curr_sum > max_sum
      max_sum = curr_sum
    end
    if curr_sum < 0
      curr_sum = 0
    end
  end
  max_sum
end

p better_subset([-5, -1, -3])
p better_subset( [2, 3, -6, 7, -6, 7])
p better_subset([5, 3, -7])

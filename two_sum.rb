def bad_two_sum?(arr, target) #===>O(n^2)
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target
      j += 1
    end
    i += 1
  end
  false
end

def okay_two_sum?(arr, target)
  arr.sort!
  i = 0
  while i < arr.length
    return false if arr[i] > target
    sum = target - arr[i]
    idx = b_search(arr, sum)
    next if idx.nil?
    return true if arr[idx] == sum
    i += 1
  end
  return false
end

def b_search(arr, target)
  return nil if arr.length <= 0
  mid = arr.length / 2
  num = arr[mid] <=> target

  case num
  when -1
    res = b_search(arr.drop(mid + 1), target)
    res.nil? ? nil : res + mid + 1
  when 0
    mid
  when 1
    b_search(arr.take(mid), target)
  end
end


arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false
def first_anagram?(str1, str2)
  arr = str1.split("").permutation(str1.length).to_a
  arr.each do |mixed|
    return true if mixed.join("") == str2
  end
  return false
end

p first_anagram?("dsfdsfasd", "dsfdsfads")

def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars

  arr1.each do |el|
    idx = arr2.index(el)
    if idx != nil
      arr2[idx] = nil
    end
  end
  arr2.all? {|el| el == nil}
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  letters = Hash.new(0)

  (0...str1.length).each do |i|
    letters[str1[i]] += 1
    letters[str2[i]] -= 1
  end
  letters.values.all? {|val| val == 0}
end

p fourth_anagram?("gizmo", "sally")  
p fourth_anagram?("elvis", "lives")
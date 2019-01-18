# Phase 1
# Write a method #first_anagram? that will generate 
# and store all the possible anagrams of the first string. 
# Check if the second string is one of these.
# anagram?("elvis", "lives")    #=> true

def first_anagram?(str1,str2)
	ana = []
	str1.split("").permutation.to_a.each { |el| ana << el.join }
	return true if ana.include?(str2)
end
# time complexity = O(n!) + O(n) + O(n)


# Phase II
# For each letter in the first string, find the index
# of that letter in the second string and delete at that index.
# The two strings are anagrams if an index is found for every 
# letter and the second string is empty at the end of the iteration.
def second_anagram?(str1, str2)
	str_arr = str2.split("")
	str1.each_char do |char| 
		i1 = str_arr.find_index(char)
		return false unless i1
		str_arr.delete_at(i1) 
	end
	str_arr.empty?
end
# time complexity = O(n^2)

# Phase III
# sort
def third_anagram?(str1, str2)
	str1.split("").sort == str2.split("").sort
end
# time complexity = O(n)


# Phase IV
def fourth_anagram?(str1, str2)
	letters = str1 + str2
	letter_hash = Hash.new(0)
	letters.each_char { |char| letter_hash[char] += 1 }
	letter_hash.each_value { |v| return false if v % 2 == 1}
	true
end
# time complexity = O(n)
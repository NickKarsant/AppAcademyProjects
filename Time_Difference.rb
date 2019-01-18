# Given a list of integers find the smallest number in the list.

# Phase 1
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?
def find_min(arr)  
	smallest = nil
	(0...arr.length).each do |i|
		(0...arr.length).each do |j|
			smallest = arr[i] if arr[i] < arr[j] || smallest == nil
		end
	end
	smallest
end
#time complexity= O(n^2)


# Phase II
def better_find_min(arr)
	smallest = nil 
	arr.each { |i| smallest = arr[i] if arr[i] < arr[j] || smallest == nil }
	smallest
end
# time complexity = O(n)


# Phase I
# Write a function that iterates through the 
# array and finds all sub-arrays using nested loops. 
# First make an array to hold all sub-arrays. 
# Then find the sums of each sub-array and return the max.
# list = [5,3,-7, 4, 8, 9, -32]
def largest_continguous_sum(arr)
	to_sum = []
	(0...arr.length).each do |i|  #O(n^3)
		(0...arr.length).each do |j|
		to_sum << arr[i..j] unless arr[i..j].empty?
		end
	end

	largest = [0]
	to_sum.each_index do |i|   #O(n^2)
		if to_sum[i].reduce(:+) > largest.reduce(:+) || largest == 0
			largest = to_sum[i] 
		end
	end
	largest
end
# time complexity = O(n^3)




# Phase II
# Let's make a better version. Write a new function 
# using O(n) time with O(1) memory. 
# Keep a running tally of the largest sum.

# input = [5, -6, 6, 3, -8, 10]
# output = 11
def better_largest_continguous_sum(arr)
	i1 = 0 
	i2 = 0 
	largest = 0 
	sum = 0

	while i2 < arr.length
		sum += arr[i2] 

		if sum < 0 
			i1 = i2 + 1
			i2 = i1
			largest = arr[i2]
			sum = arr[i2]
		elsif sum >= largest 
			largest = sum
			i2 += 1
		elsif 
			i2 += 1
		end
	end
	largest
end
# time complexity = O(n)
# Thanks Jessie
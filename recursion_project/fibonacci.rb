# Using iteration, write a method #fibs which takes a number and returns an array containing that many numbers from the fibonacci sequence. Using an example input of 8, this method should return the array [0, 1, 1, 2, 3, 5, 8, 13].
def fibs(num)
  i, j = 0, 1
	array = [0]
    while i <= num
      i, j = j, i + j
			array.push(i)
  	end
	return array
end

fib_array = fibs(8)
puts fib_array

# Now write another method #fibs_rec which solves the same problem recursively. This can be done in just 3 lines (or 1 if you’re crazy, but don’t consider either of these lengths a requirement… just get it done).
def fib_rec(count)
	# Error check
	if count < 0 then
		raise ArgumentError, "The number must be a positive integer."
	end

	# Terminating the base cases
	return [] if count == 0
	return [0] if count == 1
	return [0,1] if count == 2

	# Recursion
	seq = fib_rec(count - 1)

	# The recursive function
	seq << seq[-2] + seq[-1]

	return seq
end
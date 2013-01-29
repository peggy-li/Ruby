def sort(arr)
  mergesort(arr)
end

def mergesort(arr)
	n = arr.length
	return arr if n <= 1

	l = arr[0...n/2]
	r = arr[n/2..n]
	
	l = mergesort(l)
	r = mergesort(r)

	return merge(l, r)
end

def merge(l, r)
	a = Array.new()

	# shift removes and returns the first element
	while l.length > 0 or r.length > 0
		if l.length == 0
			a.push(r.shift)
		elsif r.length == 0
			a.push(l.shift)
		elsif l[0] <= r[0]
			a.push(l.shift)
		elsif l[0] > r[0] 
			a.push(r.shift)
		end
	end
	return a
end


puts sort(["str", "cat", "hello", "44"]).inspect # => [1, 2, 3, 4]
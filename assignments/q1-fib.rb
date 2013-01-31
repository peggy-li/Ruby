def fib(n, n1 = 1, n2 = 1)
  # return n1 if n == 1;
  # return n2 if n == 2;

  # # puts "n = #{n}, calling f(#{n-1}) and f(#{n-2})"
  # return fib(n-1, n1, n2) + fib(n-2, n1, n2)

  a = Array.new()
  a[0] = n1
  a[1] = n2
  for i in 2..n
  	a[i] = a[i-1] + a[i-2]
  end
  return a[n-1]
end
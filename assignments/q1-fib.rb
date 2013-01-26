def fib(n, n1 = 1, n2 = 1)
  return n1 if n == 1;
  return n2 if n == 2;

  # puts "n = #{n}, calling f(#{n-1}) and f(#{n-2})"
  return fib(n-1, n1, n2) + fib(n-2, n1, n2)
end
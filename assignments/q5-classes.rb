# use enumerable methods like map, select

def queryClasses(data, criteria)
  ans = filter(data, criteria)
  ans = select(ans, criteria)
  ans = sort(ans, criteria)
  return ans
end

def filter(data, criteria)
  d = data
  criteria[:filter].each do |field, rest| 
    # filter -> item -> operator -> value
    rest.each do |op, value| 
      d = d.select {|obj| compare(obj[field], op.to_s, value) if obj[item] != nil}
    end
  end
  return d
end

def compare(objval, op, value)
  if op == "gt"
    return objval > value
  elsif op == "gte"
    return objval >= value
  elsif op == "lt"
    return objval < value
  elsif op == "lte"
    return objval <= value
  elsif op == "eq"
    return objval == value
  elsif op == "neq"
    return objval != value
  elsif op == "exists"
    return objval.nil = value
  end
end


def select(data, criteria)
  d = Array.new()

  data.each do |obj|
    # obj.each do |key, value|
    #   puts "#{key} => #{value}"
    #   puts "#{criteria[:select].member?(key)}"
    # end

    s = obj.select{|key, value| criteria[:select].member?(key)}
    d.push(s)
  end
  return d
end

def sort(data, criteria)
  comp = criteria[:sort_by].to_s
  
  data.sort do |obj1, obj2|
    # puts "obj1\t#{obj1}\t#{obj1.length}\t#{obj1.class}"
    # puts "obj2\t#{obj2}\t#{obj2.length}\t#{obj2.class}"

    diff = 0
    obj1.each do |k, v|
      # puts "#{k} => #{v}" if k.to_s == comp
      diff += v if k.to_s == comp
    end

    obj2.each do |k, v|
      # puts "#{k} => #{v}" if k.to_s == comp
      diff -= v if k.to_s == comp
    end
    diff

  end 
end


# data = [{
#   :department => 'CS',
#   :number => 101,
#   :name => 'Intro to Computer Science',
#   :credits => 1.00
# }, {
#   :department => 'CS',
#   :number => 82,
#   :name => 'The Internet Seminar',
#   :credits => 0.5
# }, {
#   :department => 'ECE',
#   :number => 52,
#   :name => 'Intro to Digital Logic'
#   # Note that the :credits key-value pair is missing
# }]
# criteria = {
#   :filter => {
#     :number => {
#       :gt => 80
#     },
#     :credits => {
#       :gte => 0.5
#     }
#   },
#   :select => [:number, :name],
#   :sort_by => :number
# }

data = {}
criteria = {}

q = queryClasses(data, criteria)
q.each {|x| puts x}

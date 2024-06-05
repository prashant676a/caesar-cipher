def fibs(number)
  if number==1
    return [0]
  else
    nums = [0,1]
    (2...number).each do
      |i| nums.append(nums[i-1]+nums[i-2])
    end
    nums
  end
end

# p fibs(1)


def fibs_rec(number)
  if number == 0
    0
  elsif number==1
    1
  else
    fibs_rec(number-1)+fibs_rec(number-2)
  end
end

nums = []
(0...8).each {|i| nums.append(fibs_rec(i))}
p nums

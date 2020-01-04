class A

   #public -> this can also be used
  def m1
     puts "m1"
  end
 def m2
    puts "m2"
  end

  public :m1, :m2
end

a1=A.new
a1.m1
a1.m2


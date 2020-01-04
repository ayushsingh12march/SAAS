class Book
    #attr_reader :title,:author
    #attr_writer :title,:author
    attr_accessor :title, :author
    def to_s
       print "to_s overrided"
    end
    def initialize (aTitle=nil,aAuthor=nil)
       @title=aTitle
       @author=aAuthor
    end
    def display
       puts @title,@author
    end
end

b1=Book.new("ruby","ayush")
puts b1.methods

puts b1

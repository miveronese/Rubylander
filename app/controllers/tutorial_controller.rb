class TutorialController < ApplicationController




#   def run
#     @input = params["text"].to_s
#     @result = emptyvalue(@input)
#
#   end
#
#   def evilcode(input)
#   ["bli", "ble"].each do |x|
#       if @input.include?(x)
#         raise "hacker"
#       else
#       eval (input)
#       end
#     end
#   end
#
#
#
#   def emptyvalue(input)
#     if @input.empty?
#       raise "Empty value, try again"
#     else
#       evilcode (input)
#     end
#   end
#
#
#
#
# end



  def check(input)
    @evilcode = ["mkdir", "rmdir", "mydir", "rm", "ls", "-a", "ls -a", "cd", "pwd", "chroot", "cp", "-i", "cp -i",
                 "`mdkdir`", "`rmdir`", "`mydir`", "`rm`", "`ls`", "`-a`", "`ls -a`", "`cd`", "`pwd`", "`chroot`", "`cp`", "`-i`", "`cp -i`"]

    if @input.empty?
      raise "Empty value, try again"
    else
      @evilcode.each do |x|
        if @input.include?(x)
          raise " hacker"
        end
      end
      eval(input)
    end
  end


  def run
    begin
      @input  = params["text"].to_s
      @result = check(@input)
    rescue SyntaxError => syntax_error
      @result = " The syntax is not correct : " + syntax_error.message
    rescue ArgumentError => argument_error
      @result = " The argument is not correct : " + argument_error.message
    rescue StandardError => standard_error
      @result = " Error running script: " + standard_error.message
    end
  end

end
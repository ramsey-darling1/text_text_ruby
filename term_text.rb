#A command line application to send text messages 
#@rdar

require 'net/http'

def main
    # I still like having a "Main" function
    phone_number = grab_user_input("Please enter number you wish to text: ")
    while !validate_phone_number(phone_number)
        phone_number = grab_user_input("Please enter a valid 10 didget phone number, no special characters or spaces: ")
    end
    text_message = grab_user_input("Please enter the message you wish to send: ")
    while !validate_text_message(text_message)
        text_message = grab_user_input("Please enter a text message that is at least 2 characters but not over 140 characters: ")
    end
    make_request(phone_number,text_message)
    response_message("Thanks, we texted #{text_message} to #{phone_number}\n")
end

def validate_phone_number(phone_number)
    if phone_number.length != 10
        false
    elsif phone_number.to_i > 9999999999 || phone_number.to_i < 1111111111
        false
    else
        true
    end
end

def validate_text_message(text_message)
   if text_message.length > 140 || text_message.length < 2
      false
   else 
      true
   end 
end

def grab_user_input(message)
    print message
    user_input = gets
    return user_input.chomp
end

def response_message(message)
    puts message
end

def make_request(phone_number,text_message)
    uri = URI('http://textbelt.com/text')
    res = Net::HTTP.post_form(uri, 'number' => phone_number, 'message' => text_message)
    puts res.body
end


#init the script
main()

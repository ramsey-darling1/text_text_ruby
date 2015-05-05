#A command line application to send text messages 
#@rdar


def main
    # I still like having a "Main" function
    phone_number = grab_user_input("Please enter number you wish to text: ")
    text_message = grab_user_input("Please enter the message you wish to send: ")
    response_message("Here is the phone number and text message #{phone_number}, #{text_message}")
end

def grab_user_input(message)
    print message
    user_input = gets
    return user_input
end

def response_message(message)
    puts message
end


#init the script
main()

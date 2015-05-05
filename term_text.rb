#A command line application to send text messages 
#@rdar

require 'net/http'

def main
    # I still like having a "Main" function
    phone_number = grab_user_input("Please enter number you wish to text: ")
    text_message = grab_user_input("Please enter the message you wish to send: ")
    make_request(phone_number,text_message)
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

def make_request(phone_number,text_message)
    uri = URI('http://textbelt.com/text')
    params = { :number => phone_number, :message => text_message }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
end


#init the script
main()

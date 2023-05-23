require 'bunny'
connection = Bunny.new(hostname: 'rabbit', 
    :user => ENV['RABBITMQ_USER'], 
    :password => ENV['RABBITMQ_PASS'], 
    :auth_mechanism => "PLAIN")
connection.start
channel = connection.create_channel # create a new channel
queue = channel.queue('hello') # create a queue (or connect to an existing queue if it already exists)
queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts "- Received #{body}"
end
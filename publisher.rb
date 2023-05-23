require 'bunny'
connection = Bunny.new(hostname: 'rabbit', 
    :user => ENV['RABBITMQ_USER'], 
    :password => ENV['RABBITMQ_PASS'],
    :auth_mechanism => "PLAIN")
connection.start
channel = connection.create_channel # create a new channel
queue = channel.queue('hello') # create a queue
channel.default_exchange.publish('Hello World', routing_key: queue.name) # encode a string to a byte array and publish the message to the 'hello' queue

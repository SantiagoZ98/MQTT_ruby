require 'mqtt'

# Dirección del broker MQTT
broker = 'mqtt.eclipse.org'
port = 1883

# Crear una conexión al broker MQTT
begin
  MQTT::Client.connect(broker, port) do |client|
    puts "Conectado al broker #{broker} en el puerto #{port}"
    
    # Suscribirse a un tema
    client.subscribe('test/topic')

    # Publicar un mensaje
    client.publish('test/topic', '¡Hola desde Ruby!')

    # Escuchar mensajes
    client.get do |topic, message|
      puts "Mensaje recibido en el tema '#{topic}': #{message}"
    end
  end
rescue MQTT::Exception => e
  puts "Error de conexión: #{e.message}"
end

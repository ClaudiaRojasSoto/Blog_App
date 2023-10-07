require 'base64'
require 'yaml'
require 'openssl'

# La cadena de credenciales encriptadas en Base64
encoded_credentials = "kE8oVS7y5q7qR8k7Nv+50D74SCLNSRYwzySr2d5vVltLVqnuMEcjUNouZYPG/wrzt6BaV4J+AM7zrJbGUxJclUI3vQnIXe7pYt05y3f4wuMIPmA9ziBjQULIGhYaPNjD/FyfVpylvvb0eK+TISqqXceyxgKTyKGij6qr/LacpHs37eBZ2II9rIJoxmqtJ099LjmU0hLgNQgMpv3e4DGCs4YFeC4C6GVk3Dg97nhUeIes8YfBCYS8cXB/ssf90ahGWXM5xshTxb6S53Vj82y+xE127F2TEmA9HyEIWc7JxjBkiikLvwHzZ8q/ZrIK6CwuMYOv2ZOy2OmY/1VjbzP1i5yFMSIUl8sGibZ3cWEfWJRGQ87GeZB+u982W1dLUt6YnC5zZg9i8p7pqxTtlZ8m/DTSuqb+cx2dCDmt--FI06m3mVLryvsI0v--Mji1a/yl+FPin3GTJC9seA=="

# Decodificar la cadena Base64
decoded_credentials = Base64.decode64(encoded_credentials)

# Ruta al archivo master.key
master_key_path = "config/master.key"

# Verificar si el archivo master.key existe
if File.exist?(master_key_path)
  # Leer la clave secreta del archivo master.key
  master_key = File.read(master_key_path).strip

  # Configurar el cifrado con la clave maestra
  cipher = OpenSSL::Cipher.new('aes-256-gcm')
  cipher.decrypt
  cipher.key = master_key
  cipher.iv = decoded_credentials[0..11]  # El IV se encuentra en los primeros 12 bytes de las credenciales

  # Descifrar las credenciales
  decrypted_credentials = cipher.update(decoded_credentials[12..-1]) + cipher.final

  # Convertir las credenciales en YAML a un hash
  credentials_hash = YAML.load(decrypted_credentials)

  # Ahora credentials_hash contiene tus credenciales como un hash Ruby

  # Puedes acceder a las credenciales individualmente, por ejemplo:
  username = credentials_hash['username']
  password = credentials_hash['password']

  # Realiza las acciones necesarias con las credenciales
  puts "Username: #{username}"
  puts "Password: #{password}"
else
  puts "El archivo master.key no se encontró en #{master_key_path}. Asegúrate de que el archivo esté en la ubicación correcta."
end

# Usar una imagen base de Ruby
FROM ruby:3.3-slim

# Instalar dependencias del sistema (si las necesitas, como librerías para MQTT)
RUN apt-get update && apt-get install -y \
  build-essential \
  libssl-dev \
  libreadline-dev \
  libz-dev \
  && rm -rf /var/lib/apt/lists/*

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiar el archivo Gemfile y Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instalar las gemas necesarias
RUN bundle install

# Copiar el resto de los archivos del proyecto al contenedor
COPY . .

# Exponer el puerto en el que la app escuchará (si es necesario para tu aplicación)
EXPOSE 1883

# Comando para ejecutar la aplicación Ruby cuando se inicie el contenedor
CMD ["ruby", "app.rb"]

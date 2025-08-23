
# Usa una imagen base oficial de Node.js. Esto incluye el runtime de Node y npm.
# Usamos la versión 18-alpine, que es una versión ligera para contenedores.
FROM node:18-alpine

# Establece el directorio de trabajo dentro del contenedor.
# A partir de ahora, todos los comandos se ejecutarán en este directorio.
WORKDIR /app

# Copia los archivos de configuración de dependencias (package.json y package-lock.json).
# Esto nos permite aprovechar el caché de Docker, ya que las dependencias cambian con menos frecuencia que el código de la aplicación.
COPY package*.json ./

# Instala las dependencias del proyecto.
# Este comando es el equivalente a "npm install" en tu máquina local.
RUN npm install

# Copia el resto de los archivos de la aplicación (en este caso, app.js).
# El '.' al final indica el directorio actual.
COPY . .

# Expone el puerto que la aplicación web usa dentro del contenedor.
# Esto no publica el puerto al exterior, solo es una declaración de que el puerto 3000 está en uso.
EXPOSE 3000

# Define el comando para ejecutar la aplicación cuando se inicia el contenedor.
# "CMD" define el comando por defecto para el contenedor.
CMD ["node", "app.js"]

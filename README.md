# Laboratorio Telecomunicaciones - Microservicios, Asterisk, midPoint

## Requisitos
- Docker (20.10+)
- Docker Compose (2.0+)
- Puerto 8080, 5060 UDP, 10000-10100 UDP disponibles

## Instalación y uso
1. Clona este repositorio o copia la carpeta en la máquina.
2. Abre una terminal en la carpeta raíz.
3. Ejecuta:
   ```bash
   docker-compose up --build -d
4. Espera unos minutos (la primera vez descarga imágenes y compila Asterisk).
5. Accede a:
   · midPoint: http://localhost:8080 (admin/admin)
   · SonarQube: http://localhost:9000 (admin/admin)
6. Los softphones se conectan a la IP de la máquina donde corre Docker, puerto 5060 UDP.
   · En Windows/Mac: usa localhost o la IP de la máquina.
   · En Linux: localhost o 127.0.0.1.
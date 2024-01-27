# Template of a TPM tool over SSH

Template/example for new [TPM](https://github.com/fjfjgg/TPM) tools.

# Descripción

Herramienta que solo muestra información del fichero enviado y de los parámetros pasados.

El script `assess-tpm.sh` cumple la "API" que espera TPM:

- Si recibe como único argumento `test` debe devolver 0 si está disponible.
- En otro caso debería recibir al menos 5 argumentos:
  1. Ruta al fichero enviado.
  2. Usuario
  3. Nombre del fichero original
  4. Contador
  5. Si el usuario es instructor (`true` o `false`)

El script `updater-tpm.sh` permite la actualización remota.

Puede servir como base para invocar otros programas de corrección. 

## Estado del proyecto

Funciona correctamente.

## Tecnologías usadas

* Shell script

## Instalación

1. Copiar, en una maquina que tenga `ssh` activo, en el directorio de inicio de sesión de un usuario que tenga una clave SSH activa.

2. Dar permisos de ejecución a los ficheros situados en el directorio `bin`.
3. Crear una nueva herramienta en TPM seleccionando el tipo "Por SSH". Puede usar el fichero `tpm_cfg/config.json" como plantilla para la configuración. Modifique los datos de la clave privada para acceder. Verifique las rutas de los ejecutables y el usuario que tendrá permiso para actualizar.

## Licencia

Distributed under the GNU GENERAL PUBLIC LICENSE Version 3. See `LICENSE.txt` for more information.

## Contacto

Francisco José Fernández Jiménez - [@fjfjes](ht) - fjfj @ us.es

Project Link: <https://github.com/fjfjgg/tpm>

## Referencias

- [TPM](https://github.com/fjfjgg/TPM)
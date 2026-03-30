**Guía Maestra: Clonación, SSH y Automatización de Repositorios**

Este resumen cubre desde la seguridad inicial hasta la consolidación de múltiples repositorios en uno solo mediante scripts en entornos Linux/Chromebook.

# 1. Configuración de Identidad (SSH)
Indispensable para trabajar con GitHub sin pedir contraseñas constantemente.

# 1.1 Generar llave: ssh-keygen -t ed25519 -C "GeekTechHub"

# 1.2 Ver llave para copiar a GitHub: cat ~/.ssh/id_ed25519.pub

# 1.3 entrar a github setting / llaves ssh y agregar

# 1.4 Probar conexión: ssh -T git@github.com

# 2. Migración de Repositorios Externos
Para traer un código de otro usuario a tu propia cuenta de GitHub.

# 2.1 Clonar original: git clone https://github.com/usuario/repo-externo.git

# 2.2 Entrar a la carpeta: cd repo-externo

# 2.3 Cambiar destino a tu cuenta (SSH):
git remote set-url origin git@github.com:GeekTechHub/TU-NUEVO-REPO.git

# 2.4 Subir todo: git push -u origin main

# 3. Creación y Ejecución de Scripts (.sh)
Pasos realizados para automatizar tareas repetitivas en la terminal.

# 3.1 Crear el archivo: touch nombre_del_script.sh

# 3.2 Editar contenido: Abrir con editor visual o nano y llenarlo con el codigo del script

# 3.3 Asignar permisos de ejecución: chmod +x nombre_del_script.sh

# 3.4 Ejecutar el script: ./nombre_del_script.sh o bash nombre_del_script.sh

# 4. Consolidación con Subtree (Varios repos en uno)
Técnica para meter un repositorio dentro de otro como si fuera una carpeta, manteniendo el historial de commits.

# 4.1 Añadir fuente remota: git remote add alias_nombre git@github.com:GeekTechHub/repo-a-traer.git

# 4.2 Fusionar como carpeta:
git subtree add --prefix=nombre-carpeta alias_nombre main --squash

# 4.3 Subir al repo principal: git push origin main

📝 Notas de Mantenimiento y (Tips)
Si el comando no se encuentra: Asegúrate de instalar las herramientas con sudo apt install git nano -y.

Actualizar una subcarpeta: Si el repo original cambia, usa:
git subtree pull --prefix=carpeta alias_nombre main --squash

Limpiar remotos: Al terminar el script, usa git remote remove alias_nombre para mantener limpia tu lista de conexiones.

---

### Glosario Rápido de Comandos Utilizados
| Comando            | Función |
| :---               | :--- |
| `git remote -v`    | Verifica a qué repositorios (URLs) está conectado tu PC. |
| `git push`         | Sube tus cambios locales a la nube de GitHub. |
| `--prefix=nombre`  | Indica el nombre de la carpeta donde se guardará el repo insertado. |
| `--squash`         | Une todos los commits antiguos en uno solo para mantener limpio el historial. |

---

# SETUP & DEPLOY AMBIENTE DE TRABAJO EN GITHUB
---
👋 Bienvenido/a a mi guía rápida sobre como desplegar un ambiente de trabajo completo en Github.

🔥 **Con Terraform podrás crear rápido y fácil, un entorno completo de trabajo personal o una organización en Github.** 🔥

![image](https://github.com/Andresmup/Github_Deploy_with_Terraform/assets/77512331/224cb9c0-fc89-4e6d-b288-d80d3b139d3c)

## ✔️​ BENEFICIOS

Utilizando una plantilla de terraform para hacer un deploy en github podemos hacer un setup rápido de una organización. 
Creando un entorno de desarrollo conformado por diferentes equipos con diferentes de permisos de acuerdo al rol que tengan.
Teniendo diferentes ramas para que el desarrollo se haga utilizando buenas prácticas y un worflow de Github organizado.
Permitiendo tener diferentes restricciones y una mayor seguridad.
---
En este caso utilizando la plantilla para organizaciones al desplegarla junto con ella se creará:
 - Un repositorio base para el proyecto principal.
 - Una estructura de equipos con admmin team, testing team, developer team 1 y developer team 2.
 - Cada equipo tendrá restricciones para poder gestionar, only push o pull los archivos del repositorio.
 - Ramas main, release, develop, testing, develop team 1 y develop team 2; para tener los diferentes grupos desarrollando en ambiente especificos.
 - Se configuran los pull request entre otras opciones restringiendo quien los puede revisar.
 - Se agrega seguridad al inhabilitar el auto-merge.
 - Se configuran las alertas de vulnerabilidad.
 - Se abre el canal de issues.
 - Y más...

![Branchs](https://github.com/Andresmup/Github_Deploy_with_Terraform/assets/77512331/88ef6e74-bc61-4063-9171-0bc518684d84)

---
De igual forma para un repositorio personal realizar un deploy utilizando una plantilla de terraform nos permite tener una 
consistencia a la hora de desarrollar un nuevo proyecto en Github. Teniendo diferentes ramas para etapas específicas del desarrollo, 
utilizar buenas prácticas de seguridad y protección en nuestro repositorio. Sin tener que preocuparnos por haber olvidado 
configurar algo o tener que revisar varias veces.
---
En este caso utilizando la plantilla para repositorio personal se creará:
 - Un repositorio para el proyecto.
 - Ramas main, release, develop y feature.
 - Se configuran los pull request..
 - Se agrega seguridad al inhabilitar el auto-merge.
 - Se configuran las alertas de vulnerabilidad.
 - Se abre el canal de issues.
 - Habilita la wiki del repositorio.
 - Y más...

![Branch](https://github.com/Andresmup/Github_Deploy_with_Terraform/assets/77512331/451876b1-b120-44ac-aa83-dbf3278f300b)



## ➡️ REQUISITOS

Necesitas tener instalado Terraform en tu PC. Puedes hacerlo desde [aquí](https://developer.hashicorp.com/terraform/install).

Si vas a trabajar en un proyecto personal solo necesitas tener una cuenta de Github.

Si quieres desplegar en una organización deberás crearla, y seleccionar que plan quieres. Puede ser el plan free.
>   [https://github.com/settings/organizations](https://github.com/settings/organizations) -> New organization -> Create free organization -> Completa los datos

## ➡️ DESCARGA O CLONA EL TEMPLATE

Puedes descargar los archivos .zip en tu pc sino tienes git instalado.
> <> Code -> Local -> Donwload ZIP

O clonar directamente creando una nueva carpeta y ejecutando en la terminal.
>  git clone https://github.com/Andresmup/Github_Deploy_with_Terraform.git

## ➡️ CREAR UN TOKEN

Para poder realizar un despliegue usando tu terminal necesitaras ingresar un token, crearlo es super sencillo.

> Ve a tu perfil -> Settings -> Developer Settings -> Tokens (classic) -> Generate new token

O directamente desde [https://github.com/settings/tokens/new](https://github.com/settings/tokens/new).

Puedes asignarle una nota, selecciona una fecha de expiración (1 día es suficiente), y haz click en los check box de abajo. 
Una vez tengas tu token cópialo y guárdalo en el siguiente paso lo necesitaras. Después de realizar el deploy puedes borrarlo desde la misma pestaña.

## ➡️ DEPLOY

Ahora solo queda crear el ambiente de trabajo deseado. Si deseas hacer un deploy de un proyecto personal (repositorio) o una organización.
Solo debes abrir una terminal en la carpeta con el template que corresponda.
Una vez tengas la terminal abierta en el directorio necesitas ejecutar 2 comandos.

### 🔹​​ PROYECTO PERSONAL
Reemplaza en el comando con tu token que creaste, el nombre que desees darle a tu repositorio y tu usuario de github.
```sh
terraform init -upgrade
terraform apply -var="github_token=PEGA_AQUI_TU_TOKEN" -var="nombre_repositorio=NOMBRE_REPOSITORIO" -var="nombre_usuario=GITHUB_USER" -auto-approve
```
### 🔹​ ORGANIZACIÓN
Reemplaza en el comando con tu token que creaste, el nombre de la organización que creaste.
```sh
terraform init -upgrade
terraform apply -var="github_token=PEGA_AQUI_TU_TOKEN" -var="nombre_organizacion=GITHUB_ORGANIZATION" -auto-approve
```

---
En caso de que algo salga mal, quieras borrar lo que hiciste o desees cambiar los párametros solamente debes ejecutar.
```terraform destroy```

---
**ESO SERIA TODO, YA TIENES DESPLEGADO TU AMBIENTE DE TRABAJO EN GITHUB.**

## ✔️​ CONCLUSIÓN

📜 Con Terraform se puede crear un ambiente de desarrollo completo en github en menos de 1 minuto utilizando un template, ya sea para uso personal o de una organización.

💬 Gracias por la visita. Si tienes alguna duda o sugerencia, no dudes en contactar. 💬

👨‍💻 Andrés Muñoz Pampillón

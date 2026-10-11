# riasnorge.com — la web

Web estática, lista para publicar gratis en GitHub Pages. Una sola página, sin formularios, sin cookies y sin JavaScript.

---

## El número de WhatsApp ya está puesto

Es el **+34 694 31 32 92**, en los seis enlaces de la web. Si algún día cambia, desde la Terminal y dentro de esta carpeta:

```sh
sh cambiar-numero.sh 34694313292 "+34 694 31 32 92"
```

(primero los dígitos con prefijo y sin `+`, después cómo quieres que se lea).

---

## Actualizar la web que ya está publicada (lo normal a partir de ahora)

La web ya vive en GitHub Pages. Para cambiarla no hay que volver a crear nada: se suben los archivos nuevos encima de los viejos.

1. Entra en [github.com](https://github.com) y abre el repositorio de la web.
2. Pulsa **Add file → Upload files**.
3. Abre esta carpeta (`04-Web/riasnorge.com`) en el Finder, selecciona **todo lo que hay dentro** (⌘A) y arrástralo a la ventana de GitHub. GitHub sustituye los archivos que se llaman igual.
4. Abajo, escribe un mensaje corto (por ejemplo: *"Precios 2027 y textos de octubre"*) y pulsa **Commit changes**.
5. Espera uno o dos minutos y abre riasnorge.com. Si ves la versión vieja, recarga sin caché: **⌘ + Shift + R**.

Para comprobar que se ha actualizado: en la sección Precios tiene que poner **3.850 NOK** (no 3.500) y debe aparecer el botón **"Descargar la hoja de precios (PDF)"**.

> Si no te acuerdas del nombre del repositorio: en GitHub, arriba a la derecha, tu foto → **Your repositories**. Es el que en **Settings → Pages** muestra `riasnorge.com`.

---

## Publicarla desde cero en GitHub Pages (solo la primera vez)

### 1. Crea el repositorio

Entra en [github.com/new](https://github.com/new).

- **Nombre:** `riasnorge` (o el que quieras)
- **Visibilidad: Public.** Tiene que ser público: en el plan gratuito de GitHub, Pages **solo funciona con repositorios públicos**. Para publicar desde uno privado hace falta GitHub Pro de pago.
- No marques nada más. Pulsa **Create repository**.

> Que el repositorio sea público no es un problema de seguridad aquí: dentro solo hay el texto y las imágenes de una web que, de todos modos, va a ser pública. No hay contraseñas ni datos de nadie. Simplemente no metas nunca en esta carpeta documentos internos del proyecto.

### 2. Sube los archivos

En el repositorio recién creado: **Add file → Upload files**.

Arrastra **el contenido de esta carpeta**, no la carpeta en sí. Es decir: `index.html`, `estilos.css`, `404.html`, el PDF de precios y las carpetas `img/` y `fuentes/`.

> Si arrastras la carpeta entera, la web acabará en una subruta y no funcionará bien. Abre la carpeta y selecciona todo lo que hay dentro (⌘A).

No hace falta subir `LEEME.md`, `cambiar-numero.sh` ni `.nojekyll`; no molestan si van, pero tampoco hacen falta.

Escribe abajo un mensaje corto (ej. "Primera versión de la web") y pulsa **Commit changes**.

### 3. Enciende Pages

**Settings → Pages** (menú de la izquierda).

- **Source:** Deploy from a branch
- **Branch:** `main` — carpeta `/ (root)`
- **Save**

Espera uno o dos minutos y recarga. Arriba aparecerá la dirección:

```
https://TUUSUARIO.github.io/riasnorge/
```

Esa ya la puedes mandar por WhatsApp.

### 4. Marca "Enforce HTTPS"

En esa misma pantalla, cuando se active la casilla **Enforce HTTPS**, márcala. Así nadie puede entrar por una conexión sin cifrar.

---

## Poner riasnorge.com

Cuando la web ya funcione en la dirección de GitHub:

### 1. En GitHub

**Settings → Pages → Custom domain** → escribe `riasnorge.com` → **Save**.

### 2. En el panel de tu dominio (donde compraste riasnorge.com)

Crea estos registros DNS:

| Tipo | Nombre / Host | Valor |
|---|---|---|
| A | `@` | `185.199.108.153` |
| A | `@` | `185.199.109.153` |
| A | `@` | `185.199.110.153` |
| A | `@` | `185.199.111.153` |
| CNAME | `www` | `TUUSUARIO.github.io` |

Si tu proveedor admite IPv6, añade también cuatro registros AAAA en `@`: `2606:50c0:8000::153`, `2606:50c0:8001::153`, `2606:50c0:8002::153` y `2606:50c0:8003::153`.

### 3. Espera y vuelve a marcar HTTPS

El DNS puede tardar desde diez minutos hasta unas horas. Cuando GitHub diga que el dominio está verificado, vuelve a marcar **Enforce HTTPS**.

> **Detalle menor:** la imagen que se ve al compartir el enlace por WhatsApp apunta a `https://riasnorge.com/img/og.png`. Mientras la web solo esté en la dirección de GitHub, al compartirla saldrá el título y el texto, pero puede que no la imagen. En cuanto el dominio esté activo, funciona sola. (Está en la línea `og:image`, al principio de `index.html`.)

---

## Seguridad y privacidad

Esto es lo que se hizo para que no haya de qué preocuparse:

- **Sin JavaScript.** Ni una línea, ni propia ni de terceros. El menú del móvil y los desplegables funcionan solo con CSS y HTML. Sin JavaScript no hay forma de que la página ejecute nada que no sea texto.
- **Sin formularios.** No se pide ni se guarda ningún dato de nadie, así que no hay base de datos que proteger ni obligaciones de protección de datos por los visitantes.
- **Sin cookies y sin analítica.** No hace falta el cartel de cookies porque no hay cookies.
- **Sin llamadas a otros servidores.** Las tipografías están dentro del repositorio (carpeta `fuentes/`), no se piden a Google. Comprobado: al cargar la web, cero peticiones fuera del propio dominio.
- **Política de seguridad de contenido (CSP).** Cada página declara que solo puede cargar recursos de sí misma y que no puede ejecutar scripts. Aunque alguien lograra colar código, el navegador lo bloquearía.
- **Enlaces externos** con `rel="noopener noreferrer"`: la página de destino no recibe información de la nuestra.
- **HTTPS** lo pone GitHub, gratis, con la casilla del paso 4.

Lo único que un visitante puede hacer es leer y pulsar el botón de WhatsApp.

---

## Qué hay en la carpeta

| Archivo | Para qué |
|---|---|
| `index.html` | La web entera: torneo, cómo ayudamos, el piloto, precios, sobre nosotros, preguntas y contacto |
| `RiasNorge-NorwayCup2027-precios.pdf` | La hoja de precios oficiales que se descarga desde la web |
| `404.html` | La que se ve si alguien escribe mal una dirección |
| `estilos.css` | Todo el diseño |
| `img/` | Logotipos, textura de la marca y la imagen de vista previa |
| `fuentes/` | Las tipografías Archivo e IBM Plex Sans, con su licencia |
| `robots.txt`, `sitemap.xml` | Para que Google la encuentre |
| `cambiar-numero.sh` | El script del número de WhatsApp |

Para verla en tu ordenador antes de subirla: doble clic en `index.html`.

---

## Qué dice la web (actualizado el 11 de octubre de 2026)

- **Relación con la Norway Cup:** "en colaboración con la Norway Cup". Nada de "exclusiva", "únicos", "representante oficial" ni "agente oficial" (decisión del 11 de octubre). El contrato está firmado, pero es no exclusivo.
- **Qué hacemos:** acompañar en la inscripción, en español, y una persona de RíasNorge en Oslo toda la semana.
- **Qué no dice, a propósito:** ni la comisión de la Norway Cup ni que no cobramos (puede que cobremos servicios más adelante). Tampoco "no vendemos…". Solo que no somos agencia de viajes y que el viaje lo organiza cada club.
- **Sin nombres de personas** (11 oct 2026): "desde Galicia", "una persona de RíasNorge en Oslo".
- **Precios:** tarifas oficiales de 2027, con euros a 10 NOK = 1 € redondeados al alza. La web enlaza la hoja de precios en PDF (`RiasNorge-NorwayCup2027-precios.pdf`, copia de `03-Ventas/folleto/RiasNorge-NorwayCup2027-precios-oficiales.pdf`). **Si cambias la hoja, copia el PDF nuevo aquí con ese mismo nombre.**
- **Contrato, cláusula 3.2:** la información del torneo que demos (fechas, precios, condiciones) tiene que salir de material aprobado por escrito por la Norway Cup. **Conviene mandarles el enlace de la web y la hoja de precios y pedirles el visto bueno por escrito.**
- La versión anterior (5 de octubre) está guardada en `99-Archivo/web-2026-10-05/`.

---

## Cosas que conviene revisar

- **Las cifras del torneo** (2.000+ equipos, 35 países, 30.000 jugadores) son de la edición de 2025. Confírmalas cuando la organización publique las de 2026.
- **Colchón y saco:** la web usa el precio de 2026 (820 NOK). Cambiarlo cuando la Norway Cup publique el de 2027.
- **Aviso legal.** Cuando RíasNorge sea una empresa, en España hay que añadir una página con los datos fiscales (nombre, NIF, domicilio). Pregúntaselo al gestor al constituirla. Cuando esté constituida, cambiar también la pregunta "¿Sois una empresa constituida?".
- **Fotos del piloto.** En cuanto tengáis el permiso de las familias, sustituyen a la textura azul.
- **Nombres del equipo.** La web no nombra a nadie, a propósito.

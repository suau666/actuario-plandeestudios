# Actuario · Plan de Estudios

Malla curricular interactiva para la carrera de **Actuario — FCE · UBA**, con seguimiento de correlatividades y progreso persistido en Supabase.

## ¿Qué hace?

- Muestra todas las materias organizadas por tramo y profundidad de correlatividades
- Marcás cada materia como **Regular** o **Aprobada** con un click
- Desbloquea automáticamente las materias que podés cursar según lo aprobado
- 5 temas de color: Oscuro, Blanco, Verde agua, Cremita, Pizarrón
- Guarda todo automáticamente en Supabase (estados, nombres de optativas, tema)

## Estados

| Estado | Color | Descripción |
|---|---|---|
| Pendiente | Gris | No cumplís las correlatividades todavía |
| Puedo cursar | Blanco | Podés inscribirte |
| Regular | Amarillo | La regularizaste |
| Aprobada | Verde | La aprobaste |

Click 1× → Regular · Click 2× → Aprobada · Click 3× → Vuelve a disponible

## Setup

### 1. Crear la tabla en Supabase

1. Creá un proyecto en [supabase.com](https://supabase.com)
2. Andá a **SQL Editor → New query** y pegá el contenido de `supabase_schema.sql`
3. Click en **Run**

### 2. Conectar el HTML

Abrí `actuario-plan.html` y reemplazá estas dos líneas cerca del inicio del script:

```js
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

Con los valores de tu proyecto: **Settings → API → Project URL / anon public key**

### 3. Listo

Abrí el archivo en el browser o subilo a GitHub Pages / Netlify / Vercel.

## Estructura

```
actuario-plan.html    ← toda la app (HTML + CSS + JS en un solo archivo)
supabase_schema.sql   ← SQL para crear la tabla en Supabase
```

## Deploy en GitHub Pages

1. Subí los archivos al repo
2. Settings → Pages → Source: **Deploy from branch** → `main` → `/ (root)`
3. Tu app queda en `https://tuusuario.github.io/nombre-repo/actuario-plan.html`

> **Nota:** recordá reemplazar las credenciales de Supabase antes de hacer el repo público, o usá variables de entorno si lo deployás en Netlify/Vercel.

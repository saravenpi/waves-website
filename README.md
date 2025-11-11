# WAVES Website

Landing page for the WAVES audio player with download links for all platforms.

## Features

- Dark, minimalistic design with black background
- Gohu monospace font throughout
- Platform detection for smart download suggestions
- Responsive design for mobile and desktop
- Download links for macOS, Linux, and Windows

## Development

```bash
# Install dependencies
bun install

# Start development server
bun run dev

# Build for production
bun run build

# Preview production build
bun run preview
```

## Project Structure

```
waves-website/
├── src/
│   ├── routes/
│   │   ├── +layout.svelte    # Layout with global CSS import
│   │   ├── +layout.ts         # Prerender config
│   │   └── +page.svelte       # Landing page
│   ├── app.html               # HTML template
│   └── app.css                # Global styles
├── static/
│   ├── downloads/             # Installer files
│   │   ├── waves-macos.dmg
│   │   ├── waves-linux-x86_64.tar.gz
│   │   └── waves-windows-x86_64.zip
│   ├── fonts/
│   │   └── gohu.ttf
│   ├── waves_logo.png
│   └── waves_demo.png
├── svelte.config.js           # SvelteKit config
├── vite.config.js             # Vite config
└── package.json
```

## Deployment

### Docker

The easiest way to deploy is using Docker:

```bash
# Build and run with docker-compose
docker-compose up -d

# Or build and run manually
docker build -t waves-website .
docker run -d -p 8080:80 waves-website
```

The website will be available at `http://localhost:8080`

### Static Hosting

The site is built as a static site using `@sveltejs/adapter-static`. The `build/` directory contains the production-ready files that can be deployed to any static hosting service:

- GitHub Pages
- Netlify
- Vercel
- Cloudflare Pages
- AWS S3 + CloudFront
- etc.

## Tech Stack

- **Framework**: SvelteKit
- **Build Tool**: Vite
- **Runtime**: Bun
- **Styling**: Vanilla CSS with CSS variables
- **Font**: Gohu (monospace bitmap font)
- **Adapter**: @sveltejs/adapter-static

## Design

The website follows a minimalistic aesthetic:

- **Colors**:
  - Background: Pure black (#000000)
  - Text: White (#ffffff)
  - Accent: Purple (#9664ff)
  - Secondary text: Gray (#888888)
- **Font**: Gohu monospace throughout
- **Animations**: Subtle fade-in effects and hover transitions
- **Layout**: Centered content with max-width of 900px

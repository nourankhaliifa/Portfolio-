# Deployment Guide &mdash; Nouran Ahmed Khalifa Portfolio

This website is a modern, static web application with **zero build dependencies**. It can be deployed in less than 60 seconds on any global hosting platform for free.

---

## Option 1: Netlify Drop (Fastest &ndash; 30 Seconds, No CLI, No Git Required)

This is the easiest method. You don't need Git or any command line tools.

1. Go to **[https://app.netlify.com/drop](https://app.netlify.com/drop)** in your web browser.
2. Sign in or create a free Netlify account (using your email or GitHub).
3. Open File Explorer on your computer to:
   ```text
   C:\Users\Dell\nourankhalifa
   ```
4. **Drag and drop** the `nourankhalifa` folder directly into the Netlify Drop box in your browser.
5. Netlify will deploy your site in ~5 seconds and give you a live URL (e.g., `https://nouran-khalifa.netlify.app`).
6. *(Optional)* Go to **Site settings &rarr; Change site name** to customize your free URL, or connect a custom domain.

---

## Option 2: GitHub Pages (Standard for Software Engineers)

Host your portfolio directly on GitHub at `https://<your-username>.github.io`:

### Via Web Browser (No Git CLI Needed):
1. Go to **[https://github.com](https://github.com)** and log in.
2. Click **New Repository**.
3. Name it `nourankhalifa-portfolio` (or `<your-github-username>.github.io` for a primary profile page).
4. Make it **Public**.
5. Click **"uploading an existing file"**.
6. Select all files from `C:\Users\Dell\nourankhalifa` (ensure `index.html`, `css/`, `js/`, `assets/`, and `Nouran.khalifa_cv.pdf` are included) and commit.
7. Go to **Settings &rarr; Pages**:
   - Under **Build and deployment &rarr; Source**, choose **GitHub Actions** (the repository already includes `.github/workflows/deploy.yml`), OR choose **Deploy from a branch** and select `main / (root)`.
8. Your site will be published at your free GitHub Pages URL within 1&ndash;2 minutes.

---

## Option 3: Vercel (Production SaaS Hosting)

1. Go to **[https://vercel.com](https://vercel.com)** and log in with your GitHub account.
2. Click **Add New &rarr; Project**.
3. Import your GitHub portfolio repository.
4. Framework Preset: Leave as **Other**.
5. Root Directory: `./`
6. Click **Deploy**. Vercel will apply the included `vercel.json` headers and deploy worldwide on edge CDNs with automatic HTTPS.

---

## Production Configurations Included

- **`vercel.json`**: Security headers (CSP, XSS, clickjacking protection) and asset caching rules.
- **`netlify.toml`**: Netlify edge headers and immutable asset caching.
- **`.github/workflows/deploy.yml`**: GitHub Actions automated deployment pipeline.
- **`robots.txt` & `sitemap.xml`**: Pre-configured for Google and search engine indexing.

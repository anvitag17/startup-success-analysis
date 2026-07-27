# Startup Success Analysis

This project studies factors associated with startup success using:

- LASSO regression with cross-validation
- held-out prediction metrics
- Pearson and Spearman correlations
- numeric relationship graphs
- country, industry, and funding-stage comparisons
- coefficient and prediction diagnostic graphs

## Important data note

The current CSV has the correct headers but its 124 records are blank. Replace
`data/global_startup_success_dataset-selected-columns.csv` with populated data
using the same columns before interpreting results.

## Build the report and website

From this folder, run:

```bash
Rscript render_report.R
```

The generated GitHub Pages website is:

```text
docs/index.html
```

## Publish with GitHub Pages

1. Create an empty repository on GitHub. Do not initialize it with a README.
2. In this folder, add the repository URL and push:

   ```bash
   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
   git branch -M main
   git push -u origin main
   ```

3. Open the repository on GitHub.
4. Go to **Settings → Pages**.
5. Under **Build and deployment**, choose **Deploy from a branch**.
6. Select the `main` branch and `/docs` folder, then save.

After later data or design changes, rebuild and publish with:

```bash
Rscript render_report.R
git add .
git commit -m "Update startup analysis"
git push
```

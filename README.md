# LaunchLens — Student Startup Signals

LaunchLens is a student-friendly startup learning platform. It includes:

- a six-stage path from problem discovery to launch and learning
- problem statements, solution hypotheses, brainstorming, validation, and MVP guidance
- U.S.-oriented legal and financial basics with official resource links
- interactive customer-retention, cash-runway, and startup-readiness tools
- a clear separation between educational estimates and genuine predictions

Its embedded research lab studies factors associated with startup success using:

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

### Data-source options

- **Best match for this existing project:** [Global Startup Success Dataset on Kaggle](https://www.kaggle.com/datasets/hamnakaleemds/global-startup-success-dataset).
  It has the same fields and is suitable for a class or portfolio demonstration.
  Treat its `Success Score` as a constructed learning outcome unless the uploader
  provides evidence that the company records and score are independently verified.
- **Firm-level commercial data:** [Dealroom](https://dealroom.co/products/dealroom-api/)
  or [Crunchbase](https://about.crunchbase.com/data). These are stronger sources
  for real startup, funding, and company information, but complete exports or API
  access may require an account or paid plan.
- **Open official data:** [World Bank new-business-density data](https://data.worldbank.org/indicator/IC.BUS.NDNS.ZS).
  This measures formal business formation by country and year. It is real public
  data, but it requires a different country-level research question and model.

## Build the report and website

From this folder, run:

```bash
Rscript render_report.R
```

The generated GitHub Pages website is:

```text
docs/index.html
```

The HTML presentation is styled in `styles.css`; the analysis and R-generated
graphs live in `project.Rmd`.

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

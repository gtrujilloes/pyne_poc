# pyne_poc
# 🌐 July 22nd - PYNE & Guille - Full-Stack Data Pipeline on Google Cloud

## 📊 Project Overview

This project demonstrates an end-to-end data pipeline built on **GCP**. It ingests semi-structured data from a public API, stores and processes it in BigQuery, transforms it using **dbt**, automates the workflow via **CI/CD**, and communicates insights via SQL and visualization.

---

## 🚀 Tech Stack

| Component        | Tool / Service     |
|------------------|--------------------|
| Ingestion        | Python + Cloud Functions |
| Storage          | Cloud Storage, BigQuery |
| Transformation   | dbt (Cloud)        |
| CI/CD            | dbt Cloud Jobs |
| Visualization    | Looker Studio |
| Infra Management | GCP Console / IaC (optional) |

---

## 🔁 Pipeline Flow

1. **Ingest**: Cloud Function fetches semi-structured data (JSON) from a public API.
2. **Store**: Raw data is stored in Cloud Storage and loaded into BigQuery (raw schema).
3. **Transform**: dbt models clean and structure the data into analytics-ready tables.
4. **Deploy**: CI/CD triggers dbt Cloud jobs on merge to `main`.
5. **Visualize**: Clean data exposed via SQL views or Looker dashboards.

---

## 📂 Project Structure

## 🛠️ Bootstrapping the Environment

Follow these steps to set up the project from scratch:

1. **Clone the repo**
   ```bash
   git clone https://github.com/gtrujilloes/pyne_poc.git
   cd pyne_poc

2. **Set up GCP**
- Create a project and enable BigQuery, Cloud Storage, and Cloud Functions.
- Create a BigQuery dataset named raw_data.
- Create a Cloud Storage bucket for raw data landing.
- Create and download a service account JSON key with BigQuery permissions.

3. **Set up Python environment (for data ingestion)**

```bash
    python3 -m venv venv
    source venv/bin/activate
    pip install -r ingestion/requirements.txt
```

4. **Set environment variables**
Create a .env file with:
      ```bash
      GCP_PROJECT=my-data-project
      BQ_DATASET=raw_data
      API_KEY=your_api_key_here
      ```

5. **Set up dbt**
- Create a dbt Cloud project and connect it to BigQuery.
- Clone this repo into dbt Cloud or connect GitHub repo.
- Run dbt run and dbt test.

6. **Trigger CI/CD**
- CI pipeline runs `dbt run` and `dbt test` on every pull request and deploys to production on merge to `main`.
[![View Build Logs](https://img.shields.io/badge/dbt%20Cloud-Build%20Logs-blue)](https://cloud.getdbt.com/#/accounts/70471823478451/projects/70471823488943/jobs/70471823485704/)



## 💡 Findings

See the looker studio dashboard [here](https://lookerstudio.google.com/reporting/c5eb01a2-525f-4736-9e4a-56e56d5e1191/page/JwzRF/edit). 

**Breed Lifespan and Weight Insights can help drive tailed product strategies for long term growth and customer-tailored products.**


**🩺 Life span: **

- The Terrier, Toy, and Non-Sporting groups exhibit the longest life spans, both in median and average, typically ranging between 12–13 years.
- Working dogs show the shortest life spans, with a median and average of around 10 years.
- For all breed groups, median and average life spans are closely aligned (+/- 1 year), suggesting symmetrical life span distributions.
- The market for each breed will depend on their life span. Focus on long-lived breeds (Terrier, Toy, Non-Sporting) for long-term business such as senior dog items or lifetime insurance.
- For short-lived, working and hound breeds, developing shorter-term and flexible activities will be key. An example of this could be activity-focused products.

**🏋🏼‍♂️ Weight distribution:**
- While almost all dogs in certain breeds fall into a single weight class (i.e., all Toy are small, and nearly all Working are large), others show a more varied distribution of weights (i.e., Sporting and Hound show a roughly half-and-half proportion between large and medium).
- The weight distribution within each breed group directly affects the need for size-specific products and care. Breeds that fall entirely into one size class can be served with more compact and precisely tailored solutions.
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
| CI/CD            | GitHub Actions + dbt Cloud Jobs |
| Visualization    | Looker Studio / BigQuery SQL |
| Infra Management | GCP Console / IaC (optional) |

---

## 🔁 Pipeline Flow

1. **Ingest**: Cloud Function fetches semi-structured data (JSON) from a public API.
2. **Store**: Raw data is stored in Cloud Storage and loaded into BigQuery (raw schema).
3. **Transform**: dbt models clean and structure the data into analytics-ready tables.
4. **Deploy**: GitHub CI/CD triggers dbt Cloud jobs on merge to `main`.
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
[![View Build Logs](https://img.shields.io/badge/dbt%20Cloud-Build%20Logs-blue)](https://cloud.getdbt.com/#/accounts/12345/projects/67890/jobs/111213/)




      







   


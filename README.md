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


# pyne_poc
# 🌐 July 22nd - PYNE & Guille - Full-Stack Data Pipeline on Google Cloud

## 📊 Project Overview

This project demonstrates an end-to-end data pipeline built on **GCP**. It ingests semi-structured data from a public API, stores and processes it in BigQuery, transforms it using **dbt**, automates the workflow via **CI/CD**, and communicates insights via SQL and visualization.

---

## 🚀 Tech Stack

| Component        | Tool / Service     |
|------------------|--------------------|
| Ingestion        | Python + Cloud Functions |
| Storage          | BigQuery |
| Transformation   | dbt   |
| CI/CD            | dbt Jobs |
| Visualization    | Looker Studio |

---

## 🔁 Pipeline Flow

1. **Ingest**: Cloud Function fetches semi-structured data (JSON) from a public API.
2. **Store**: Raw data is stored in Cloud Storage and loaded into BigQuery (raw schema).
3. **Transform**: dbt models clean and structure the data into analytics-ready tables.
4. **Deploy**: CI/CD triggers dbt Cloud jobs on merge to `main`.
5. **Visualize**: Clean data exposed via SQL views or Looker dashboards.

---

## 📂 Project Structure

```
guillermotrujilloes/
├── guille_attemps
   ├── pull_dogs_data.py
   ├── Dockerfile
   ├── requirements.txt
├── pyne_poc
   ├── README.md
   ├── dbt_project.yml
   ├── analyses
   ├── macros
   ├── models
   ├── seeds...
├── 
```


# 🚀 Project Bootstrap Guide (GCP-Focused)

This guide outlines how to bootstrap the **Google Cloud Platform (GCP)** environment for a full-stack data pipeline project using Cloud Run, BigQuery, and DBT.

---

## 🔧 1. GCP Project Setup

1. **Create a GCP Project**:

   * Go to [GCP Console](https://console.cloud.google.com/)
   * Create a new project (e.g., `dog-breeds-pipeline`)

2. **Enable Required APIs**:

   ```bash
   gcloud services enable run.googleapis.com \
       bigquery.googleapis.com \
       storage.googleapis.com \
       cloudbuild.googleapis.com \
       cloudscheduler.googleapis.com
   ```

3. **Set GCP Project & Region**:

   ```bash
   gcloud config set project YOUR_PROJECT_ID
   gcloud config set run/region europe-west1
   ```

---

## 🛠️ 2. Cloud Storage Bucket (for Raw JSON Files)

```bash
gsutil mb -l europe-west1 gs://YOUR_BUCKET_NAME/
```

To structure by ingestion date:

```bash
gsutil cp data.json gs://YOUR_BUCKET_NAME/raw/dogs/$(date +%F)/data.json
```

---

## 🏗️ 3. BigQuery Dataset & Table

Create dataset:

```bash
bq mk --location=europe-west1 bronze
```

Create empty table (or let BigQuery infer schema on load):

```bash
bq mk --table pyne-poc:bronze.dog_raw_api name:STRING,weight:STRING,...
```

---

## 🐍 4. Python Script for ETL

Write your ETL logic in a `pull_dogs_data.py` that:

* Fetches data from the API
* Stores it in GCS (`/tmp` folder if running on Cloud Run)
* Loads to BigQuery

Example file structure:

```
project-root/
├── pull_dogs_data.py
├── requirements.txt
├── Dockerfile
```

---

## 🐳 5. Docker Image Build & Push

```bash
gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/dog-etl-job .
```

---

## ⚙️ 6. Deploy Cloud Run Job

```bash
gcloud run jobs create dog-etl-job \
    --image gcr.io/YOUR_PROJECT_ID/dog-etl-job \
    --region europe-west1
```

To run the job:

```bash
gcloud run jobs execute dog-etl-job --region europe-west1
```

---

## 📅 7. Schedule with Cloud Scheduler

Create a Cloud Scheduler job via UI or CLI:

```bash
gcloud scheduler jobs create http run-dog-job \
  --schedule="0 2 * * *" \
  --uri="https://REGION-run.googleapis.com/apis/run.googleapis.com/v1/namespaces/YOUR_PROJECT_ID/jobs/dog-etl-job:run" \
  --http-method=POST \
  --oauth-service-account-email=SCHEDULER_SA@YOUR_PROJECT_ID.iam.gserviceaccount.com \
  --location=europe-west1
```


## 💡 Findings

See the looker studio dashboard [here](https://lookerstudio.google.com/reporting/c5eb01a2-525f-4736-9e4a-56e56d5e1191/page/JwzRF/edit). 

**Breed Lifespan and Weight Insights can help drive tailed product strategies for long term growth and customer-tailored products.**


**🩺 Life span:**

- The Terrier, Toy, and Non-Sporting groups exhibit the longest life spans, both in median and average, typically ranging between 12–13 years.
- Working dogs show the shortest life spans, with a median and average of around 10 years.
- For all breed groups, median and average life spans are closely aligned (+/- 1 year), suggesting symmetrical life span distributions.
- The market for each breed will depend on their life span. Focus on long-lived breeds (Terrier, Toy, Non-Sporting) for long-term business such as senior dog items or lifetime insurance.
- For short-lived, working and hound breeds, developing shorter-term and flexible activities will be key. An example of this could be activity-focused products.

**🏋🏼‍♂️ Weight distribution:**
- While almost all dogs in certain breeds fall into a single weight class (i.e., all Toy are small, and nearly all Working are large), others show a more varied distribution of weights (i.e., Sporting and Hound show a roughly half-and-half proportion between large and medium).
- The weight distribution within each breed group directly affects the need for size-specific products and care. Breeds that fall entirely into one size class can be served with more compact and precisely tailored solutions.

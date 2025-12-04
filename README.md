# Logistics Shipment Analysis Dashboard

This project is a **Power BI dashboard** analyzing shipment operational performance, delivery trends, and customer satisfaction based on a sample shipments dataset. It demonstrates the ability to extract insights using **SQL queries** and visualize key performance metrics in **Power BI**.  

---

## 🗂 Dataset

The dataset contains the following fields:

- `shipment_id` – Unique identifier for each shipment (Text)
- `created_date`, `shipped_date`, `delivered_date` – Dates of creation, shipment, and delivery (Date/Time)
- `sender_country`, `origin_center`, `destination_region` – Text fields for location information
- `weight_grams` – Numeric shipment weight in grams
- `shipment_type` – Type of shipment (Text)
- `delivery_status` – Delivered, Delayed, Returned, Lost (Text)
- `delay_reason` – Reason for delay (Text)
- `distance_km` – Distance in kilometers (Number)
- `return_reason` – Reason for return (Text)
- `customer_rating` – Customer satisfaction rating (Number)
- `is_holiday_season` – TRUE/FALSE indicator (Boolean)

> **Note:** Some columns such as `return_reason` and certain delivery reasons were empty in SQL, but were handled in Power BI using filters or alternative measures.

> **Note on Returned/Lost Data:**  
> Returned and lost shipments are visible in Power BI but **not in the SQL results** because the SQL table used for querying did not include those records, while Power BI loaded the full raw dataset. This was identified during data profiling.

---

## 📊 SQL Queries

The following SQL queries were used to extract key insights from the dataset:

1. **Average delivery time across all shipments**
2. **Shipment counts by on-time vs delayed**
3. **Average delivery time per shipment type**
4. **Fastest origin center**
5. **Distribution of delivery delays by destination region**
6. **Average delivery time: Holiday vs Non-Holiday season**
7. **Top 5 shipments with longest delivery times and delay reasons**
8. **Average delivery time by weight category**
9. **Key KPIs:**
   - Average delivery time
   - On-time delivery rate
   - Delayed shipments by region
10. **Percentage of shipments with missing delivery reason**
11. **Shipments created but never shipped/delivered**
12. **Average distance for delayed vs on-time shipments**
13. **Customer rating trend over time**

> Full SQL scripts are included in the repository.

---

## 📈 Power BI Dashboard

The dashboard consists of **3 pages**:

### **Page 1 – Operational Performance**
- **Donut Chart:** Shipments by delivery status (Delivered / Delayed / Returned / Lost)
- **Card:** Average delivery time
- **Stacked Column Chart:** Average delivery time by shipment type
- **Card:** Fastest origin center (with average delivery time)
- **Clustered Column Chart:** Delivery time distribution by destination region

### **Page 2 – Delivery Insights**
- **Column Chart:** Average delivery time by holiday season (`Holiday Season` vs `Non-Holiday Season`)
- **Column Chart:** Delivery time distribution (1–9 days) for delivered shipments
- **Column Chart:** Average delivery time by weight category (`Light`, `Medium`, `Heavy`)

### **Page 3 – Customer Experience**
- **Line Chart:** Customer rating trend over months
- **Column Chart:** Customer rating distribution
- **Table:** Top/Bottom rated shipments with shipment ID, origin, destination, and rating

> Filters and slicers are applied to allow interactive exploration by `destination_region`, `shipment_type`, and `origin_center`.

---

## 🛠 Tools & Technologies
- **SQL:** Data extraction and preprocessing  
- **Power BI:** Data visualization and dashboard creation  
- **GitHub:** Repository for project portfolio  

---

## 💡 Insights
- Average delivery time is generally consistent across shipment types and weight categories.  
- Some regions have more frequent delays – actionable insight for logistics optimization.  
- Holiday season shipments are slightly faster than non-holiday shipments.  
- Customer satisfaction fluctuates monthly with no clear improvement trend, highlighting opportunities for operational improvement.  

---

## 📂 Repository Structure
- **data**: contains the source CSV/Excel datasets used in the project.  
- **powerbi**: contains the interactive Power BI dashboard file `logistics_dashboard.pbix`.  
- **sql**: contains SQL scripts, e.g., `shipments.sql`, used to calculate KPIs and metrics.  
- **README.md**: explains the project, dataset, SQL queries, dashboard pages, and insights.

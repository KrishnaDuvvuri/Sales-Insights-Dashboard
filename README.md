# Sales Insights Dashboard

An end-to-end **Sales Insights Dashboard** that analyzes sales, profit, and customer performance using **Python**, **MySQL**, and **Tableau**.

This project transforms raw Superstore data into actionable insights for business decision-making through SQL analysis and interactive Tableau dashboards.

---

## Project Workflow

1. **Data Preparation (Python)**
   - Loaded the Superstore dataset using pandas
   - Cleaned and validated columns
   - Created MySQL database `sales_insights_db`
   - Loaded data into MySQL using SQLAlchemy & PyMySQL

2. **Data Analysis (MySQL)**
   - Wrote SQL queries to analyze:
     - Sales by region, category, and sub-category  
     - Monthly sales trends  
     - Top customers and most/least profitable products

3. **Visualization (Tableau)**
   - Built interactive dashboard showing:
     - KPIs (Sales, Profit, Quantity)
     - Regional and category performance
     - Monthly trends
     - Customer and product profitability
   - Added filters for **Region**, **Category**, and **Year**

---

## Tools & Technologies

| Category | Tools Used |
|-----------|-------------|
| Programming | Python (pandas, sqlalchemy, pymysql) |
| Database | MySQL Workbench |
| Visualization | Tableau Public |
| Other | Excel, CSV, SQL Scripts |

---

## Key Insights

- **Technology** category generated the highest profit  
- **West Region** dominated overall sales  
- **Top 10 customers** accounted for ~28% of total sales  
- **Copiers & Phones** were most profitable sub-categories  
- **Tables & Bookcases** led to recurring losses  

---

## Files in This Repository

| File | Description |
|------|--------------|
| `load_data.py` | Python script to create DB and load data into MySQL |
| `analysis_queries.sql` | SQL scripts for generating insights |
| `sales_data.csv` | Clean dataset used for visualization |
| `README.md` | Project documentation |

---

## Tableau Dashboard

**[View Live on Tableau Public]([https://public.tableau.com/](https://public.tableau.com/views/Book1_17533639253980/Dashboard1?:language=en-US&:sid=&:redirect=auth&publish=yes&showOnboarding=true&:display_count=n&:origin=viz_share_link))**  

---

## Developed By

**Krishna Adithya Duvvuri**  
B.Tech (Computer Science) | IIIT Hyderabad PG Diploma in AI/ML  
[LinkedIn](http://www.linkedin.com/in/krishna-duvvuri-b56a53294)

---

*If you like this project, give it a star on GitHub!*  

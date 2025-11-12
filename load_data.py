import pandas as pd
from sqlalchemy import create_engine, text

# ---------- CONFIGURATION ----------
# 👇 Update these values based on your MySQL Workbench setup
MYSQL_USER = "root"
MYSQL_PASSWORD = "root"
MYSQL_HOST = "localhost"
MYSQL_PORT = "3306"
DB_NAME = "sales_insights_db"
TABLE_NAME = "sales_data"
CSV_FILE_PATH = r"C:\Krishna Duvvuri\Projects\Sales Insight Dashboard\Superstore.csv"  # 👈 Replace with your CSV location
# ----------------------------------

# 1️⃣ Read the dataset
print("📂 Reading dataset...")
df = pd.read_csv(CSV_FILE_PATH, encoding='latin1')
print(f"✅ Loaded {len(df)} rows.")

# 2️⃣ Clean and prepare columns
df.drop_duplicates(inplace=True)
df["Order Date"] = pd.to_datetime(df["Order Date"], errors="coerce")
df["Ship Date"] = pd.to_datetime(df["Ship Date"], errors="coerce")

# 3️⃣ Connect to MySQL Server (root)
print("🔗 Connecting to MySQL...")
engine = create_engine(
    f"mysql+pymysql://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}:{MYSQL_PORT}"
)

with engine.connect() as conn:
    conn.execute(text(f"CREATE DATABASE IF NOT EXISTS {DB_NAME};"))
    print(f"✅ Database '{DB_NAME}' ready.")

# 4️⃣ Connect to the specific database
engine = create_engine(
    f"mysql+pymysql://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}:{MYSQL_PORT}/{DB_NAME}"
)

# 5️⃣ Create the table (if it doesn’t exist)
create_table_query = f"""
CREATE TABLE IF NOT EXISTS {TABLE_NAME} (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Region VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);
"""
with engine.connect() as conn:
    conn.execute(text(create_table_query))
    print(f"✅ Table '{TABLE_NAME}' ready.")

# 6️⃣ Load data into the table
print("🚀 Loading data into MySQL...")
df.to_sql(TABLE_NAME, con=engine, if_exists="replace", index=False)
print("✅ Data loaded successfully!")

# 7️⃣ Validate by checking the number of rows inserted
with engine.connect() as conn:
    result = conn.execute(text(f"SELECT COUNT(*) FROM {TABLE_NAME};"))
    row_count = result.scalar()
    print(f"📊 Table now contains {row_count} rows.")

# Indonesia_Retail_Data_Cleaning_BI
# 📈 INDONESIAN RETAIL DATA TIDYING & BUSINESS INSIGHTS (Python & SQL)

This project showcases end-to-end data cleaning, analysis, and Business Intelligence (BI) visualization on a dirty retail transaction dataset from the Indonesian market.

---

## 🎯 PROJECT GOALS

1. **Data Tidying:** Convert raw, inconsistent regional data (CSV format) into a clean, structured Pandas DataFrame suitable for reporting.
2. **Data Analysis:** Aggregate transaction data to identify Total Revenue by Region.
3. **Visualization:** Create an actionable bar chart to communicate regional revenue performance.

---

## 🛠 KEY CHALLENGES & SOLUTIONS

This project focused heavily on addressing typical real-world data quality issues using Python Pandas:

| Challenge | Technical Solution | Python Method Used |
| :--- | :--- | :--- |
| **Regional CSV Encoding** | Data could not be separated due to regional semicolon delimiter and an incorrect header row (A1). | `pd.read_csv(sep=';', header=1)` |
| **Header Errors** | The first data row was mistakenly used as the column header. | `.iloc[0]` for header extraction and manual column **Renaming** (`df.columns = new_names`). |
| **Data Type Correction** | Transaction IDs were read as text (`object`) and prices as integers (`int64`). | `pd.to_datetime()` (for **Transaction_ID**) and `.astype('float64')` (for **Revenue/Price**). |
| **Missing Values** | 6 rows had corrupted Transaction IDs after type conversion. | **Dropping** the incomplete rows using `df.dropna(subset=['Transaction_ID'])`. |
| **Text Inconsistency** | Duplicate regional names (`JKT`/`JAKARTA`, `BDG`/`BANDUNG`) distorted analysis. | **Remapping** using the `.replace()` method with a Python dictionary. |

---

## 📊 ANALYSIS RESULTS

The final analysis revealed clear revenue hierarchy after data standardization:
1. **Jakarta** (Total Revenue: 138M IDR)
2. **Surabaya** (Total Revenue: 60M IDR)
3. **Jawa Barat** (Total Revenue: 49M IDR)
4. **Bandung** (Total Revenue: 31M IDR)

**(See the full Bar Chart visualization in the attached `Indonesia_Retail_Data_Cleaning_BI.ipynb` notebook.)**

---

## ⚙️ KEY TECHNOLOGIES & TOOLS

* **Python:** Primary scripting language.
* **Pandas:** Core library for all data cleaning, manipulation, and analysis.
* **Matplotlib:** Used for generating the final Business Intelligence (BI) Bar Chart visualization.
* **SQL (Conceptual):** Used for initial logic development (`SELECT`, `WHERE`, `GROUP BY`).
* **Google Colab / Jupyter:** Development environment.

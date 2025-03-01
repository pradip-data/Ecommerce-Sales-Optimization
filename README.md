# **Strategies to Combat Shopping Cart Abandonment & Boost Sales at MagicMade e-commerce**

## **📌 Project Overview**
Shopping cart abandonment is a significant challenge for **MagicMade**, leading to lost revenue and reduced customer engagement. This project aims to analyze user behavior, identify key abandonment reasons, and implement **data-driven strategies** to improve conversions and optimize the shopping experience.

This project leverages a **combination of Python, Power BI, and SQL** to conduct a detailed shopping cart abandonment analysis, providing actionable insights through interactive dashboards and visualizations.

---
## **🛠 Tech Stack Used**

- **Python** 🐍 (Data cleaning, analysis, and visualization using Pandas, Matplotlib, and Seaborn)
- **SQL** 🗄️ (Data extraction, transformation, and aggregation)
- **Power BI** 📊 (Interactive dashboards for reporting and insights)

---
## **📂 Dataset Description**
The dataset used in this project contains information related to **user behavior, cart status, session details, and purchase categories**. The key columns are:

| Column Name | Description |
|-------------|-------------|
| `User_ID` | Unique identifier for each user |
| `User_Location` | Location of the user |
| `Gender` | Gender of the user (Male/Female) |
| `Cart_Contents` | Items added to the cart |
| `Cart_Value` | Total value of the cart |
| `Session_Date` | Date when the session occurred |
| `Session_Duration` | Time spent on the platform during a session |
| `Abandonment_Reason` | Reason why the cart was abandoned |
| `Purchase_Category` | Product category selected by the user |
| `Referral_Medium` | Source from where the user landed (Social Media, Email, Search Engine) |
| `Device_Type` | Device used for browsing (Mobile, Desktop, Tablet) |
| `Cart_Status` | Status of the cart (Paid/Abandoned) |

---
## **🎯 Key Objectives**

1. **Analyze Cart Abandonment Trends** 📊
   - Identify the most common reasons for cart abandonment.
   - Examine patterns in user behavior leading to abandonment.

2. **Understand Revenue Impact** 💰
   - Calculate total revenue loss due to abandoned carts.
   - Analyze cart values of abandoned vs. completed purchases.

3. **Optimize Customer Experience** 🔍
   - Determine session duration trends and their correlation with abandonment.
   - Identify user demographics contributing to high abandonment rates.

4. **Improve Marketing & Retargeting Strategies** 🎯
   - Analyze the effectiveness of different referral mediums.
   - Determine the best-performing and worst-performing product categories.

---
## **📊 Data Analysis & Visualization (Python + Power BI)**

### **1️⃣ Python Data Analysis & Insights**
The dataset is analyzed using Python to uncover hidden patterns and trends:

- **Session Duration Analysis:** Relationship between session time and cart abandonment.
- **Abandonment Reason Analysis:** Most common reasons for cart abandonment.
- **Cart Value Distribution:** High vs. low cart abandonment trends.
- **Device Usage Analysis:** Impact of Mobile/Desktop usage on abandonment rates.

📌 **Python-Generated Visualizations:**  
🔹 Cart Abandonment Rate vs. Cart Value (Bar Chart)  
🔹 Abandonment Rate by Device Type (Pie Chart)  
🔹 Session Duration vs. Abandonment (Scatter Plot)  

📷 *[Insert Python-generated images here]*

---
### **2️⃣ Power BI Interactive Dashboard**

The Power BI dashboard provides an interactive view of:
- **Cart Abandonment by Month & Category** 📆
- **Geographic Trends of Abandonment** 🌍
- **Revenue Loss & Potential Recovery** 💸
- **Session Duration & Purchase Behavior** ⏳

📌 **Power BI Dashboard Screenshots:**

📷 *[Insert Power BI dashboard images here]*

---
## **📌 SQL Queries for Data Extraction & Transformation**
SQL queries were used to extract and transform data before visualization:

🔹 **Total Cart Abandonment & Paid Transactions:**
```sql
SELECT Cart_Status, COUNT(*) AS Total_Count
FROM shopping_cart_data
GROUP BY Cart_Status;
```

🔹 **Abandonment Reasons Breakdown:**
```sql
SELECT Abandonment_Reason, COUNT(*) AS Abandonment_Count
FROM shopping_cart_data
WHERE Cart_Status = 'Abandoned'
GROUP BY Abandonment_Reason
ORDER BY Abandonment_Count DESC;
```

🔹 **Average Cart Value of Abandoned vs. Paid Transactions:**
```sql
SELECT Cart_Status, AVG(Cart_Value) AS Avg_Cart_Value
FROM shopping_cart_data
GROUP BY Cart_Status;
```

---
## **📌 Key Insights & Findings**

✅ **Cart Abandonment Rate:** 50.03% users abandon their cart, leading to significant revenue loss.
✅ **Top Abandonment Reasons:** Complex Checkout (63,748 cases), No Guest Checkout (63,746 cases).
✅ **Device Type Impact:** Highest abandonment rate among **mobile users (170,835 users)**.
✅ **Peak Abandonment Month:** **August**, while the lowest abandonment month was **February**.
✅ **Referral Medium Analysis:** Social Media brings the highest traffic but also has the highest abandonment rate.
✅ **Session Duration Correlation:** Very long session durations (81-120 min) saw the highest abandonment.
✅ **Cart Value Impact:** Abandonment was highest in the **$100-$199** range.
✅ **Revenue Loss Estimation:** 50.05% of potential revenue lost due to cart abandonment.

---
## **🔹 Recommendations to Reduce Cart Abandonment**

✔️ **Optimize Checkout Process:** Simplify the steps and allow guest checkout.
✔️ **Improve Mobile Experience:** Enhance UI/UX for mobile users.
✔️ **Personalized Retargeting:** Use abandoned cart reminders via email/SMS.
✔️ **Reduce Unexpected Costs:** Provide clear pricing upfront (no hidden fees).
✔️ **Boost Trust Signals:** Display security badges and customer reviews.
✔️ **Offer Incentives:** Discounts or free shipping for completing a purchase.
✔️ **Analyze Peak Abandonment Periods:** Optimize marketing efforts around peak times.

---
## **📥 Installation & Usage Guide**

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/your-username/shopping-cart-abandonment.git
cd shopping-cart-abandonment
```

### **2️⃣ Install Dependencies**
```bash
pip install pandas numpy matplotlib seaborn powerbi-python-sdk
```

### **3️⃣ Run the Python Analysis**
```bash
python analysis.py
```

### **4️⃣ Load SQL Queries in Database**
Run the provided SQL queries in your **database management system**.

### **5️⃣ Open Power BI Dashboard**
Import the Power BI `.pbix` file to explore interactive insights.

---
## **💡 Conclusion**

This project successfully identifies the key pain points leading to shopping cart abandonment and provides data-driven solutions for improving customer experience and increasing conversions. By leveraging **Python, SQL, and Power BI**, MagicMade can effectively reduce cart abandonment rates and recover lost revenue.

🚀 **Future Work:** Implement ML models to predict cart abandonment & enhance retargeting strategies.

---
### **📌 Author: [Your Name]**  
### **📎 Contact: [Your Email]**  
### **🌐 GitHub: [Your Profile]**  

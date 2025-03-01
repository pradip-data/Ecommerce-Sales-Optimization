

# Strategies to Combat Shopping Cart Abandonment & Boost Sales at MagicMade e-commerce 

## 📌 Project Overview

Shopping cart abandonment is a significant challenge for e-commerce businesses, including MagicMade. Customers often add items to their carts but leave without completing the purchase, leading to revenue loss and reduced customer retention. This project leverages **Python, Power BI, and SQL** to analyze cart abandonment trends, identify key reasons, and suggest actionable strategies to improve conversions.

## 🛒 Problem Statement

MagicMade, an online retail platform, has been experiencing a high shopping cart abandonment rate. This issue affects revenue generation and impacts customer experience. The challenge is multifaceted, involving factors such as:

### **1️⃣ Revenue Impact**
Each abandoned cart represents a **missed sales opportunity**, directly reducing potential earnings. Understanding why users abandon their carts helps recover lost revenue.

### **2️⃣ Customer Experience Issues**
A high abandonment rate may indicate usability problems, such as a complex checkout process, hidden fees, or slow website performance. Improving these factors can enhance user experience and encourage successful purchases.

### **3️⃣ Marketing and Conversion Optimization**
Analyzing abandonment patterns allows MagicMade to refine marketing strategies. **Retargeting, email reminders, and checkout process improvements** can help convert abandoned carts into successful transactions.


## **🛠 Tech Stack Used**

- **Python** 🐍 (Data cleaning, analysis, and visualization using  Numpy, Pandas, Matplotlib, and Seaborn)
- **SQL** 🗄️ (Data extraction, transformation, and aggregation)
- **Power BI** 📊 (Interactive dashboards for reporting and insights)

  
### **Data Attributes:**
- `User_ID` - Unique identifier for users
- `User_Location` - Geographical location of users
- `Gender` - Male or Female
- `Cart_Contents` - Items in the shopping cart
- `Cart_Value` - Value of items in the cart
- `Session_Date` - Date of session activity
- `Session_Duration` - Total time spent in a session
- `Abandonment_Reason` - Stated reason for not completing the purchase
- `Purchase_Category` - Category of products
- `Referral_Medium` - Source of website traffic (Social Media, Search Engine, Email, etc.)
- `Device_Type` - Desktop, Mobile, or Tablet
- `Cart_Status` - Paid or Abandoned

###  **Note** : Originally this Dataset Row Count is 7212 Then Use of Python Code & AI we can generate more 500000  Row Dataset according to previous patteren of Dataset

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
  
   
## **📊 Data Analysis & Visualization (Python + Power BI)**

### **1️⃣ Python Data Analysis & Insights**
The dataset is analyzed using Python to uncover hidden patterns and trends:

📌 **Python-Generated Visualizations:**  

#### **1.Cart Status Distribution**  
<img src="Python%20Visulization%20Images/cart%20status%20distribution.png" width="400">

#### **2.Most Common Cart Abandonment Reason**  
<img src="Python%20Visulization%20Images/most%20common%20abandonment%20reason.png" width="400">

#### **3.Top Referral Medium**  
<img src="Python%20Visulization%20Images/top%20refferal%20medium.png" width="400">

#### **4.Month Wise Cart Abandonment Rate**  
<img src="Python%20Visulization%20Images/month%20wise%20cart%20abandonment%20rate.png" width="400">

#### **5.Abandoned Users by Session Range**  
<img src="Python%20Visulization%20Images/abandoned%20users%20by%20session%20range.png" width="400">

#### **6.Total Cart Value: Paid vs Abandonment**  
<img src="Python%20Visulization%20Images/total%20cart%20value%20paid%20vs%20abandonment.png" width="400">

---

### **2️⃣ Power BI Interactive Dashboard**
The **Power BI dashboard** provides a real-time, interactive analysis of cart abandonment patterns.

#### **Cart Abandonment Analysis Dashboard**  
<img src="Python%20Visulization%20Images/Cart%20Abandonment%20Analysis%20Overview-1.png" width="600">

<img src="Python%20Visulization%20Images/Cart%20Abandonment%20Analysis%20Dashboard-2.png" width="600">




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

## 🔍 Key Insights from Data Analysis

1. **Total Users:** 507,211
2. **State with Highest Customers:** Virginia (85,681 customers)
3. **Highest Cart Abandonment Rate by State:** Virginia (42,765 abandoned carts)
4. **Most Common Abandonment Reasons:**
   - **Complex Checkout:** 63,748 cases
   - **No Guest Checkout Option:** 63,746 cases
5. **Devices and Checkout Complaints:**
   - **Desktop Users:** Most complaints about **complex checkout**
   - **Mobile Users:** Most complaints about **complex checkout**
   - **Tablet Users:** Most complaints about **No Guest Checkout Option**
6. **Average Abandoned Cart Value:** $260
7. **Cart Value Range with Highest Abandonment:** $100-$200
8. **Session Duration Analysis:**
   - **Longer session times (81-120 mins) saw the highest abandonment rates**
   - **Shorter session times (5-20 mins) had the lowest abandonment rates**
9. **Purchase Categories with Highest Abandonment:**
   - **Candle Holders, Wedges, Puzzles, Slippers, Games**
10. **Potential Revenue Loss Due to Abandonment:** **50.05% of total revenue**


## ✅ Recommendations & Final Solution

### **🛠️ 1. Simplify the Checkout Process**
- Reduce the number of checkout steps
- Enable **one-click checkout** for returning customers
- Provide a clear **progress bar** to guide users

### **👥 2. Introduce Guest Checkout**
- Avoid forcing users to **create an account before purchasing**
- Offer an **express checkout** option

### **📢 3. Optimize Marketing & Retargeting**
- **Email Reminders**: Send abandoned cart reminders with discounts
- **Retargeting Ads**: Display relevant ads to users who abandoned their carts
- **Personalized Offers**: Provide discount codes for hesitant customers

### **📱 4. Improve Mobile Experience**
- Optimize checkout for **mobile users**, as they have the highest abandonment rate
- Ensure a **fast, responsive** mobile site

### **💳 5. Transparent Pricing & Payment Options**
- Display all fees upfront (shipping, taxes)
- Offer **multiple payment options** (credit cards, PayPal, Buy Now Pay Later)

### **📊 6. A/B Testing & Analytics**
- Conduct A/B testing on different checkout designs
- Monitor abandonment trends with **real-time analytics**

## 🎯 Conclusion
Shopping cart abandonment is a major issue for **MagicMade**, leading to **lost revenue and decreased customer retention**. Our data-driven approach has helped identify key reasons behind cart abandonment, allowing us to propose actionable solutions. 

By implementing **checkout optimizations, guest checkout, retargeting, mobile-friendly experiences, and better pricing transparency**, MagicMade can significantly **reduce abandonment rates** and **increase conversions**. With a combination of **Python (for analytics), Power BI (for visualization), and SQL (for data querying),** this project provides a comprehensive solution for improving e-commerce performance.

### **📌 Author: Mangroliya Pradip**  
### **📎 Contact: pradipias2023@gmail.com **  
### **🌐 GitHub: [Your Profile]**  


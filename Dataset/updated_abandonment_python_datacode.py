#!/usr/bin/env python
# coding: utf-8

# In[1]:


# originally this dataset row count is 7212 use of python code we can generate more 500000 dataset according to previous patteren of dataset

import pandas as pd   
import numpy as np
from random import choice, randint
from datetime import datetime, timedelta

# Load the existing dataset
file_path = file_path = r"C:\Users\chemi\Downloads\PROJECT-Strategies to Combat Shopping Cart Abandonment & Boost Sales at MagicMade\abandonment_dataset.csv"
  # Change this to your actual file path
df = pd.read_csv(file_path)

# Number of new rows to generate
new_rows = 500000  # Change this number as needed

# Extract existing unique values for categorical columns
user_locations = df["User_Location"].dropna().unique().tolist()
genders = df["Gender"].dropna().unique().tolist()
cart_contents = df["Cart_Contents"].dropna().unique().tolist()
purchase_categories = df["Purchase_Category"].dropna().unique().tolist()
referral_mediums = df["Referral_Medium"].dropna().unique().tolist()
device_types = df["Device_Type"].dropna().unique().tolist()
cart_statuses = df["Cart_Status"].dropna().unique().tolist()
abandonment_reasons = df["Abandonment_Reason"].dropna().unique().tolist()

# Generate new data
new_data = {
    "User_ID": [f"User_{len(df) + i + 1}" for i in range(new_rows)],
    "User_Location": [choice(user_locations) for _ in range(new_rows)],
    "Gender": [choice(genders) for _ in range(new_rows)],
    "Cart_Contents": [choice(cart_contents) for _ in range(new_rows)],
    "Cart_Value": np.round(np.random.uniform(df["Cart_Value"].min(), df["Cart_Value"].max(), new_rows), 2),
    "Session_Date": [(datetime(2023, 1, 1) + timedelta(days=randint(0, 365))).strftime("%m/%d/%Y") for _ in range(new_rows)],
    "Session_Duration": [randint(df["Session_Duration"].min(), df["Session_Duration"].max()) for _ in range(new_rows)],
    "Abandonment_Reason": [choice(abandonment_reasons) if np.random.rand() > 0.5 else np.nan for _ in range(new_rows)],
    "Purchase_Category": [choice(purchase_categories) for _ in range(new_rows)],
    "Referral_Medium": [choice(referral_mediums) for _ in range(new_rows)],
    "Device_Type": [choice(device_types) for _ in range(new_rows)],
    "Cart_Status": [choice(cart_statuses) for _ in range(new_rows)],
}

# Convert to DataFrame
new_df = pd.DataFrame(new_data)

# Merge with the original dataset
full_df = pd.concat([df, new_df], ignore_index=True)

# Save the updated dataset
updated_file_path = "updated_abandonment_dataset.csv"  # Change if needed
full_df.to_csv(updated_file_path, index=False)

print(f"✅ Successfully added {new_rows} new rows! File saved as {updated_file_path}")


# In[ ]:





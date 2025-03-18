import pandas as pd
import random
import string
from datetime import datetime
from collections import defaultdict

# Function to generate CODEXXX format
def generate_code(index):
    return f"CODE{str(index).zfill(3)}"

# Function to generate a 6-character alphanumeric passcode
def generate_passcode(length=6):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

# Dictionary to track duplicate emails
email_count = defaultdict(int)

# Function to format name and generate email
def format_name(full_name, index):
    full_name = full_name.strip().strip('"')  # Remove leading/trailing spaces and quotes

    if ',' not in full_name:
        return None  # Skip invalid entries

    parts = full_name.split(', ')
    surname = parts[0].upper()
    first_middle = parts[1].split()

    # Extract first name and middle initial properly
    first_name = " ".join(first_middle[:-1]).upper()  # All but the last word as first name
    middle_initial = first_middle[-1][0].upper() if len(first_middle) > 1 else ""  # Last word as middle initial

    # Generate email using initials + full surname
    first_initials = "".join([word[0].lower() for word in first_name.split()])
    email_base = f"{first_initials}{middle_initial.lower()}{surname.lower().replace(' ', '')}"
    
    # Handle duplicate emails by appending a counter
    if email_count[email_base] > 0:
        email = f"{email_base}{email_count[email_base]}@pup.edu.ph"
    else:
        email = f"{email_base}@pup.edu.ph"

    email_count[email_base] += 1  # Increment counter for next duplicate

    return [
        generate_code(index), first_name, middle_initial, surname, email, 
        1, "ivote", generate_passcode(), 0, 0, 
        datetime.now().strftime("%Y-%m-%d %H:%M:%S"), 
        datetime.now().strftime("%Y-%m-%d %H:%M:%S"), 
        "NULL"
    ]

# Read input CSV
input_file = "python_automation/unformatted_names_provident.csv"
df = pd.read_csv(input_file, header=None, names=["full_name"], encoding="utf-8", on_bad_lines="skip")

# Format names and generate required fields for tblmember
member_data = [format_name(name, idx + 1) for idx, name in enumerate(df["full_name"]) if format_name(name, idx + 1)]

# Save tblmember.csv
tblmember_file = "python_automation/tblmember.csv"
pd.DataFrame(member_data).to_csv(tblmember_file, index=False, header=False, sep=',', quoting=3, escapechar=' ', lineterminator='\n')

# Generate tblmemberdetail.csv data
member_detail_data = []
for idx, entry in enumerate(member_data, start=1):
    code = entry[0]  # CODEXXX
    member_detail_data.append([idx, code, "area", "PUP"])

# Save tblmemberdetail.csv
tblmemberdetail_file = "python_automation/tblmemberdetail.csv"
pd.DataFrame(member_detail_data).to_csv(tblmemberdetail_file, index=False, header=False, sep=',', quoting=3, escapechar=' ', lineterminator='\n')

print(f"tblmember.csv saved to {tblmember_file}")
print(f"tblmemberdetail.csv saved to {tblmemberdetail_file}")

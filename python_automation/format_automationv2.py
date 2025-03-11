import pandas as pd
import random
import string
from datetime import datetime

# Function to generate CODEXXX format
def generate_code(index):
    return f"CODE{str(index).zfill(3)}"

# Function to generate a 6-character alphanumeric passcode
def generate_passcode(length=6):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

# Function to format name and generate email
def format_name(full_name, index):
    full_name = full_name.strip().strip('"')  # Remove leading/trailing spaces and quotes

    if ',' not in full_name:
        return '', '', '', '', '', '', '', '', '', '', '', '', ''  # Handle unexpected formats

    parts = full_name.split(', ')
    surname = parts[0].upper()
    first_middle = parts[1].split()

    # Handle cases where first name starts with "Ma." (e.g., "Ma. Liza")
    if len(first_middle) > 1 and first_middle[0].lower() == "ma.":
        first_name = f"{first_middle[0].upper()} {first_middle[1].upper()}"
        middle_initial = first_middle[2][0].upper() if len(first_middle) > 2 else ''
    # Handle names with two-word first names (e.g., "May Rose")
    elif len(first_middle) > 2:
        first_name = f"{first_middle[0].upper()} {first_middle[1].upper()}"
        middle_initial = first_middle[2][0].upper()
    else:
        first_name = first_middle[0].upper()
        middle_initial = first_middle[1][0].upper() if len(first_middle) > 1 else ''

    # Generate email using full first name initials
    first_name_initials = ''.join([char.lower() for char in first_name if char.isalpha()])
    email = f"{first_name_initials}{middle_initial.lower()}{surname.lower().replace(' ', '')}@pup.edu.ph"

    return generate_code(index), first_name, middle_initial, surname, email, 1, "ivote", generate_passcode(), 0, 0, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), datetime.now().strftime("%Y-%m-%d %H:%M:%S"), "NULL"

# Read input CSV
input_file = "python_automation/unformatted_names.csv"
df = pd.read_csv(input_file, header=None, names=["full_name"], encoding="utf-8", on_bad_lines="skip")

# Format names and add additional fields
df = pd.DataFrame([format_name(name, idx + 1) for idx, name in enumerate(df["full_name"])],
                  columns=['strMemberId', 'strMemFname', 'strMemMname', 'strMemLname', 'strMemEmail',
                           'intMemSecQuesId', 'strMemSecQuesAnswer', 'strMemPasscode', 'blMemCodeSendStat',
                           'blMemDelete', 'created_at', 'updated_at', 'deleted_at'])

# Save to output CSV without quotes
output_file = "python_automation/formatted_members.csv"
df.to_csv(output_file, index=False, header=False, sep=',', quoting=3, escapechar=' ', lineterminator='\n')

print(f"Formatted names saved to {output_file}")

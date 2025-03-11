import pandas as pd

def format_name(full_name):
    
    full_name = full_name.strip().strip('"')  # Remove leading/trailing spaces and quotes
    
    if ',' not in full_name:
        return '', '', '', ''  # Handle unexpected formats
    
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
    
    # Generate email
    email = f"{first_name[0].lower()}{middle_initial.lower()}{surname.lower().replace(' ', '')}@pup.edu.ph"
    
    return first_name, middle_initial, surname, email

# Read input CSV
input_file = "python_automation/unformatted_names.csv"
df = pd.read_csv(input_file, header=None, names=["full_name"], encoding="utf-8", on_bad_lines="skip")

# Format names
df[['first name', 'middle_initial', 'surname', 'email']] = df['full_name'].apply(lambda x: pd.Series(format_name(x)))
df.drop(columns=['full_name'], inplace=True)

# Save to output CSV
output_file = "python_automation/formatted_names.csv"
df.to_csv(output_file, index=False)

print(f"Formatted names saved to {output_file}")

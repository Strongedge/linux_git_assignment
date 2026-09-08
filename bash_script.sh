#!/bin/bash
# This is a comment. The line above tells the system to use the Bash interpreter.

#===========================================================================================
# Step 1: Environment Setup
#===========================================================================================

# Create project folder if it does not already exist

mkdir linux_git_assignment

echo "Created project directory:linux_git_assignment"

# Change working directory into the project folder

cd linux_git_assignment

echo "Current working directory linux_git_assignment"

# Create a template bash script file inside the project directory
echo '#!/bin/bash' > bash_script.sh
echo "Created executable placeholder: bash_script.sh"

# Create a README markdown file
echo "This is a well-documented process of this assignment." > README.MD
echo "Created documentation file: README.md"

#===========================================================================================
# Step 2:Data Extraction
#===========================================================================================

# Export the target CSV URL as an environment variable

export DATA_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

echo "Environment variable for  URL created as: DATA_URL"

# Create the raw directory

mkdir raw 
echo "Created raw Directory"

# Download the file into the raw directory

curl -O raw/annual-enterprise-survey-2023-financial-year-provisional.csv $DATA_URL
echo "Download completed successfully." 

# List details of the raw directory contents

echo "Contents of raw  directory"
ls raw/

#===========================================================================================
# Step 3: Data Transformation
#===========================================================================================

#Header Standardization

sed -i '' '1s/Variable_code/variable_code/' raw/annual-enterprise-survey-2023-financial-year-provisional.csv
echo "Successfully renamed 'Variable_code' to 'variable_code' in header."

# Create the Transform directory

mkdir Transformed
echo "Created Transform Directory"

# Extract columns year, value, Units, and variable_code using awk

awk -F',' '{print $1 "," $9 "," $5 "," $6}' raw/annual-enterprise-survey-2023-financial-year-provisional.csv > Transformed/2023_year_finance.csv
echo "Columns extracted and saved as 2023_year_finance.csv in Transformed Directory"

# List details of the Transformed directory contents

echo "Contents of raw  directory"
ls Transform/

#===========================================================================================
# Step 4: Load Data
#===========================================================================================

# Create the Gold directory

mkdir Gold
echo "Created Gold Directory"

# Copy transformed file to Gold folder

cp Transformed/2023_year_finance.csv Gold/2023_year_finance.csv
echo "Dataset copied to Gold directory."

# Verify contents of Gold folder

echo "Contents of raw  directory"
ls Gold/

#===========================================================================================
# Step 5: Complete Check
#===========================================================================================

echo "Previewing first 5 rows of Gold layer file:"
head -n 5 Gold/2023_year_finance.csv

echo  "=== Data Pipeline Executed Successfully === "


exit 0

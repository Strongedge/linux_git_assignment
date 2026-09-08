This is a well documented process of this Assignment

Step 1: Environment Setup
#===========================================================================================

#- Create project folder if it does not already exist 

#- Name the folder "linux_git_assignment"

#- Change working directory into the project folder "linux_git_assignment" created

#- Create a template bash script file inside the project directory


#===========================================================================================
Step 2:Data Extraction
#===========================================================================================

#- Export the target CSV URL as an environment variable
#- Create an environment variable for the url https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv



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


0 0 * * * /bin/bash /Users/goke/CDE/linux_git_assignment/bash_script.sh >> /Users/goke/CDE/linux_git_assignment/bash_script.log 2>&1

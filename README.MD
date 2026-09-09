# Linux and Git Project

# You have been hired as a new Data Engineer at CoreDataEngineers. The CoreDataEngineers infrastructure is based on the Linux Operating System. Your manager has tasked you with the responsibility of managing the company’s data infrastructure and version control tool.This is a well documented process of this Assignment

# 1. Your manager has assigned you the task of building a Bash script (use only bash scripting) that performs a simple ETL process:
#       Extract: Download a CSV file. You can access the CSV using this link. Save it into a folder called raw.   Your script should confirm that the file has been saved in the raw folder.

#       Transform: After downloading the file, perform a simple transformation by renaming the column named Variable_code to variable_code. Then, select only the following columns: year, Value, Units, variable_code. Save the content of these selected columns into a file named 2023_year_finance.csv. This file should be saved in a folder called Transformed, your Bash script should confirm that it was loaded into the folder.

#       Load: Load the transformed data into a directory named Gold. Also, confirm that the file has been saved in the folder.

# ===========================================================================================
# Step 1: Environment Setup
# ===========================================================================================

# Create project folder if it does not already exist 

# Name the folder "linux_git_assignment"

mkdir linux_git_assignment
echo "Created project directory:linux_git_assignment"

# Change working directory into the project folder "linux_git_assignment" created.

cd linux_git_assignment
echo "Current working directory linux_git_assignment"

# Create a template bash script file inside the project directory
echo '#!/bin/bash' > bash_script.sh
echo "Created executable placeholder: bash_script.sh"

# Create a README markdown file
echo "This is a well-documented process of this assignment." > README.MD
echo "Created documentation file: README.md"

# ============================================================================================================
# Step 2:Data Extraction- Download CSV file and save into raw folder and and confirm file saved to raw folder
# ============================================================================================================

# Assign the target CSV URL as an environment variable
export DATA_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
echo "Environment variable for  URL created as: DATA_URL"

# Create the raw directory
mkdir raw 
echo "Created raw Directory"

# Create the raw directory
mkdir raw 
echo "Created raw Directory"

# Download the file into the raw directory
curl -O raw/annual-enterprise-survey-2023-financial-year-provisional.csv $DATA_URL
echo "Download completed successfully." 

# List details of the raw directory contents
echo "Contents of raw  directory"
ls raw/

# ==========================================================================================================
# Step 3: Data Transformation- Rename column name Variable_code to variable_code, select columns named year, Value, Units, and variable_code and save as a new file in a folder called Transformed
# ==========================================================================================================

# Header Standardization
sed -i '' '1s/Variable_code/variable_code/' raw/annual-enterprise-survey-2023-financial-year-provisional.csv
echo "Successfully renamed 'Variable_code' to 'variable_code' in header."

# Create the Transform directory
mkdir Transformed
echo "Created Transform Directory"

# Extract columns year, value, Units, and variable_code using awk
# numbers 1, 9, 5 and 6 are the column numbers for year, Value, Units, and variable_code respectively
awk -F',' '{print $1 "," $9 "," $5 "," $6}' raw/annual-enterprise-survey-2023-financial-year-provisional.csv > Transformed/2023_year_finance.csv
echo "Columns extracted and saved as 2023_year_finance.csv in Transformed Directory"

# List details of the Transformed directory contents
echo "Contents of raw  directory"
ls Transform/

# ===========================================================================================
# Step 4: Load Data-  Copy/load transformed dataset into a folder called Gold
# ===========================================================================================

# Create the Gold directory
mkdir Gold
echo "Created Gold Directory"

# Copy transformed file to Gold folder
cp Transformed/2023_year_finance.csv Gold/2023_year_finance.csv
echo "Dataset copied to Gold directory."

# Verify contents of Gold folder
echo "Contents of raw  directory"
ls Gold/

# ===========================================================================================
# Step 5: Complete Check
# ===========================================================================================

echo "Previewing first 5 rows of Gold layer file:"
head -n 5 Gold/2023_year_finance.csv
echo  "=== Data Pipeline Executed Successfully === "

# Exit back to your terminal
exit 0


# 2 Your manager has asked you to schedule the script to run daily using cron jobs (research this). Schedule the script to run every day at 12:00 AM.

#            absolute paths to .sh file     
#                   |
# * * * * * /path/to/script.sh >> /path/to/script.log
# | | | | |                                  |  
# | | | | └─── Day of week (0 - 6)           └---path to output log file to track execution 
# | | | └────── Month (1 - 12)
# | | └──────── Day of month (1 - 31)
# | └────────── Hour (0 - 23)
# └──────────── Minute (0 - 59)

# Cron job for 12am everyday

crontab -e

# paste the code below on the Cron editor

0 0 * * * /bin/bash /Users/goke/CDE/linux_git_assignment/bash_script.sh >> /Users/goke/CDE/linux_git_assignment/bash_script.log 2>&1


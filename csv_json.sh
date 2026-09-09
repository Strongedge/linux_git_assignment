#!/bin/bash

#create a directory for the csv and json file

mkdir csv_json
echo "csv_json directory created"

# move all csv and josn file from myfolder to csv_json folder

mv myfolder/*.csv myfolder/*.json csv_json/ 
echo "All .csv file and .json files successfully moved to csv_json folder"

#exit to terminal

exit 0

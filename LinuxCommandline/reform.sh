#!/usr/bin/bash

# sort the distro names by dates
sort -k 3.7nb -k 3.1nb -k 3.4nb distros.txt >distros_by_date.txt

# separate the names and versions
cut -f 1,2 distros_by_date.txt >distro_names.txt
cut -f 3 distros_by_date.txt   >distro_dates.txt

# insert the dates in the first column
paste distro_dates.txt distro_names.txt

# cleanup 
rm distro_dates.txt distro_names.txt distros_by_date.txt


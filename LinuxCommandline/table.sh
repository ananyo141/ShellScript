#!/usr/bin/bash
# This assumes the distro file is present in cwd
# create the distro_by_date.txt file
sort -k 3.7nb -k 3.1nb -k 3.4nb distros.txt >distro_by_date.txt
cut -f 3 distro_by_date.txt >distro_dates.txt

# create file with distro date and name
cut -f 1 distro_by_date.txt >distro_names.txt
paste distro_dates.txt distro_names.txt >table1.txt

# create file with distro date and version
cut -f 2 distro_by_date.txt >distro_versions.txt
paste distro_dates.txt distro_versions.txt >table2.txt

# join both the file with date as the primary key
join table1.txt table2.txt

# cleanup
rm distro_by_date.txt distro_dates.txt distro_names.txt distro_versions.txt
# optional cleanup
printf "\n"
rm -i table1.txt table2.txt


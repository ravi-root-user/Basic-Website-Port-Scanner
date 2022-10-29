#! /bin/bash

Today=$(date)
echo "Scan Time Stamp :$Today"
echo "Select Scan optoin: "
echo "1. Nornal Scan first 1000 ports "
echo "2. Deep Scan all ports with better results(Can be slower)"
read -p "Enter 1 or 2 " result
directory=$1_results
mkdir $directory
if [[ $result -eq '1' ]]
then
sudo nmap $1 > $directory/nmap
sudo whatweb $1 -v > $directory/what_web_Results

elif [[ $result -eq '2' ]]
then
sudo nmap -p- -Pn -oA $directory/nmap -vv $1 > $directory/nmap
sudo whatweb $1 -v > $directory/what_web_Results
fi

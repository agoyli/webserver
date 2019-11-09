#!/bin/bash

echo "Create website script started"

# Dir
echo "Creating site directory..."

# Database
echo "Do you want create site database? (yes/no)"
read dbbool
if [ "$dbbool" == "yes" ]; then
	echo "Creating database..."
fi

# SSL
echo "Do you want create site ssl? (yes/no)"
read sslbool
if [ "$sslbool" == "yes" ]; then
	echo "Creating ssl..."
fi


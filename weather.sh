#!/bin/bash

# Replace "API_KEY" with your Weather Underground API key
API_KEY=${CUSTOM_WEATHER_WUNDERGROUND_API_KEY}

# Replace "LOCATION" with your location (e.g. "Seattle, WA")
LOCATION=${CUSTOM_WEATHER_LOCATION}

# Set the number of days to forecast (maximum 7)
DAYS=${CUSTOM_WEATHER_DAYS}

# Get the forecast data from Weather Underground
FORECAST=$(curl -s "https://api.wunderground.com/api/${API_KEY}/forecast10day/q/${LOCATION}.json")

#Loop through each day and print the date and forecast
for ((i=0; i<DAYS; i++)); do
  DATE=$(echo "$FORECAST" | jq -r ".forecast.txt_forecast.forecastday[$i].title")
  SUMMARY=$(echo "$FORECAST" | jq -r ".forecast.txt_forecast.forecastday[$i].fcttext")
  echo "$DATE: $SUMMARY"
done

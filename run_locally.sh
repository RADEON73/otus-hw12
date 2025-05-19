#!/bin/sh
BINARY_HOME=./bin
INPUT_HOME=./input
INPUT=${INPUT_HOME}/AB_NYC_2019.csv

echo "Calculating average price..."
cat ${INPUT} | ${BINARY_HOME}/mapper_avg | sort -k1 | ${BINARY_HOME}/reducer_avg > output_avg
cat output_avg

echo -e "\nCalculating price variance..."
cat ${INPUT} | ${BINARY_HOME}/mapper_var | sort -k1 | ${BINARY_HOME}/reducer_var > output_var
cat output_var

# Ожидание ввода пользователя перед закрытием
read -p "Press Enter to continue..."
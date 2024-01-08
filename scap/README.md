# SCAP Results Parser

## Overview
This is an experiment with ChatGPT to develop a script that could parse SCAP xml results from a RHEL STIG scan using OpenSCAP.

This Python script is designed to parse Security Content Automation Protocol (SCAP) results from XML files and convert them into a user-friendly Excel format. It is particularly useful for cybersecurity professionals and system administrators who work with SCAP compliance data, especially for systems like RHEL (Red Hat Enterprise Linux).

## Features
- Parses SCAP results from XML files.
- Generates an Excel spreadsheet with detailed findings.
- User-friendly interface for specifying input and output files.

## Requirements
- Python 3
- openpyxl library
- xml.etree.ElementTree library

## Installation
1. Ensure Python 3 is installed on your system.
2. Install `openpyxl` using pip:

pip install openpyxl

## Usage
1. Run the script:

2. Enter the path to the SCAP results XML file when prompted.
3. Enter the desired name for the output Excel file.

## Output
The script will generate an Excel file with the following columns:
- ID Reference
- Result
- Time
- Severity
- Title
- Description
- Warning
- Reference
- Rationale
- Fix

## Author
Brian Moore and ChatGPT


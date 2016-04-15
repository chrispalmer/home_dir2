#!/usr/bin/env python

import csv
import sys


tabin = csv.reader(sys.stdin, dialect=csv.excel_tab, quoting=csv.QUOTE_NONE)
commaout = csv.writer(sys.stdout, dialect=csv.excel)

for row in tabin:
	commaout.writerow(row)

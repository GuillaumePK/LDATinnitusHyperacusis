import json
import csv

with open('./TT15bnoname/lda.json') as data_file:
	lda_data = json.load(data_file)

terms = lda_data['tinfo']['Term']
freqs = lda_data['tinfo']['Total']

with open('word_count.tsv', 'wb') as tsvfile:
	writer = csv.writer(tsvfile, delimiter='\t', lineterminator = '\n',)
	writer.writerow(['term', 'freq'])
	for i,term in enumerate(terms):
		row = [term, freqs[i]]
		print row
		writer.writerow(row)

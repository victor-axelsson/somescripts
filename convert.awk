awk -F"," '
{
	for(i = 1; i <= NF; i++){
		gsub( "\x27","", $i);
		gsub( "\x22","", $i);
		gsub( "\x60","", $i);	
	}

	tag=tolower($1);
	gsub(/ /, "_", tag);
	gsub( "\x22","\x27", tag);
	
	print "INSERT IGNORE INTO autocomplete_healthcare (tag, name, ivo, kommun, lan, org_nr, huvudman, verksamhets_plats, adress) VALUES(\x27"tag "\x27, \x27" $1 "\x27, \x27" $2 "\x27, \x27" $3 "\x27, \x27" $4 "\x27, \x27" $5 "\x27, \x27" $6 "\x27, \x27" $7 "\x27, \x27" $8 "\x27);"
}' IVO_Verksamheter_2016-02-09_copy.csv

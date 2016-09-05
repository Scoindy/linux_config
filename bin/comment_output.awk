#!/usr/bin/nawk -f 
# to run cat x.sql | xx > y.sql

BEGIN { 
  FS=" "
}
{
  while (getline < "x.sql" > 0) {
    FOUND=0
    if (index($0, "output") > 0) {
      if (index($0, ")") > 0 ) {
        print "/*\n"$0"\n*/\n"
      }
      else {
        print "/*\n"$0
        while ( FOUND == 0 ) {
          getline < "x.sql"
          if ( index($0, ")") > 0) {
            print $0"\n*/\n"
            FOUND=1
          }
          else
            print $0
        }
      }
    }
    else
      print $0
  }
  exit
}

#!/usr/bin/nawk -f 

BEGIN { FS=" " }
{
   if ($1 == "RETURN" && substr($2, 16, 10) == "vip_return") {
     POS=index($0, "RETURN")
     SPACE=substr($0, 1, POS - 1)
     if (substr($3, 1, 1) == "(" ) 
       TMP=$3" "$4" "$5
     else
       TMP=$3

     sub(/\)/,"",TMP)
     print SPACE$1" "TMP
   }
   else 
     print $0
}

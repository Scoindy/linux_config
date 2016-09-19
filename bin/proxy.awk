#!/usr/bin/awk -f

BEGIN { FS=" " }
{
  out="";
  for (i=1; i<=NF; i++) {
    if (i == 3 && $i != "proxy") {
      out=out"|proxy|"$i
      i++
    }
    else if (i < 6) 
      out=out"|"$i
    else
      out=out" "$i
  }; 
  print out
} 

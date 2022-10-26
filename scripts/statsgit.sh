for d in */;
do
      echo $d
     ( cd $d && git shortlog -s -n --all )
     echo
done

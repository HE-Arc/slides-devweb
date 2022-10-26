TOKEN=MYOWNPRIVATETOKEN
# Gener8 here : https://github.com/settings/tokens


cat repos.txt | while read LINE
do
  BASE="https://api.github.com/repos/HE-Arc/$LINE"

  rm -f $LINE-final.txt
  
  echo $LINE >> $LINE-final.txt
  echo "###########" >> $LINE-final.txt

  echo "ISSUES AUTHORS" >> $LINE-final.txt
  curl -H "Authorization: token $TOKEN" "$BASE/issues?state=all&filter=all&per_page=100" | jq -r '.[].user.login' > $LINE-il.txt
  sort $LINE-il.txt | uniq -c | sort -nr >> $LINE-final.txt  
  echo  >> $LINE-final.txt

  echo "ISSUES ASSIGNEE" >> $LINE-final.txt
  curl  -H "Authorization: token $TOKEN" "$BASE/issues?state=all&filter=all&per_page=100" | jq -r '.[].assignee.login' > $LINE-ia.txt
  sort $LINE-ia.txt | uniq -c | sort -nr >> $LINE-final.txt  
  echo >> $LINE-final.txt

  echo "ISSUES ASSIGNEES" >> $LINE-final.txt
  curl  -H "Authorization: token $TOKEN" "$BASE/issues?state=all&filter=all&per_page=100" | jq -r '.[].assignees[].login' > $LINE-ias.txt
  sort $LINE-ias.txt | uniq -c | sort -nr >> $LINE-final.txt  
  echo >> $LINE-final.txt

  echo "ISSUES COMMENTS" >> $LINE-final.txt
  curl  -H "Authorization: token $TOKEN" "$BASE/issues/comments?state=all&filter=all&per_page=100" | jq -r '.[] | {auth: .user.login, body: .body} | [.auth, .body] | @csv' > $LINE-ic.txt
  sed -i "s/\",/: /g" $LINE-ic.txt
  sed -i "s/\"//g" $LINE-ic.txt
  cat $LINE-ic.txt >> $LINE-final.txt  
  echo >> $LINE-final.txt

  echo "REPO COMMENTS" >> $LINE-final.txt
  curl  -H "Authorization: token $TOKEN" "$BASE/comments?state=all&filter=all&per_page=100" | jq -r '.[] | {auth: .user.login, body: .body} | [.auth, .body] | @csv' > $LINE-rc.txt
  sed -i "s/\",/: /g" $LINE-rc.txt
  sed -i "s/\"//g" $LINE-rc.txt
  cat $LINE-rc.txt >> $LINE-final.txt  
  echo >> $LINE-final.txt

#  echo "----------" >> $LINE-final.txt
  echo "PROJECTS" >> $LINE-final.txt
  curl  -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.inertia-preview+json, */*" "$BASE/projects?state=all&filter=all&per_page=100" | jq -r '.[].name' >> $LINE-final.txt
  echo >> $LINE-final.txt

#  echo "EVENTS" >> $LINE-final.txt
#  curl  -H "Authorization: token $TOKEN" "$BASE/events?state=all&filter=all&per_page=100" | jq -r '.[] | {aut: .actor.login, type: .type} | [.aut, .type] | @csv' > $LINE-ev.txt
#  sed -i "s/\",/: /g" $LINE-ev.txt
#  sed -i "s/\"//g" $LINE-ev.txt
#  cat $LINE-ev.txt >> $LINE-final.txt  

done

rm *-il.txt *-ia.txt *-ev.txt *-ias.txt *-ic.txt *-rc.txt

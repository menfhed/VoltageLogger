#!/bin/bash

define CONTROL_COUNT=60

# Counting current process
counting_passengers_prosess() {
  echo "(ps aux | grep -i passenger | wc -l)"
}

# Controling hunging proccess
checking_killing_procsess() {
  count_process=$(counting_passengers_prosess)
  while [ "$count_process" -ge 5 ]; do
    printing_info "wait kill" &&  sleep 5
    count_process=$(counting_passengers_prosess)
  done
}

# Restaring NGINX with controling
restarting_nginx() {
    sudo /opt/nginx/sbin/nginx -s stop
    checking_killing_procsess
    sleep 1
    sudo /opt/nginx/sbin/nginx
}

# In case of exceeding the maximum number, restart nginx
checking_passenger_limits() {
  count=$(counting_passengers_prosess)

  if [ "$count" -ge "$CONTROL_COUNT" ]; then
    restarting_nginx
    exit 1
  else
    exit 0
  fi
}

# Checking number of passenger process

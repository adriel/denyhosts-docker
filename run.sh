#! /usr/bin/env sh
set -eu
set -o pipefail

PID_FILE='/var/run/denyhosts.pid'

touch /var/log/denyhosts
tail -f -n 0 /var/log/denyhosts &

# Make sure the pid file isn't left over from a previous crashed instance
if [ -f "$PID_FILE" ]; then
  echo 'Removing old PID file.'
  rm -r "$PID_FILE"
fi

exec python /usr/bin/denyhosts.py --config /etc/denyhosts.conf --noemail --sync --foreground

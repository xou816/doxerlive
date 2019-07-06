#!/bin/ash
USER_ID=${THEUID:-1000}
echo "Starting with UID $USER_ID"
adduser -D -u $USER_ID user
chown -R user: /usr/local/texlive
su-exec user "$@"

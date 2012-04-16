#!/bin/bash
logger -p security.notice "Logged in $1 $2"
if [[ $SSH_ORIGINAL_COMMAND = "" ]];
then
  bash
else
  logger -p security.notice "Running $SSH_ORIGINAL_COMMAND"
  $SSH_ORIGINAL_COMMAND
fi

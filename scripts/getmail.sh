#!/usr/bin/env bash

mbsync -a && notmuch new && /home/robin/.local/bin/notifymuch

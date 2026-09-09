#!/bin/bash

if [ ! -d "/Applications/Google Chrome.app" ]; then
    jamf policy -event installChrome
fi
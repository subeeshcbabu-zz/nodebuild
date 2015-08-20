#!/bin/bash
# The script to run nodejs builds on docker 
# 
# Exit codes
# 1 : NPM install failed
# 2 : NPM test failed
#

#
# Define utils here
#
#
# Logger util 
function log () {
        if [ -z "$1" ]; then
                echo ""
        else
                echo "$(date +"%m-%d-%Y-%T") $1"
                if [ ! -z "$LOG_FILE" ]; then
                        echo "$(date +"%m-%d-%Y-%T") $1" >> $LOG_FILE
                fi
        fi
}

log "	********************************************************************************************"
log " "
log "	Starting the nodejs build on container "
log " "
log "	Node Version: " 
node -v
log "	NPM Version: "
npm -v

# Configuration for NPM

# NPM Install
npm install 
RC=$?
if [ $RC != 0 ]; then
	log "	NPM install failed."
	exit 1
fi

log "	Executing npm test"
npm test
if [ $RC != 0 ]; then
        log "   NPM test failed."
	exit 2
fi

log "	Executing npm run-script cover"
npm run-script cover

log "	"
log "   ********************************************************************************************"
exit 0


# MC-Server Terminal Tools
Original Source code and credits: https://github.com/kompetenzbolzen/minecraft-server-tools by Jonas Gunz 

## Platform Compatability
Tested on Ubuntu 18.04

Platform: AWS

## Setup & How to use

Please refer to https://github.com/ordz-404/MC-server-terminal-tools/blob/ordz-404-patch-1/how-to-setup.md for how to set up.

Please refer to https://github.com/ordz-404/MC-server-terminal-tools/blob/ordz-404-patch-1/how-to-use.md on param usages. 

## Patch Notes 1.02 - 08/24/2020

File - Server.sh

* function players_online has been totally re-written to check_players. Function will obtain the player count from the minecraft server. A failsafe is also put in place. Should the server not respond within 3 attemps, the process will abort to prevent perpetual loop wait cycle. After obtaining the player count, function will return true / false. 

* function server_backup_safe has been re-written. Function will check for existing players on server. If server is populated, backup will abort unless the force switch is used. To help the minecraft server log the backup process, the function will broadcast within the server a 3 second countdown before the backup process starts. Upon completion, a final broadcast message will be sent into the server informing of a successful backup. (This will be useful when the server is still populated with players. 

* function create_backup_archive has updated. Function will check for existing "backups" folder within the minecraft path. This ensures a writable folder for the archives to be stored in. Tar settings have been updated to add verbose output from the terminal. ( This is to see the progress of the backup happening and force manual a termination if there is an error ) 

* Added a switch `isempty` to ping the server for player count. 

## Patch Notes 1.01 - 08/23/2020

File - Server.sh

* cd $(dirname $0) sets the current folder server.sh file resides in as the root folder. This enables the code to be executed outside the root residing folder, resolving the issue of the minecraft service not starting up.

File - Serverconf.sh

* The file has been tidied up for easier referencing. All main setup parameters have been separated under the `Server Config Params` section in the config file.

File - minecraft.service

* This file has been simplifed and modified to run with this current version (branch) of this code. The original file has been moved to the "old_source" sub directory.

## Disclaimer

The scripts are provided as-is at no warranty.
They are in no way idiot-proof.

Improvements are welcome.

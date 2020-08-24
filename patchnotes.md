# MC-Server Terminal Tools
Original Source code and credits: https://github.com/kompetenzbolzen/minecraft-server-tools by Jonas Gunz 

## Platform Compatability
Tested on Ubuntu 18.04

Platform: AWS

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

## Setup & Configuration Parameters

Please open up the serverconf.sh to complete the setup. The only main four parameters you need to configure are specified below.

`JVM_ARGS="-Xms1024M -Xmx1024M"`

`JAR="insert_server_excutable_name.jar"`

`JAR_ARGS="-nogui"`

`WORLD_NAME="insert_world_name"`


## Usage Parameters

`./server.sh start|stop|attach|status|backup`

### start

Creates a terminal multiplxer (tmux is different from screen) session and starts a minecraft server within.
If a current instance is already running, the server will indicate. 

### stop

Sends `stop` command to running minecraft server instance to safely shut down.

### attach

Re attaches to a TMUX screen session if the server is running. To exit, press `CTRL + B ` together follwed by `b` key.

### status

lists active screen sessions with `SCREEN_SESSIONNAME`.

### backup

Backs up the world as a `tar.gz` archive in `./backup/`.
If a running server is detected,
the world is flushed to disk and autosave is disabled temporarily to prevent chunk corruption.

The command specified in `$BACKUP_HOOK` is
executed on every successful backup. `$ARCHNAME` contains the relative path to the archive.
This can be used to further process the created backup.

## Start automatically

Create user and group `minecraft` with home in `/var/minecraft`.
Populate the directory with server.sh and a server jar.
Place `minecraft.service` in `/etc/systemd/system/`
and run `systemctl start minecraft` to start once or
`systemctl enable minecraft` to enable autostarting.

To backup automatically, place or symlink `mc-backup.service` and
`mc-backup.timer` in `/etc/systemd/system/`. Run the following:

```
sudo systemctl  enable mc-backup.timer
sudo sytemctl start mc-backup.timer
```

This wil start the enable the timer upon startup and start the timer
to run the backup after every interval specified in mc-backup.timer.

## Disclaimer

The scripts are provided as-is at no warranty.
They are in no way idiot-proof.

Improvements are welcome.

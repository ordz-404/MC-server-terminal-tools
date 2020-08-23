# serverconf.sh
# Config file for server.sh executable
# management script

#JRE-RUNTIME
JRE_JAVA="java"

#Server Config Params
JAR="insert-minecraft-server-executable-name.jar"
JVM_ARGS="-Xms1024M -Xmx1024M" 
JAR_ARGS="-nogui"
WORLD_NAME="insert-world-name"

#TMUX - Terminal Multipliexer settings
TMUX_WINDOW="minecraft"
TMUX_SOCKET="mc_tmux_socket"
PIDFILE="minecraft-session.pid"

#Backup Settings
BACKUP_NAME="${WORLD_NAME}_backup"
LOGFILE="logs/latest.log"
USE_BUP="NO"

#Constants
CUR_YEAR=`date +"%Y"`

#!/bin/sh
# AS_EVSLocalAlertNotify.sh
#
# Please Open with UltraEdit-32 or VI
#release 0.1 2010-4-23
#debug
#AS_HOSTNAME=192.168.2.54
#AS_PARAMETER_VALUE=2
#AS_DATE="2010-4-22"
#AS_TIME="10:10:00"
#AS_ALARM_MAX="44"
#AS_ALARM_MIN="66"
#AS_NOTIFICATION_FILE=patrol
#AS_NOTIFICATION_TYPE=custom
#AS_APPINSTANCE=notepad_argument_32222
#AS_PARAMETER=InstanceStatus
#AS_APPCLASS=ORACLE_AVAILABILITY
#AS_PARAMETER_STATUS=ALARM
#debug 
ADDEXTEVENT=/opt/bmc/patrol/extevent
occurtime=$AS_DATE"_"$AS_TIME
AS_DEBUG=0
EVENT_LOG=$ADDEXTEVENT/log/${AS_HOSTNAME}-${AS_PARAMETER}.log
#echo AddExtEvent.sh $AS_HOSTNAME $AS_APPINSTANCE $AS_PARAMETER $AS_APPCLASS $AS_PARAMETER_STATUS $AS_PARAMETER_VALUE $AS_ALARM_MAX $AS_ALARM_MIN $occurtime >> $PATROL_EVENT/allevent.log 

echo "=======================SOURCE=============================="      >>$EVENT_LOG
date >>$EVENT_LOG
echo "SOURCE:AS_APPCLASS          = $AS_APPCLASS"               	>>$EVENT_LOG
echo "SOURCE:AS_APPINSTANCE       = $AS_APPINSTANCE"            	>>$EVENT_LOG
echo "SOURCE:AS_PARENT_INSTANCE   = $AS_PARENT_INSTANCE"        	>>$EVENT_LOG
echo "SOURCE:AS_PARAMETER         = $AS_PARAMETER"              	>>$EVENT_LOG
echo "SOURCE:AS_PARAMETER_STATUS  = $AS_PARAMETER_STATUS"       	>>$EVENT_LOG
echo "SOURCE:AS_PARAMETER_VALUE   = $AS_PARAMETER_VALUE"        	>>$EVENT_LOG
echo "=======================SOURCE=============================="      >>$EVENT_LOG

# Unix change AS_PARAMETER_STATUS:ALARM
if [ "$AS_PARAMETER_STATUS" = "ALARM" ] ;then
		AS_PARAMETER_STATUS="MINOR"
#Unix    
		if [ "$AS_PARAMETER" = "CPUCpuUtil" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "FSInodeUsedPercent" ] ;then 
			AS_PARAMETER_STATUS="MINOR"
		fi
		if [ "$AS_PARAMETER" = "FSCapacity" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "SWPTotSwapUsedPercent" ] ;then 
			 AS_PARAMETER_STATUS="MAJOR"
		fi 
		if [ "$AS_PARAMETER" = "PROCNoZombies" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "PROCNumProcs" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "ERRPremHard" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "LOGSearchString" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "nfile" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "nproc" ] ;then
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "inode" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "PackageState" ] ;then
    	AS_PARAMETER_STATUS="MAJOR"
    fi
		if [ "$AS_PARAMETER" = "pingAvailability" ] ;then
    	AS_PARAMETER_STATUS="MAJOR"
    fi
## AS400 OS400 iSeries
		if [ "$AS_PARAMETER" = "CPU_Util" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "Tot_ASP_Stg_Used" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "CriticalPrb" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
## Windows
		if [ "$AS_PARAMETER" = "ProcessorUtilization" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
			fi
		if [ "$AS_PARAMETER" = "MemoryUsage" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi
		if [ "$AS_PARAMETER" = "PROCStatus" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi
		if [ "$AS_PARAMETER" = "LDldFreeSpacePercent" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi		
		if [ "$AS_PARAMETER" = "LDldFreeMegabytes" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi
## DB

##informix oracle db2 sybase mssqlserver
  if [ "$AS_APPCLASS" = "ORACLE_AVAILABILITY" ] ;then
		if [ "$AS_PARAMETER" = "InstanceStatus" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
  fi
		if [ "$AS_PARAMETER" = "ListenerStatus" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "_AbnormalTranxLogUse" ] ;then 
			AS_PARAMETER_STATUS="MINOR"
		fi  
		if [ "$AS_PARAMETER" = "_PanicStopState" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi  
		if [ "$AS_PARAMETER" = "_DBLongTXState" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi   
		if [ "$AS_PARAMETER" = "_DBLogicLogBackupState" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi  	
		if [ "$AS_PARAMETER" = "AbnomalChunkNum" ] ;then 
			AS_PARAMETER_STATUS="MAJOR"
		fi 
		if [ "$AS_PARAMETER" = "DB2ServerOK" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
		fi 
		if [ "$AS_PARAMETER" = "ASE_Status" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
		fi 
		if [ "$AS_PARAMETER" = "BackupServerStatus" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "ConnectionsAvailable" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
		if [ "$AS_PARAMETER" = "ConnectionsRemaining" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
		fi
			if [ "$AS_PARAMETER" = "DatabaseSpaceUsedPCT" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
		fi 			
			if [ "$AS_PARAMETER" = "LogSpaceUsedPCT" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi 			
			if [ "$AS_PARAMETER" = "SQLServerStatus" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi 			
			if [ "$AS_PARAMETER" = "LongRunningTrans" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi 	
			
####weblogic tuxedo webapplicationAS
		if [ "$AS_PARAMETER" = "HealthStatus" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi 	
	  if [ "$AS_PARAMETER" = "FailuresToReconnectCount" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi 	
		if [ "$AS_PARAMETER" = "ServerStatus" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi 	
		if [ "$AS_PARAMETER" = "AppServerAvailability" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi 	
		if [ "$AS_PARAMETER" = "DMgrAvailability" ] ; then 
			AS_PARAMETER_STATUS="MINOR"
		fi
		if [ "$AS_PARAMETER" = "NodeAgentAvailability" ] ; then 
			AS_PARAMETER_STATUS="MINOR"
			fi 	
		if [ "$AS_PARAMETER" = "PercentUsed" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi 	
		if [ "$AS_PARAMETER" = "PercentMemoryUsed" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi
		if [ "$AS_PARAMETER" = "Availability" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi
		if [ "$AS_PARAMETER" = "Benchmark" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi
		if [ "$AS_PARAMETER" = "InDoubtStatus" ] ; then 
			AS_PARAMETER_STATUS="MAJOR"
			fi
			
fi

############WARN############Warn########WARN##################
# change AS_PARAMETER_STATUS:Warn
if [ "$AS_PARAMETER_STATUS" = "WARN" ] ;then
    if [ "$AS_PARAMETER" = "FSCapacity" ];then
     AS_PARAMETER_STATUS="MINOR"
    fi 
	if [ "$AS_PARAMETER" = "LDldFreeMegabytes" ];then
     AS_PARAMETER_STATUS="MINOR"
	fi
	if [ "$AS_PARAMETER" = "NETInErrPrc" ];then
     AS_PARAMETER_STATUS="MINOR"
	fi
	if [ "$AS_PARAMETER" = "NETOutErrPrc" ];then
     AS_PARAMETER_STATUS="MINOR"
	fi
	if [ "$AS_PARAMETER" = "Tot_ASP_Stg_Used" ] ;then
		AS_PARAMETER_STATUS="MINOR"
	fi
	if [ "$AS_PARAMETER" = "_PanicStopState" ] ;then
			AS_PARAMETER_STATUS="MINOR"
	fi	
	if [ "$AS_APPCLASS" = "MSSQL_SERVER_DB" ] ;then
			AS_PARAMETER_STATUS="MINOR"
	fi
	if [ "$AS_PARAMETER" = "LogMonitor" ] ;then
			AS_PARAMETER_STATUS="MINOR"
	fi
	if [ "$AS_PARAMETER" = "ServerState" ] ;then
			AS_PARAMETER_STATUS="MINOR"
	fi
	if [ "$AS_PARAMETER" = "QGetStatus" ] ;then
			AS_PARAMETER_STATUS="MINOR"
	fi
	if [ "$AS_PARAMETER" = "QPutStatus" ] ;then
			AS_PARAMETER_STATUS="MINOR"
	fi
	if [ "$AS_PARAMETER" = "QPercentFull" ] ;then
			AS_PARAMETER_STATUS="MINOR"
	fi
	if [ "$AS_PARAMETER" = "Benchmark" ] ;then
			AS_PARAMETER_STATUS="MINOR"
	fi
fi

## Change AS_PARAMETER_VALUE
if [ "$AS_APPCLASS" = "IFMXDS_AVAILABILITY" ] ; then
      if [ "$AS_PARAMETER_VALUE" = "1" ] ; then  
            AS_PARAMETER_VALUE="Quiescent_Mode"
            exit 1
      fi
      if [ "$AS_PARAMETER_VALUE" = "2" ] ; then 
            AS_PARAMETER_VALUE="System_crashes"
      fi
fi

if [ "$AS_PARAMETER" = "_DBRunningState" ] ; then
      if [ "$AS_PARAMETER_VALUE" = "1" ] ; then  
            AS_PARAMETER_VALUE="Instance_shutdown"
      fi
      if [ "$AS_PARAMETER_VALUE" = "2" ] ; then 
            AS_PARAMETER_VALUE="Long_time_transactions"
      fi
fi

if [ "$AS_PARAMETER" = "FSMountStatus" ] ; then
     	  if [ "$AS_PARAMETER_VALUE" = "1" ] ; then 
     	  	AS_PARAMETER_VALUE="Unmounted"
     	  fi
    	  if [ "$AS_PARAMETER_VALUE" = "2" ] ; then
    	  	AS_PARAMETER_VALUE="Unknown"
    	  fi
fi	
if [ "$AS_PARAMETER" = "ConnectionStatus" ] ; then
	if [ "$AS_PARAMETER_VALUE" = "1" ] ; then 
		AS_PARAMETER_VALUE="OK"
	fi
	if [ "$AS_PARAMETER_VALUE" = "2" ] ; then 
		AS_PARAMETER_VALUE="Suspend"
  fi
	if [ "$AS_PARAMETER_VALUE" = "4" ] ; then  
		AS_PARAMETER_VALUE="Offline"
  fi
fi

if [ "$AS_PARAMETER" = "LOGStatus" ] ; then
	case $AS_PARAMETER_VALUE in
		0) AS_PARAMETER_VALUE="missing_or_unknown"
		;;
		1) AS_PARAMETER_VALUE="ok"
		;;
		2) AS_PARAMETER_VALUE="modified"
		;;
		3) AS_PARAMETER_VALUE="read_error"
		;;
		4) AS_PARAMETER_VALUE="inactive"
		;;
		5) AS_PARAMETER_VALUE="missing_message_error"
		esac
  fi
if [ "$AS_PARAMETER" = "HealthStatus" ] ; then
	if [ "$AS_PARAMETER_VALUE" = "1" ] ; then 
		AS_PARAMETER_VALUE="WARN"
		fi
	if [ "$AS_PARAMETER_VALUE" = "2" ] ; then
		AS_PARAMETER_VALUE="CRITICAL"
		fi
  if [ "$AS_PARAMETER_VALUE" = "3" ] ; then
		AS_PARAMETER_VALUE="FAILED_or_UNKNOWN"
		fi
fi

if [ "$AS_PARAMETER" = "PoolState" ] ; then
	if [ "$AS_PARAMETER_VALUE" = "1" ] ; then
	       	AS_PARAMETER_VALUE="suspended_or_shutdown"
       		fi
	if [ "$AS_PARAMETER_VALUE" = "2" ] ; then
	       	AS_PARAMETER_VALUE="unknown"
		fi
	if [ "$AS_PARAMETER_VALUE" = "3" ] ; then
        	AS_PARAMETER_VALUE="unhealthy"
		fi  	       
  fi
if [ "$AS_PARAMETER" = "QueueStatus" ] ; then
	if [ "$AS_PARAMETER_VALUE" = "1" ] ; then
		AS_PARAMETER_VsALUE="OK"
	fi
	if [ "$AS_PARAMETER_VALUE" = "2" ] ; then	
	  AS_PARAMETER_VALUE="unhealthy"
	fi
fi

if [ "$AS_PARAMETER" = "ServiceStatus" ] ; then
	case $AS_PARAMETER_VALUE in
		1) AS_PARAMETER_VALUE="start_pending(1st)"
		;;
		2) AS_PARAMETER_VALUE="stop_pending(1st)"
		;;
		3) AS_PARAMETER_VALUE="pause_pending(1st)"
		;;
		4) AS_PARAMETER_VALUE="continue_pending(1st)"
		;;
		5) AS_PARAMETER_VALUE="pause"
		;;
		6) AS_PARAMETER_VALUE="stop_pending"
		;;
		7) AS_PARAMETER_VALUE="start_pending"
		;;
		8) AS_PARAMETER_VALUE="pause_pending"
		;;
		9) AS_PARAMETER_VALUE="continue_pending"
		;;
		10) AS_PARAMETER_VALUE="stopped"
		;;
		11) 	AS_PARAMETER_VALUE="status_unknown"
		esac
fi
####Sybase#######
if [ "$AS_PARAMETER" = "ASE_Status" ] ; then
      if [ "$AS_PARAMETER_VALUE" = "1" ] ; then
            AS_PARAMETER_VALUE="Down"
      fi
fi 
####
#####NT_PROCESS_STATUS TRANSLATE###
   if [ "$AS_PARAMETER" = "PROCStatus" ] ; then
      if [ "$AS_PARAMETER_VALUE" = "1" ] ; then
            AS_PARAMETER_VALUE="Down"   
          fi
   fi
#########
#call AddExtEvent.sh
$ADDEXTEVENT/AddExtEvent.sh  $AS_HOSTNAME $AS_APPINSTANCE $AS_PARAMETER $AS_APPCLASS $AS_PARAMETER_STATUS $AS_PARAMETER_VALUE $AS_ALARM_MAX $AS_ALARM_MIN $occurtime >> $EVENT_LOG 
rv=$?
# exit 0




# Copyright (c) 2002,2003 BMC Software, Inc.
# Copyright (c) 2000,2001 AgentSpring, Inc.
#
#----------------------------------------------------------------------------
# Change History
#----------------------------------------------------------------------------
# Date: 01-Oct-2002 Dave Gerhard, BMC Software, Inc.
# Added new AS environment variables:
#	AS_AGENT_VERSION
#	AS_PATROL_HOME
#	AS_EVENT_CATALOG
#	AS_EVENT_CLASS
#	AS_EVENT_STATUS
#	AS_EVENT_SEVERITY
#	AS_EVENT_TYPE
#
# Date: 18-Mar-2002 Dave Gerhard, BMC Software, Inc.
# Placed additional quotes around $nmsg variable when piping to sed.
#
# Date: 26-Nov-2001 Dave Gerhard
# Email notifications now provided useful info as part of the email body.
# Made exit_status changes to support EVS IM.
# Added procedure to get (via FTP) the notiication file generated on 
# a remote agent system from the output of a recovery action.
# Added new AS_ environment variables.
#
# Date: 30-Apr-2001 Dave Gerhard
# Included all EventSpring message replacement variables as env. vars.
#
# Date: 26-Jan-2001 Dave Gerhard
# Changed 'popup' notification type to 'custom'.
#
# Date: 19-May-2000 Dave Gerhard, AgentSpring, Inc.
# Added $AS_NOTIFY_EVENT_ID, $AS_EVENT_TYPE, $AS_EVENT_STATUS 
# $AS_TCP_PORT, and $AS_UDP_PORT env. variables.
# Renamed other env. variables.
#
# Date: 25-Aug-99 Dave Gerhard, (dwg,gci)
# Renamed script.
#
# Date: 01-Jan-99 Dave Gerhard, (dwg,gci)
# Added 'popup' notification type to script. Misc cleanup.
#----------------------------------------------------------------------------
#
# Script to perform alert notification (Notification Command).
#
# Usage:
#   AS_EVSLocalAlertNotify.sh {email|page|custom|tt} targets message [ email_file ]
# -or-
#   AS_EVSLocalAlertNotify.sh
#
# This script is coded to accept input from the command line or
# from the environment. If command-line args are passed and equivalent
# environment variables set, the environment variables are used.
#
# Exit Status and the AS_EVENTSPRING KM:
# --------------------------------------
#
# Exit Status    Meaning
# -----------    -----------------------------------------------------------
#     0          Everything went ok
#     1          Missing information (e.g., notification type) so this
#                script is unable to process the event.
#     2          Received errors sending notification (e.g., email, page)
#
# The exit status of this script is used by the EVENTSPRING KM and the
# EVENTSPRING IM to determine success or failure of the intended 
# notification. An exit status of >0 is assumed to indicate an error 
# condition. The value of the 'AS_EVENTSPRING.NotifyEvents' parameter 
# will be set to negative and the parameter annotation will display 
# the exit status.
#
# The EVENTSPRING IM will treat an exit status of 1 as a 'bad'
# event (can not process due to missing info) and an exit status
# of 2 as a notification system failure (e.g., email system down)
# 
#
#------------------------------------------------
# Command line arguments are expected as follows:
#------------------------------------------------
# $1 = notification method
# $2 = targets (comma separated: "target1,target2,etc.")
# $3 = message (single line text message
# $4 = optional file containing alert information to be emailed, or?
#
#----------------------------------------------------------------------------
# Environment Variables provided by EVENTSPRING.NOTIFY_EVENT are as follows:
#----------------------------------------------------------------------------
#  PATROL_HOME
# 	PATROL_HOME of agent running this script (e.g., /usr/patrol/PATROL3-4)
#
#  AS_HOSTNAME
# 	Hostname of system initiating alert
#
#  AS_IPADDRESS
# 	IP Address of system initiating alert
#
#  AS_TCP_PORT
#	TCP port number of the alerting agent (e.g, 3181)
#
#  AS_UDP_PORT
#	UDP port number of the alerting agent (e.g, 3181)
#
#  AS_APPCLASS
# 	Application class of alerting object. (e.g., FILESYSTEM)
#
#  AS_APPINSTANCE
# 	Application instance of alerting object. (e.g., root)
#
#  AS_ICON_NAME
#	Instance icon name (e.g., root)
#
#  AS_PARENT_INSTANCE
#	Parent name of AS_APPINSTANCE
#		(e.g., /NT_PROCESS_CONTAINER/NT_PROCESS_CONTAINER)
#
#  AS_PARAMETER
# 	Parameter name of alerting object. (e.g., FSCapacity)
#
#  AS_PARAMETER_STATUS
# 	Parameter status of alerting object. (e.g., OK, WARNING, ALARM)
#
#  AS_PARAMETER_VALUE
# 	Parameter value of alerting object. (e.g., 10)
#
#  AS_DATE
#	Date alert occurred. (Local time: MM/DD/YYYY)
#
#  AS_TIME
#	Time alert occurred. (Local time: HH:MM:SS)
#
#  AS_TIMEZONE
#	Timezone configured on system where alert occurred
#
#  AS_LAST10
#	Last 10 parameter values prior to alert (e.g., 1.00 2.00 3.00 etc.)
#
#  AS_AVE10
#	Average of LAST10 values
#
#  AS_LAST10TS
#	Last 10 parameter value timestamps (e.g., 957359389 957359430 etc.)
#
#  AS_LAST10TP
#	Overall time period, in minutes, of LAST10 (e.g., 30.00)
#
#  AS_USERDEFINED
#	User defined information passed to EventSpring
#
#  AS_OS_TYPE
#     The operating system type of the system generating the alert
#     (e.g., NT, SOLARIS, etc.)
#
#  AS_ALARM_MIN
#     The lower threshold of current alarm range (e.g., 90)
#
#  AS_ALARM_MAX
#     The upper threshold of current alarm range (e.g., 100)
#
#  AS_CUSTOM_ID1
#     A custom identifier assigned to the alerting object
#
#  AS_CUSTOM_ID2
#     Another custom identifier assigned to the alerting object
#
#  AS_EVENT_ID
#	The PATROL Event Manager's event id assigned to the
#	originating alert/event. (e.g., 87654)
#
#  AS_EVENT_CATALOG
#	The PATROL Event Manager's event catalog of the
#	originating event. (e.g., 0)
#
#  AS_EVENT_CLASS
#	The PATROL Event Manager's event class of the
#	originating event. (e.g., 11)
#
#  AS_EVENT_STATUS
#	The PATROL Event Manager's event status of the
#	originating event. (e.g., OPEN)
#
#  AS_EVENT_SEVERITY
#	The PATROL Event Manager's event severity of the
#	originating event. (e.g., 4)
#
#  AS_EVENT_TYPE
#	The PATROL Event Manager's event type of the
#	originating event. (e.g., ALARM)
#
#  AS_NOTIFY_EVENT_ID
#	The PATROL Event Manager's event id assigned to the
#	NOTIFY_EVENT (or REMOTE_NOTIFY_EVENT). This is the event
#	id that triggered the execution of this script.
#
#  AS_NOTIFY_EVENT_TYPE
#	The PATROL Event Manager's event type assigned to this
#	NOTIFY_EVENT (or REMOTE_NOTIFY_EVENT). The value typically
#	corresponds to the AS_PARAMETER_STATUS. Possible values are:
#	'INFORMATION', 'WARNING', 'ALARM', 'ESCALATED'.
#
#  AS_NOTIFY_EVENT_STATUS
#	The PATROL Event Manager's event status assigned to this
#	NOTIFY_EVENT. Possible values include: 'OPEN', 'ESCALATED'
#	and 'ACKNOWLEDGED'.
#
#  AS_AGENT_VERSION
#	The PATROL agent version. (e.g., V3.4.11)
#
#  AS_PATROL_HOME
#	PATROL_HOME for the agent on AS_HOSTNAME (e.g., /usr/patrol/PATROL3-4)
#
#  AS_NOTIFICATION_TYPE
# 	One of the following: 'email', 'page', 'custom', 'tt'
#
#  AS_NOTIFICATION_MSG
# 	Reworded alert message text - one line problem description
#
#  AS_NOTIFICATION_TARGETS
# 	Identifies who gets notified.
#	Targets are 'space' delimited.
#
#  AS_NOTIFICATION_FILE
#	Output file containing additional info that can be emailed.
#	This file is typically generated by from the output of a
#	recovery command run by EventSpring.
#
#  AS_DEBUG
# 	Prints debug information when set
#
#  AS_SSTIME
#	Time, in seconds, since 00:00:00 GMT, Jan 01, 1970
#----------------------------------------------------------------------------

#-------------------------------------------------------------------------
#--- Get remotely generated notification files.
#-------------------------------------------------------------------------
FtpGetFile() {

   #--- FTP settings
   local_dir="/tmp" #where the ftp'd file are stored locally
   local_file="$local_dir/`basename $nfile`"

   ftp_user="patrol"
   ftp_passwd="patrol_890"
   #ftp_passwd=`cat ./patrol_ftp.passwd` #cat a file that is read protected

   echo "FTP Get: $AS_IPADDRESS($AS_HOSTNAME):$nfile -> localhost:$local_file"

   cat << __EOC__ | ftp -i -n
open $AS_IPADDRESS
user $ftp_user $ftp_passwd
get $nfile $local_file
close
quit
__EOC__

   nfile="$local_file"

} #FtpGetFile

#-------------------------------------------------------------------------
#--- Make email body
#-------------------------------------------------------------------------
MakeEmailBody() {

   #--- Include the contents of any notification/recovery action
   #--- output that was generated.
   if [ -f "$nfile" ] ; then
	nfile_contents="
--------------------------
Notification File contents
--------------------------
`cat $nfile`
" #add nfile to mailbody

   fi

   #--- Check to see if AS env. vars are set.
   if [ "$AS_NOTIFICATION_TYPE" = "" ] ; then
	mailbody="$mailbody
--------------------
Notification Details
--------------------
NOTIFICATION MESSAGE: $nmsg
NOTIFICATION TARGETS: $ntargets
$nfile_contents
"
	return
   fi

   #--- Format USERDEFINED info
   if [ "$AS_USERDEFINED" = "" ] ; then
	udef=""
   else
	#**
	#** NOTE REGARDING SED AND AS_USERDEFINED TRUNCATION **
	#** If the AS_USERDEFINED info is being truncate it might be
	#** due to the version of sed being used.
	#** On Solaris use: /usr/xpg4/bin/sed
	#**
	udef=`echo "$AS_USERDEFINED" | /bin/sed 's/-CR-/~/g' | tr "~" "\n"`
	mailbody="----------------------------
Additional Alert Information
----------------------------
$udef
"
   fi

   #--- Build the final email body
   mailbody="$mailbody
--------------------
Notification Details
--------------------
NOTIFICATION MESSAGE: $AS_NOTIFICATION_MSG
NOTIFICATION TARGETS: $AS_NOTIFICATION_TARGETS
NOTIFICATION FILE:    $AS_NOTIFICATION_FILE (if set, see contents below)

-------------
Event Details
-------------
AFFECTED HOST: $AS_HOSTNAME $AS_IPADDRESS $AS_OS_TYPE
TIME OF ALERT: $AS_DATE $AS_TIME (Local time on the 'AFFECTED HOST')

APP CLASS:     $AS_APPCLASS
INSTANCE:      $AS_APPINSTANCE
ICON NAME:     $AS_ICON_NAME (Instance name as it appears on the console)
PARENT INST:   $AS_PARENT_INSTANCE

PARAMETER:     $AS_PARAMETER
PARAM STATUS:  $AS_PARAMETER_STATUS
PARAM VALUE:   $AS_PARAMETER_VALUE
LAST10 VALUES: $AS_LAST10 (Occurred over $AS_LAST10TP minutes)
AVERAGE10:     $AS_AVE10
ALARM MIN:     $AS_ALARM_MIN
ALARM MAX:     $AS_ALARM_MAX

CUSTOM ID1:    $AS_CUSTOM_ID1
CUSTOM ID2:    $AS_CUSTOM_ID2

$nfile_contents
" #end of body
   return

} #MakeEmailBody

#-------------------------------------------------------------------------
#--- Send email procedure
#-------------------------------------------------------------------------
SendMail() {

   #--- Check to see if $nfile is set and if it is then
   #--- get the file via FTP if it is not here.
   if [ ! -z "$nfile" ] ; then
	if [ ! -f "$nfile" -a $GET_REMOTE_FILES -eq 1 ] ; then
	   FtpGetFile
	fi
   fi

   #--- Create the email body
   if [ $EMAIL_FULL_REPORT -eq 1 ]; then
	MakeEmailBody
   else
	mailbody="$nmsg";

	#--- Include AS_USERDEFINED info if available
	if [ "$AS_USERDEFINED" = "" ] ; then
	   udef=""
	else
	   udef=`echo "$AS_USERDEFINED" | /bin/sed 's/-CR-/~/g' | tr "~" "\n"`
	   mailbody="$nmsg
----------------------------
Additional Alert Information
----------------------------
$udef"
	fi

   fi

   ntargets=`echo "$ntargets" | /bin/sed 's/ /,/g'` #if using target env var.
   echo "$mailbody" | /usr/bin/mailx -s "$nmsg" $ntargets
   if [ $? -eq 0 ]; then
	exit_status=0
   else
	exit_status=2
   fi
   return
}

#-------------------------------------------------------------------------
#--- Send page procedure
#-------------------------------------------------------------------------
SendPage () {
   #MAX_MSG_LENGTH=254
   #nmsg=`echo "$nmsg" | /bin/cut -c 1-$MAX_MSG_LENGTH`
   #--- targets sent may be comma delimited 't1,t2,..'
   ntargets=`echo "$ntargets" | /bin/sed 's/,/ /g'`
   for i in $ntargets
   do
	echo "Edit this script to perform paging: ${0}."
	echo "Paging procedure has not been established."
	echo "Patrol Alert Msg: $nmsg"
	echo "Intended Target: $i"
   done
   exit_status=2
   return
}

#-------------------------------------------------------------------------
#--- Send custom procedure
#-------------------------------------------------------------------------
Custom () {
   #could do xterm to target which is defined as the display
   #e.g., xterm -display ${ntargets}:0.0 -e... 
   #or use notification server on NT and do NT popup
   #to the target desktop system
   echo "Edit this script to perform custom notification: ${0}."
   echo "Custom procedure has not been established."
   echo "Intended Target(s): $ntargets"
   exit_status=2
   return
} #Custom

#-------------------------------------------------------------------------
#--- Send Trouble Ticket procedure
#-------------------------------------------------------------------------
SendTroubleTicket () {
   echo "Edit this script to generate Trouble Tickets: ${0}."
   echo "Trouble Ticket procedure has not been established."
   echo "Intended Target(s): $ntargets"
   exit_status=2
   return
} #SendTroubleTicket()


#---------------------------------------------------------------
#--- Start Here
#---------------------------------------------------------------


exit_status=0
EMAIL_FULL_REPORT=0
GET_REMOTE_FILES=0
# 定义告警DEBUG日志输出格式: 主机名-参数-告警状态.log
#EVENT_LOG=$PATROL_EVENT/event_log/${AS_HOSTNAME}-${AS_PARAMETER}-${AS_PARAMETER_STATUS}.log

#Uncomment the following if relying on/prefer command line input
#--- Validate args
#[ $# -lt 3 ]  && \
#	{ echo "Usage: ${0} { email | page | custom | tt } targets message [ email_file ]" >&2; exit 1; }

#--- Initialize variables 
#--- Use command line input ONLY if env vars are not set
ntype=${AS_NOTIFICATION_TYPE-$1}
ntargets=${AS_NOTIFICATION_TARGETS-$2}
nmsg=${AS_NOTIFICATION_MSG-$3}
nfile=${AS_NOTIFICATION_FILE-$4}
#debug=${AS_DEBUG-""}
debug=0
#--- Trim out characters that could cause the notification
#--- command to fail or the message to get truncated. If these
#--- characters are needed then they can be escaped instead.
nmsg=`echo "$nmsg" | /bin/sed -e 's/\`/ /g' -e 's/\"/ /g' -e 's/\\\\/ /g'`

if [ "$debug" != "" ] ; then
   echo "DEBUG:Script Name 	    = ${0}" >> $EVENT_LOG
   echo "DEBUG:Send Message to NMS  = ./AddExtEvent.sh $AS_IPADDRESS $AS_APPINSTANCE $AS_PARAMETER $AS_APPCLASS $AS_PARAMETER_STATUS $AS_PARAMETER_VALUE $AS_ALARM_MAX $AS_ALARM_MIN  $occurtime "   >>$EVENT_LOG
   echo "DEBUG:AS_DEBUG             = $AS_DEBUG"			>>$EVENT_LOG
   echo "DEBUG:AS_HOSTNAME          = $AS_HOSTNAME"               	>>$EVENT_LOG
   echo "DEBUG:AS_IPADDRESS         = $AS_IPADDRESS"              	>>$EVENT_LOG
   echo "DEBUG:AS_TCP_PORT          = $AS_TCP_PORT"               	>>$EVENT_LOG
   echo "DEBUG:AS_UDP_PORT          = $AS_UDP_PORT"               	>>$EVENT_LOG
   echo "DEBUG:AS_APPCLASS          = $AS_APPCLASS"               	>>$EVENT_LOG
   echo "DEBUG:AS_APPINSTANCE       = $AS_APPINSTANCE"            	>>$EVENT_LOG
   echo "DEBUG:AS_ICON_NAME         = $AS_ICON_NAME"              	>>$EVENT_LOG
   echo "DEBUG:AS_PARENT_INSTANCE   = $AS_PARENT_INSTANCE"        	>>$EVENT_LOG
   echo "DEBUG:AS_PARAMETER         = $AS_PARAMETER"              	>>$EVENT_LOG
   echo "DEBUG:AS_PARAMETER_STATUS  = $AS_PARAMETER_STATUS"       	>>$EVENT_LOG
   echo "DEBUG:AS_PARAMETER_VALUE   = $AS_PARAMETER_VALUE"        	>>$EVENT_LOG
   echo "DEBUG:AS_DATE              = $AS_DATE"                   	>>$EVENT_LOG
   echo "DEBUG:AS_TIME              = $AS_TIME"                   	>>$EVENT_LOG
   echo "DEBUG:AS_TIMEZONE          = $AS_TIMEZONE"               	>>$EVENT_LOG
   echo "DEBUG:AS_LAST10            = $AS_LAST10"                 	>>$EVENT_LOG
   echo "DEBUG:AS_AVE10             = $AS_AVE10"                  	>>$EVENT_LOG
   echo "DEBUG:AS_LAST10TS          = $AS_LAST10TS"               	>>$EVENT_LOG
   echo "DEBUG:AS_LAST10TP          = $AS_LAST10TP"               	>>$EVENT_LOG
   echo "DEBUG:AS_USERDEFINED       = $AS_USERDEFINED"            	>>$EVENT_LOG
   echo "DEBUG:AS_OS_TYPE           = $AS_OS_TYPE"                	>>$EVENT_LOG
   echo "DEBUG:AS_ALARM_MIN         = $AS_ALARM_MIN"              	>>$EVENT_LOG
   echo "DEBUG:AS_ALARM_MAX         = $AS_ALARM_MAX"              	>>$EVENT_LOG
   echo "DEBUG:AS_CUSTOM_ID1        = $AS_CUSTOM_ID1"             	>>$EVENT_LOG
   echo "DEBUG:AS_CUSTOM_ID2        = $AS_CUSTOM_ID2"             	>>$EVENT_LOG
   echo "DEBUG:AS_AGENT_VERSION     = $AS_AGENT_VERSION"          	>>$EVENT_LOG
   echo "DEBUG:AS_PATROL_HOME       = $AS_PATROL_HOME"            	>>$EVENT_LOG
   echo "DEBUG:AS_NOTIFY_EVENT_ID     = $AS_NOTIFY_EVENT_ID"      	>>$EVENT_LOG
   echo "DEBUG:AS_NOTIFY_EVENT_STATUS = $AS_NOTIFY_EVENT_STATUS"  	>>$EVENT_LOG
   echo "DEBUG:AS_NOTIFY_EVENT_TYPE   = $AS_NOTIFY_EVENT_TYPE"    	>>$EVENT_LOG
   echo "DEBUG:AS_EVENT_CATALOG       = $AS_EVENT_CATALOG"        	>>$EVENT_LOG
   echo "DEBUG:AS_EVENT_CLASS         = $AS_EVENT_CLASS"          	>>$EVENT_LOG
   echo "DEBUG:AS_EVENT_ID            = $AS_EVENT_ID"             	>>$EVENT_LOG
   echo "DEBUG:AS_EVENT_SEVERITY      = $AS_EVENT_SEVERITY"       	>>$EVENT_LOG
   echo "DEBUG:AS_EVENT_STATUS        = $AS_EVENT_STATUS"         	>>$EVENT_LOG
   echo "DEBUG:AS_EVENT_TYPE          = $AS_EVENT_TYPE"           	>>$EVENT_LOG
   echo "DEBUG:AS_NOTIFICATION_TYPE    = $AS_NOTIFICATION_TYPE"   	>>$EVENT_LOG
   echo "DEBUG:AS_NOTIFICATION_TARGETS = $AS_NOTIFICATION_TARGETS"	>>$EVENT_LOG
   echo "DEBUG:AS_NOTIFICATION_MSG     = $AS_NOTIFICATION_MSG"    	>>$EVENT_LOG
   echo "DEBUG:AS_NOTIFICATION_FILE    = $AS_NOTIFICATION_FILE"   	>>$EVENT_LOG
   echo "DEBUG:ntype    = $ntype"                                 	>>$EVENT_LOG
   echo "DEBUG:ntargets = $ntargets"                              	>>$EVENT_LOG
   echo "DEBUG:nmsg     = $nmsg"                                  	>>$EVENT_LOG
   echo "DEBUG:nfile    = $nfile"                                 	>>$EVENT_LOG
   
fi

_this_host_=`hostname` #script may be running on notification server

#--- Verify we have enough input to perform notification
if [ "$ntype" = "" ] ; then
   echo "${0}:Notification Type not specified. (Choose 'page', 'email', 'custom', 'tt')"
   exit 1
fi
if [ "$ntargets" = "" ] ; then
   echo "${0}:Notification Targets not specified."
   exit 1
fi
if [ "$nmsg" = "" ] ; then
   echo "${0}:Notification message not specified."
   exit 1
fi

#--- Send email?
if [ "$ntype" = "email" ] ; then
   SendMail
fi

#--- Send page?
if [ "$ntype" = "page" ] ; then
   SendPage
fi

#--- Send Trouble Ticket
if [ "$ntype" = "tt" ] ; then
   SendTroubleTicket
fi

#--- Custom?
if [ "$ntype" = "custom" ] ; then
   Custom
fi

#--- Exit
sleep 1 #keep this here!
exit $rv

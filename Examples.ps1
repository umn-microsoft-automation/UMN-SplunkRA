# Authenticate and get token
$cred = Get-Credential
$server = 'splunk.yourdomain.net'
$header = Connect-Splunk -splunkCreds $cred  -server $server
# $header = Connect-Splunk -splunkCreds $cred -SkipCertificateCheck -server $server use this if splunk is using a cert not trusted.

#### ON the fly search examples
$search = 'index=<fill in>  EventID=4625 OR EventID=4771 OR EventID=4740   TargetUserName!=*$ Status=0x25 earliest=07/01/2017:0:0:0  |dedup TargetUserName| table TargetUserName'
$search = 'index=<fill in>  source="WinEventLog:Security"   (EventID=4625 OR EventID=4771) Status=0xc0000234 OR 0xc000006d OR Status=0xc000006a OR Status=0x1*     NOT dest_nt_domain="*"  TargetUserName=***  TargetUserName!="*$" earliest=-24h@h latest=now | stats  values(Source_Workstation)  count(EventID) AS count  by TargetUserName |sort -count |head 20'
$return = Get-SplunkSearchExport -server $server -header $header -search $search -outPutmode csv
$return

## get a list of saved searches
Get-SplunkListSavedSearches -server $server -header $header

# Get a list of Jobs
($jobList = Get-SplunkSearchJobs -server $server -header $header)

# Get results of a job, use Get-SplunkSearchJobs to get the sid
#
Get-SplunkSearchJobsResults -server $server -header $header -sid $sid
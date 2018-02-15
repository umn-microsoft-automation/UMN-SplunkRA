---
external help file: UMN-SplunkRA-help.xml
Module Name: UMN-SplunkRA
online version: 
schema: 2.0.0
---

# Get-SplunkSearchJobs

## SYNOPSIS
Get list of jobs or details about a specific job

## SYNTAX

```
Get-SplunkSearchJobs [-server] <String> [-header] <Hashtable> [[-port] <String>] [[-sid] <String>]
```

## DESCRIPTION
Get list of jobs or details about a specific job

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-SplunkListSavedSearches -server $server -header $header
```

## PARAMETERS

### -server
FQDN for splunk server

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -header
Header value (use Connect-splunk to get it)

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -port
splunk server port to connect to, port 8089 is the default

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: 8089
Accept pipeline input: False
Accept wildcard characters: False
```

### -sid
The default is to return a summary of jobs, this will also get the Search ID (sid) that you can feed back in to get more details about a job

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS


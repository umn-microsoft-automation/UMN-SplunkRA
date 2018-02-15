---
external help file: UMN-SplunkRA-help.xml
Module Name: UMN-SplunkRA
online version: 
schema: 2.0.0
---

# Get-SplunkSearchJobsResults

## SYNOPSIS
Get Reults of a job

## SYNTAX

```
Get-SplunkSearchJobsResults [-server] <String> [-header] <Hashtable> [[-port] <String>] [-sid] <String>
```

## DESCRIPTION
Get Reults of a job. 
It can return a lot of data, consider piping through Select to narrow it down.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```

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
Search ID (sid), use Get-SplunkSearchJobs to get this

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS


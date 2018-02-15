---
external help file: UMN-SplunkRA-help.xml
Module Name: UMN-SplunkRA
online version: 
schema: 2.0.0
---

# Get-SplunkListSavedSearches

## SYNOPSIS
Get list of saved searches

## SYNTAX

```
Get-SplunkListSavedSearches [-server] <String> [-header] <Hashtable> [[-port] <String>] [-complete]
```

## DESCRIPTION
Get list of saved searches

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

### -complete
The default is to return a summary of search, use this switch to get all the details the system returns

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS


---
external help file: UMN-SplunkRA-help.xml
Module Name: UMN-SplunkRA
online version: 
schema: 2.0.0
---

# Get-SplunkSearchExport

## SYNOPSIS
Get results for a search

## SYNTAX

```
Get-SplunkSearchExport [-server] <String> [-header] <Hashtable> [-search] <String> [[-outPutmode] <String>]
 [[-port] <String>]
```

## DESCRIPTION
Get results for a search

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

### -search
Realtime Search you want performed

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -outPutmode
csv,xml,json data return type for call

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: Default
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
Position: 5
Default value: 8089
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS


---
external help file: UMN-SplunkRA-help.xml
Module Name: UMN-SplunkRA
online version: 
schema: 2.0.0
---

# Invoke-SplunkBase

## SYNOPSIS
Base function all other functions are built on

## SYNTAX

```
Invoke-SplunkBase [-server] <String> [-header] <Hashtable> [[-body] <Hashtable>] [-resourcePath] <String>
 [[-outPutmode] <String>] [[-port] <String>]
```

## DESCRIPTION
Base function all other functions are built on

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

### -body
{{Fill body Description}}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -resourcePath
Api resoure path.

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

### -outPutmode
csv,xml,json data return type for call

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 5
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
Position: 6
Default value: 8089
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS


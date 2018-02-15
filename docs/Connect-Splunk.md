---
external help file: UMN-SplunkRA-help.xml
Module Name: UMN-SplunkRA
online version: 
schema: 2.0.0
---

# Connect-Splunk

## SYNOPSIS
Connect to splunk server and header properly formatted

## SYNTAX

```
Connect-Splunk [[-splunkCreds] <PSCredential>] [-server] <String> [-SkipCertificateCheck] [[-port] <String>]
```

## DESCRIPTION
Connect to splunk server and header properly formatted

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$header = Connect-Splunk -splunkCreds $cred -SkipCertificateCheck -server 'splunk.mydomain.com'
```

## PARAMETERS

### -splunkCreds
PS credential of user that has access

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -server
FQDN for splunk server

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipCertificateCheck
Ignore bad SSL Certificates

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

## INPUTS

## OUTPUTS

### System.Collections.Hashtable[]
Header with Authentication information

## NOTES
# http://docs.splunk.com/Documentation/Splunk/latest/RESTUM/RESTusing#Authentication_and_authorization
For legacy automation systems dealing with cookies - 
-UseBasicParsing is included on the InvokeWebRequest - needed parsing for Orchestrator

## RELATED LINKS


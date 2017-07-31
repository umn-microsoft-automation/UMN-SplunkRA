###
# Copyright 2017 University of Minnesota, Office of Information Technology

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

# based off http://dev.splunk.com/restapi 


#region Connect-Splunk
Function Connect-Splunk{
<#
    .SYNOPSIS
	    Connect to splunk server and header properly formatted
    .DESCRIPTION
	
    .PARAMETER splunkCred
        PS credential of user that has access

    .PARAMETER server
        FQDN for splunk server

    .PARAMETER SkipCertificateCheck
        Ignore bad SSL Certificates

    .PARAMETER port
        splunk server port to connect to, port 8089 is the default

    .EXAMPLE
	    $header = Connect-Splunk -splunkCreds $cred -SkipCertificateCheck -server 'splunk.mydomain.com'

    .NOTES
	    # http://docs.splunk.com/Documentation/Splunk/latest/RESTUM/RESTusing#Authentication_and_authorization
        For legacy automation systems dealing with cookies - 
        -UseBasicParsing is included on the InvokeWebRequest - needed parsing for Orchestrator
#>


    [CmdletBinding()]
    param(

        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]$splunkCreds,

        [parameter(Mandatory)]
        [string]$server,

        [switch]$SkipCertificateCheck,

        [string]$port = "8089"
    )
     
    Begin
    {
        if ($SkipCertificateCheck -and $PSVersionTable.PSVersion.Major -lt 6)
        {
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
            [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
        }
    }
    Process
    {    
        $uri = "https://$server`:$port/services/auth/login"
        $return = (Invoke-RestMethod -Uri $uri -body "username=$($splunkCreds.UserName);password=$($splunkCreds.GetNetworkCredential().Password)" -Method Post -ContentType 'application/x-www-form-urlencoded').response
        $session = $return.sessionKey
        return ($header = @{"Authorization"= "Splunk $session"})
    }
    End{}
}
#endregion

#region Invoke-SplunkBase
Function Invoke-SplunkBase{
<#
    .SYNOPSIS
	    Base function all other functions are built on

    .DESCRIPTION
	    Base function all other functions are built on

    .PARAMETER header
        Header value (use Connect-splunk to get it)

    .PARAMETER server
        FQDN for splunk server

    .PARAMETER outPutmode
        csv,xml,json data return type for call

    .PARAMETER port
        splunk server port to connect to, port 8089 is the default

    .PARAMETER resourcePath
        Api resoure path.

    .EXAMPLE
	    

    .NOTES
	    
#>


    [CmdletBinding()]
    param(

        [parameter(Mandatory)]
        [string]$server,

        [parameter(Mandatory)]
        [System.Collections.Hashtable]$header,

        [System.Collections.Hashtable]$body,

        [parameter(Mandatory)]
        [string]$resourcePath,

        ## Warning the convertfrom-json blows up a LOT, it does not like the way spunk sends back data
        [ValidateSet("json", "csv", "xml", "default")]
        [string]$outPutmode = "default",

        #[switch]$SkipCertificateCheck,

        [string]$port = "8089"
    )
    Begin{}
    Process
    {
        $uri = "https://$server`:$port/services/$resourcePath"
        if ($outPutmode -ne 'default'){$uri = $uri + "?output_mode=$outPutmode"}
        if ($body){$data = (Invoke-WebRequest -Uri $uri -Headers $header -Body $body).Content}
        else{$data = (Invoke-WebRequest -Uri $uri -Headers $header).Content}
        if ($outPutmode -eq 'csv'){ return ($data | ConvertFrom-Csv)}
        elseif ($outPutmode -eq 'json'){return ($data | ConvertFrom-Json)}
        else{return $data}
    }
    End{}
}
#endregion

#region Get-SplunkSearchExport
Function Get-SplunkSearchExport{
<#
    .SYNOPSIS
	    Get results for a search

    .DESCRIPTION
        Get results for a search	

    .PARAMETER header
        Header value (use Connect-splunk to get it)

    .PARAMETER server
        FQDN for splunk server

    .PARAMETER outPutmode
        csv,xml,json data return type for call

    .PARAMETER port
        splunk server port to connect to, port 8089 is the default

    .PARAMETER search
        Realtime Search you want performed

    .EXAMPLE
	    

    .NOTES
	    
#>


    [CmdletBinding()]
    param(

        [parameter(Mandatory)]
        [string]$server,

        [parameter(Mandatory)]
        [System.Collections.Hashtable]$header,

        [parameter(Mandatory)]
        [string]$search,

        ## Warning the convertfrom-json blows up a LOT, it does not like the way spunk sends back data
        [ValidateSet("json", "csv", "xml", "default")]
        [string]$outPutmode = "default",

        #[switch]$SkipCertificateCheck,

        [string]$port = "8089"
    )
    
    Begin{}
    Process
    {
        $body = @{"search" = "search $search"}
        return (Invoke-SplunkBase -server $server -header $header -resourcePath 'search/jobs/export' -outPutmode $outPutmode -body $body -port $port)
    }
    End{}
}
#endregion
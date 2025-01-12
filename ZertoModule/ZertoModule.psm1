﻿#Requires -Version 5.0
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#NOTE that the ExternalHelp tag requires a BLANK LINE before it 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#region Zerto Enums

    enum ZertoVPGStatus {
        Initializing          = 0
        MeetingSLA            = 1
        NotMeetingSLA         = 2
        HistoryNotMeetingSLA  = 3
        RpoNotMeetingSLA      = 4
        FailingOver           = 5
        Moving                = 6
        Deleting              = 7
        Recovered             = 8
    }

    
    enum ZertoVPGSubstatus {
        None                                 = 0
        InitialSync                          = 1
        Creating                             = 2
        VolumeInitialSync                    = 3
        Sync                                 = 4
        RecoveryPossible                     = 5
        DeltaSync                            = 6
        NeedsConfiguration                   = 7
        Error                                = 8
        EmptyProtectionGroup                 = 9
        DisconnectedFromPeerNoRecoveryPoints = 10
        FullSync                             = 11
        VolumeDeltaSync                      = 12
        VolumeFullSync                       = 13
        FailingOverCommitting                = 14
        FailingOverBeforeCommit              = 15
        FailingOverRollingBack               = 16
        Promoting                            = 17
        MovingCommitting                     = 18
        MovingBeforeCommit                   = 19
        MovingRollingBack                    = 20
        Deleting                             = 21
        PendingRemove                        = 22
        BitmapSync                           = 23
        DisconnectedFromPeer                 = 24
        ReplicationPausedUserInitiated       = 25
        ReplicationPausedSystemInitiated     = 26
        RecoveryStorageProfileError          = 27
        Backup                               = 28
        RollingBack                          = 29
        RecoveryStorageError                 = 30
        JournalStorageError                  = 31
        VmNotProtectedError                  = 32
    }

    enum ZertoProtectedSiteType {
        VCVpg    = 0 
        VCvApp   = 1 
        VCDvApp  = 2 
        AWS      = 3 
        HyperV   = 4 
    }

    enum ZertoRecoverySiteType {
        VCVpg    = 0 
        VCvApp   = 1 
        VCDvApp  = 2 
        AWS      = 3 
        HyperV   = 4 
    }

    enum ZertoVPGPriority {
        Low    = 0
        Medium = 1
        High   = 2
    }

    enum ZertoVRAStatus {
        Installed              = 0
        UnsupportedEsxVersion  = 1
        NotInstalled           = 2
        Installing             = 3
        Removing               = 4
        InstallationError      = 5
        HostPasswordChanged    = 6
        UpdatingIpSettings     = 7
        DuringChangeHost       = 8

    }

    enum ZertoPairingStatus {
        Paired = 0 
        Pairing = 1
        Unpaired = 2
    }

    enum ZertoAlertLevel {
        Warning = 0 
        Error = 1
    }

    enum ZertoAlertEntity {
        Zvm                   = 0 
        Vra                   = 1 
        Vpg                   = 2 
        CloudConnector        = 3 
        Storage               = 4 
        License               = 5 
        Zcm                   = 6 
        FileRecoveryComponent = 7 
    }

    enum ZertoAlertHelpIdentifier {
        AWS0001  = 0 
        BCK0001  = 1 
        BCK0002  = 2 
        BCK0005  = 3 
        BCK0006  = 4 
        BCK0007  = 5 
        LIC0001  = 6 
        LIC0002  = 7 
        LIC0003  = 8 
        LIC0004  = 9 
        LIC0005  = 10
        LIC0006  = 11
        LIC0007  = 12
        LIC0008  = 13
        STR0001  = 14
        STR0002  = 15
        STR0004  = 16
        VCD0001  = 17
        VCD0002  = 18
        VCD0003  = 19
        VCD0004  = 20
        VCD0005  = 21
        VCD0006  = 22
        VCD0007  = 23
        VCD0010  = 24
        VCD0014  = 25
        VCD0015  = 26
        VCD0016  = 27
        VCD0017  = 28
        VCD0018  = 29
        VCD0020  = 30
        VCD0021  = 31
        VPG0003 = 32
        VPG0004 = 33
        VPG0005 = 34
        VPG0006 = 35
        VPG0007 = 36
        VPG0008 = 37
        VPG0009 = 38
        VPG0010 = 39
        VPG0011 = 40
        VPG0012 = 41
        VPG0014 = 42
        VPG0015 = 43
        VPG0016 = 44
        VPG0017 = 45
        VPG0018 = 46
        VPG0019 = 47
        VPG0020 = 48
        VPG0021 = 49
        VPG0022 = 50
        VPG0023 = 51
        VPG0024 = 52
        VPG0025 = 53
        VPG0026 = 54
        VPG0027 = 55
        VPG0028 = 56
        VPG0035 = 57
        VPG0036 = 58
        VPG0037 = 59
        VPG0038 = 60
        VPG0039 = 61
        VPG0040 = 62
        VPG0041 = 63
        VPG0042 = 64
        VPG0043 = 65
        VPG0044 = 66
        VPG0045 = 67
        VPG0046 = 68
        VPG0047 = 69
        VPG0048 = 70
        VRA0001 = 71 
        VRA0002 = 72 
        VRA0003 = 73 
        VRA0004 = 74 
        VRA0005 = 75 
        VRA0006 = 76 
        VRA0007 = 77 
        VRA0008 = 78 
        VRA0009 = 79 
        VRA0010 = 80 
        VRA0011 = 81 
        VRA0012 = 82 
        VRA0013 = 83 
        VRA0014 = 84 
        VRA0015 = 85 
        VRA0016 = 86 
        VRA0017 = 87 
        VRA0018 = 88 
        VRA0019 = 89 
        VRA0020 = 90 
        VRA0021 = 91 
        VRA0022 = 92 
        VRA0023 = 93 
        VRA0024 = 94 
        VRA0025 = 95 
        VRA0026 = 96 
        VRA0027 = 97 
        VRA0028 = 98 
        VRA0029 = 99 
        VRA0030 = 100
        VRA0032 = 101
        VRA0035 = 102
        VRA0036 = 103
        VRA0037 = 104
        VRA0038 = 105
        VRA0039 = 106
        VRA0040 = 107
        VRA0049 = 108
        VRA0050 = 109
        VRA0051 = 110
        VRA0052 = 111
        VRA0053 = 112
        VRA0054 = 113
        VRA0055 = 114
        ZCC0001 = 115
        ZCC0002 = 116
        ZCC0003 = 117
        ZCM0001 = 118
        ZVM0001 = 119
        ZVM0002 = 120
        ZVM0003 = 121
        ZVM0004 = 122
        ZVM0005 = 123
        ZVM0006 = 124
        ZVM0007 = 125
        ZVM0008 = 126
        ZVM0009 = 127
        ZVM0010 = 128
        ZVM0011 = 129
        ZVM0012 = 130
        ZVM0013 = 131
        ZVM0014 = 132
        ZVM0015 = 133
        FLR0001 = 134
        Unknown =  135
    }

    enum ZertoEventType {
        Unknown                                    = 0 
        CreateProtectionGroup                      = 1 
        RemoveProtectionGroup                      = 2 
        FailOver                                   = 3 
        FailOverTest                               = 4 
        StopFailOverTest                           = 5 
        Move                                       = 6 
        ProtectVM                                  = 7 
        UnprotectVM                                = 8 
        InstallVra                                 = 9 
        UninstallVra                               = 10
        UpdateProtectionGroup                      = 11
        InsertTaggedCP                             = 12
        HandleMirrorPromotion                      = 13
        ActivateAllMirrors                         = 14
        LogCollection                              = 15
        ForceReconfigurationOfNewVM                = 16
        ClearSite                                  = 17
        ForceRemoveProtectionGroup                 = 18
        ForceUpdateProtectionGroup                 = 19
        ForceKillProtectionGroup                   = 20
        PrePostScript                              = 21
        InitFullSync                               = 22
        Pair                                       = 23
        Unpair                                     = 24
        InstallCloudConnector                      = 25
        UninstallCloudConnector                    = 26
        RedeployCloudConnector                     = 27
        ScriptExecutionFailure                     = 28
        SetAdvancedSiteSettings                    = 29
        Clone                                      = 30
        KeepDisk                                   = 31
        FailoverBeforeCommit                       = 32
        FailoverCommit                             = 33
        FailoverRollback                           = 34
        MoveBeforeCommit                           = 35
        MoveRollback                               = 36
        MoveCommit                                 = 37
        MaintainHost                               = 38
        UpgradeVra                                 = 39
        MoveProtectionGroupToManualOperationNeeded = 40
        ChangeVraIpSettings                        = 41
        PauseProtectionGroup                       = 42
        ResumeProtectionGroup                      = 43
        UpgradeZVM                                 = 44
        BulkUpgradeVras                            = 45
        BulkUninstallVras                          = 46
        AlertTurnedOn                              = 47
        AlertTurnedOff                             = 48
        ChangeVraPassword                          = 49
        ChangeRecoveryHost                         = 50
        BackupProtectionGroup                      = 51
        CleanupProtectionGroupVipDiskbox           = 52
        RestoreProtectionGroup                     = 53
        PreScript                                  = 54
        PostScript                                 = 55
        RemoveVmFromVc                             = 56
        ChangeVraPasswordIpSettings                = 57
        FlrJournalMount                            = 58
        FlrJournalUnmount                          = 59
        Login                                      = 60
    }

    enum ZertoEventCategory {
        All    = 0
        Events = 1
        Alerts = 2
    }

    enum ZertoCommitPolicy {
        Rollback    = 0
        Commit      = 1
        None        = 2
    }

    enum ZertoShutdownPolicy {
        None          = 0
        Shutdown      = 1
        ForceShutdown = 2
    }

    enum ZertoVRAIPConfigType {
        Dhcp = 0
        Static = 1
    }

    enum ZertoTaskTypes {
        CreateProtectionGroup = 0  
        RemoveProtectionGroup = 1  
        FailOver = 2  
        FailOverTest = 3  
        StopFailOverTest = 4  
        Move = 5  
        GetCheckpointList = 6  
        ProtectVM = 7  
        UnprotectVM = 8  
        AddVMToProtectionGroup = 9  
        RemoveVMFromProtectionGroup = 10 
        InstallVra = 11 
        UninstallVra = 12 
        GetVMSettings = 13 
        UpdateProtectionGroup = 14 
        InsertTaggedCP = 15 
        WaitForCP = 16 
        HandleMirrorPromotion = 17 
        ActivateAllMirrors = 18 
        LogCollection = 19 
        ClearCheckpoints = 20 
        ForceReconfigurationOfNewVM = 21 
        ClearSite = 22 
        ForceRemoveProtectionGroup = 23 
        ForceUpdateProtectionGroup = 24 
        ForceKillProtectionGroup = 25 
        PrePostScript = 26 
        InitFullSync = 27 
        Pair = 28 
        Unpair = 29 
        AddPeerVraInfo = 30 
        RemovePeerVraInfo = 31 
        InstallCloudConnector = 32 
        UninstallCloudConnector = 33 
        HandleFirstSyncDone = 34 
        Clone = 35 
        MoveBeforeCommit = 36 
        MoveRollback = 37 
        MoveCommit = 38 
        UpgradeVRA = 39 
        MaintainHost = 40 
        NotSupportedInThisVersion = 41 
        MoveProtectionGroupToManualOperationNeeded = 42 
        FailoverBeforeCommit = 43 
        FailoverCommit = 44 

    }

    enum ZertoTaskStates {
        FirstUnusedValue = 0
        InProgress = 1
        WaitingForUserInput = 2
        Paused  = 3
        Failed = 4
        Stopped = 5
        Completed = 6
        Cancelling = 7
    }

    enum ZertoVPGSettingsBackupRetentionPeriod  {
        OneWeek     = 0
        OneMonth    = 1
        ThreeMonths = 2
        SixMonths   = 3
        NineMonths  = 4
        OneYear     = 5
    }   

    enum ZertoVPGSettingsBackupSchedulerDOW {
        Sunday    = 0
        Monday    = 1
        Tuesday   = 2
        Wednesday = 3
        Thursday  = 4
        Friday    = 5
        Saturday  = 6
    }   

    enum ZertoVPGSettingsBackupSchedulerPeriod  {
        Daily    = 0
        Weekly   = 1
    }    
#endregion

#region Zerto Classes

    class VPGFailoverIPAddress {
        [string] $NICName;
        [String] $NetworkID;
        [bool]   $ReplaceMAC;
        [bool]   $UseDHCP;
        [String] $IPAddress;
        [String] $SubnetMask;
        [String] $Gateway;
        [String] $DNS1;
        [String] $DNS2;
        [String] $DNSSuffix;
        [String] $TestNetworkID;
        [bool]   $TestReplaceMAC;
        [bool]   $TestUseDHCP;
        [String] $TestIPAddress;
        [String] $TestSubnetMask;
        [String] $TestGateway;
        [String] $TestDNS1;
        [String] $TestDNS2;
        [String] $TestDNSSuffix;


        #CTOR for default + DHCP
        VPGFailoverIPAddress ([string] $NICName, [String] $NetworkID, [bool] $ReplaceMAC, [bool] $UseDHCP, [String] $DNSSuffix, `
                             [String] $TestNetworkID, [bool] $TestReplaceMAC, [bool] $TestUseDHCP, [String] $TestDNSSuffix) {
            $this.NICName        = $NICName;
            $this.NetworkID      = $NetworkID;
            $this.ReplaceMAC     = $ReplaceMAC;
            $this.TestNetworkID  = $TestNetworkID;
            $this.TestReplaceMAC = $TestReplaceMAC;
            $this.UseDHCP        = $UseDHCP;
            $this.DNSSuffix      = $DNSSuffix;
            $this.TestUseDHCP    = $TestUseDHCP;
            $this.TestDNSSuffix  = $TestDNSSuffix;
        }

        #CTOR for default + IP
        VPGFailoverIPAddress ([string] $NICName, [String] $NetworkID, [bool] $ReplaceMAC,  `
                            [String] $IPAddress, [String] $Subnetmask, [String] $Gateway, `
                            [String] $DNS1, [String] $DNS2, [String] $DNSSuffix, `
                            [String] $TestNetworkID, [bool] $TestReplaceMAC, `
                            [String] $TestIPAddress, [String] $TestSubnetMask, [String] $TestGateway, `
                            [String] $TestDNS1, [String] $TestDNS2, [String] $TestDNSSuffix ) {
            $this.NICName        = $NICName;
            $this.NetworkID      = $NetworkID;
            $this.ReplaceMAC     = $ReplaceMAC;
            $this.TestNetworkID  = $TestNetworkID;
            $this.TestReplaceMAC = $TestReplaceMAC;
            $this.UseDHCP        = $false;
            $this.IPAddress      = $IPAddress;
            $this.Subnetmask     = $Subnetmask;
            $this.Gateway        = $Gateway;
            $this.DNS1           = $DNS1;
            $this.DNS2           = $DNS2;
            $this.DNSSuffix      = $DNSSuffix;
            $this.TestUseDHCP    = $false;
            $this.TestIPAddress  = $TestIPAddress;
            $this.TestSubnetMask = $TestSubnetMask;
            $this.TestGateway    = $TestGateway;
            $this.TestDNS1       = $TestDNS1;
            $this.TestDNS2       = $TestDNS2;
            $this.TestDNSSuffix =  $TestDNSSuffix;        }
        
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGFailoverIPAddress {
        #Parameter Sets
        # Default NICName Req, NetworkID,  ReplaceMAC, TestNetworkID TestReplaceMAC Optional
        #  1) DHCP req, FailDHCP optional
        #  3) IPaddress, Submet, Gateway, DNS1, DN2, DNSSUfix req, Test versions opt
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter NIC Name')]          [String] $NICName,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Network ID')]         [String] $NetworkID,
            [Parameter(Mandatory=$false, HelpMessage = 'Replace MAC Address')]      [Bool]   $ReplaceMAC = $false,
            [Parameter(Mandatory=$false, HelpMessage = 'Test Zerto Network ID')]    [String] $TestNetworkID,
            [Parameter(Mandatory=$false, HelpMessage = 'Test Replace MAC Address')] [Bool]   $TestReplaceMAC = $false,
            [Parameter(Mandatory=$true, HelpMessage = 'DNS Domain Suffix')]         [String] $DNSSuffix,
            [Parameter(Mandatory=$false, HelpMessage = 'Test DNS Domain Suffix')]   [String] $TestDNSSuffix,

            [Parameter(Mandatory=$true, HelpMessage = 'Use DHCP', ParameterSetName = 'DHCP')]           [switch] $UseDHCP,
            [Parameter(Mandatory=$false, HelpMessage = 'Use DHCP for test', ParameterSetName = 'DHCP')] [switch] $TestUseDHCP,

            [Parameter(Mandatory=$true, HelpMessage = 'IP Address', ParameterSetName = 'IP')]           [String] $IPAddress,
            [Parameter(Mandatory=$true, HelpMessage = 'Subnet Mask', ParameterSetName = 'IP')]          [String] $SubnetMask,
            [Parameter(Mandatory=$true, HelpMessage = 'Gateway', ParameterSetName = 'IP')]              [String] $Gateway,
            [Parameter(Mandatory=$true, HelpMessage = 'DNS Server 1', ParameterSetName = 'IP')]         [String] $DNS1,
            [Parameter(Mandatory=$true, HelpMessage = 'DNS Server 2', ParameterSetName = 'IP')]         [String] $DNS2,
            [Parameter(Mandatory=$false, HelpMessage = 'Test IP Address', ParameterSetName = 'IP')]     [String] $TestIPAddress,
            [Parameter(Mandatory=$false, HelpMessage = 'Test Subnet Mask', ParameterSetName = 'IP')]    [String] $TestSubnetMask,
            [Parameter(Mandatory=$false, HelpMessage = 'Test Gateway', ParameterSetName = 'IP')]        [String] $TestGateway,
            [Parameter(Mandatory=$false, HelpMessage = 'Test DNS Server 1', ParameterSetName = 'IP')]   [String] $TestDNS1,
            [Parameter(Mandatory=$false, HelpMessage = 'Test DNS Server 2', ParameterSetName = 'IP')]   [String] $TestDNS2
        )
        
        Write-Verbose $PSCmdlet.ParameterSetName
        If ($PSCmdlet.ParameterSetName -eq 'DHCP') {
            if (-not $UseDHCP) { throw "If UseDHCP is false, IP addresses must be specified" }
            [VPGFailoverIPAddress] $NewZertoIP = [VPGFailoverIPAddress]::new( $NICName, $NetworkID, $ReplaceMAC, $UseDHCP, $DNSSuffix, `
                                                                        $TestNetworkID, $TestReplaceMAC, $TestUseDHCP, $TestDNSSuffix);
        } else {
            try { $TestIP = [IPAddress]$IPAddress  } catch {throw "Invalid IP Address '$IPAddress'"}
            try { $TestIP = [IPAddress]$SubnetMask } catch {throw "Invalid Subnet Mask '$SubnetMask'"}
            try { $TestIP = [IPAddress]$Gateway    } catch {throw "Invalid Gateway '$Gateway'"}
            try { $TestIP = [IPAddress]$DNS1       } catch {throw "Invalid DNS1 '$DNS1'"}
            try { $TestIP = [IPAddress]$DNS2       } catch {throw "Invalid DNS2 '$DNS2'"}
            try { if ($TestIPAddress)  { $TestIP = [IPAddress]$TestIPAddress }  } catch {throw "Invalid Test IP Address '$TestPAddress'"}
            try { if ($TestSubnetMask) { $TestIP = [IPAddress]$TestSubnetMask } } catch {throw "Invalid Test Subnet Mask '$TestSubnetMask'"}
            try { if ($TestGateway)    { $TestIP = [IPAddress]$TestGateway }    } catch {throw "Invalid Test Gateway '$TestGateway'"}
            try { if ($TestDNS1)       { $TestIP = [IPAddress]$TestDNS1 }       } catch {throw "Invalid Test DNS1 '$TestDNS1'"}
            try { if ($TestDNS2)       { $TestIP = [IPAddress]$TestDNS2 }       } catch {throw "Invalid Test DNS2 '$TestDNS2'"}

            [VPGFailoverIPAddress] $NewZertoIP = [VPGFailoverIPAddress]::new( $NICName, $NetworkID, $ReplaceMAC, $IPAddress, `
                                                    $SubnetMask, $Gateway, $DNS1, $DNS2, $DNSSuffix, $TestNetworkID, $TestReplaceMAC, `
                                                    $TestIPAddress, $TestSubnetMask, $TestGateway, $TestDNS1, $TestDNS2, $TestDNSSuffix);
        }
        Return $NewZertoIP    
    }

    class VPGVMRecovery {
        [string] $DatastoreClusterIdentifier;
        [string] $DatastoreIdentifier;
        [string] $FolderIdentifier;
        [string] $HostClusterIdentifier;
        [string] $HostIdentifier;
        [string] $ResourcePoolIdentifier;

        VPGVMRecovery ([PSCustomObject] $Value) {
            $this.DatastoreClusterIdentifier = $Value.DatastoreClusterIdentifier;
            $this.DatastoreIdentifier = $Value.DatastoreIdentifier;     
            $this.FolderIdentifier = $Value.FolderIdentifier;
            $this.HostClusterIdentifier = $Value.HostClusterIdentifier;
            $this.HostIdentifier = $Value.HostIdentifier;
            $this.ResourcePoolIdentifier = $Value.ResourcePoolIdentifier;
        }    
        
        VPGVMRecovery ([string] $DatastoreClusterIdentifier, [string] $DatastoreIdentifier, [string] $FolderIdentifier, `
                        [string] $HostClusterIdentifier, [string] $HostIdentifier, [string] $ResourcePoolIdentifier) {
            $this.DatastoreClusterIdentifier = $DatastoreClusterIdentifier;
            $this.DatastoreIdentifier = $DatastoreIdentifier;     
            $this.FolderIdentifier = $FolderIdentifier;
            $this.HostClusterIdentifier = $HostClusterIdentifier;
            $this.HostIdentifier = $HostIdentifier;
            $this.ResourcePoolIdentifier = $ResourcePoolIdentifier;
        }        
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGVMRecovery {
        [CmdletBinding(DefaultParameterSetName = 'Individual')]
        param (
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'DatastoreClusterIdentifier')] [string] $DatastoreClusterIdentifier , 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'DatastoreIdentifier')] [string] $DatastoreIdentifier , 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'FolderIdentifier')] [string] $FolderIdentifier , 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'HostClusterIdentifier')] [string] $HostClusterIdentifier , 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'HostIdentifier')] [string] $HostIdentifier , 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'ResourcePoolIdentifier')] [string] $ResourcePoolIdentifier , 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGVMRecovery ')] [PSCustomObject] $VPGVMRecovery 
        )
        
        if (-not $VPGVMRecovery) {
            [VPGVMRecovery] $NewObj = [VPGVMRecovery]::New( $DatastoreClusterIdentifier, $DatastoreIdentifier, $FolderIdentifier, `
                                                            $HostClusterIdentifier, $HostIdentifier, $ResourcePoolIdentifier);

        } else {
            [VPGVMRecovery] $NewObj = [VPGVMRecovery]::New($VPGVMRecovery)
        }

        Return $NewObj
    }

    class VPGVirtualMachine {
        [string] $VMName;
        [VPGFailoverIPAddress[]] $VPGFailoverIPAddresses;
        [VPGVMRecovery] $VPGVMRecovery;
        #Add other parts of the VPG here

        #region base CTOR
        VPGVirtualMachine ([string] $VMName) {
            $this.VMName = $VMName;
            $this.VPGFailoverIPAddresses = @();
            #Initialize othe parts of the VPG here
        }
        #endregion

        #region CTOR with Addresses
        #VPGVirtualMachine ([string] $VMName, [FailoverIPAddress[]] $FailoverIPAddress ) {
        #    $this.VMName = $VMName;
        #    $this.FailoverIPAddresses = @();
        #    $FailoverIPAddress | ForEach-Object {
        #        $this.FailoverIPAddresses += $_
        #    }
        #}
        #endregion

        AddVPGFailoverIPAddress ([VPGFailoverIPAddress[]] $VPGFailoverIPAddresses) {
            $VPGFailoverIPAddresses | ForEach-Object {
                $this.VPGFailoverIPAddresses += $_
            }
        }
        AddVPGVMRecovery ([VPGVMRecovery] $VPGVMRecovery) {
            $this.VPGVMRecovery =  $VPGVMRecovery
        }

        #Add methods to add/update other parts of the VPG here
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGVirtualMachine {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Name')]     [String] $VMName,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto IPAddresses')]  [VPGFailoverIPAddress[]] $VPGFailoverIPAddress,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VM Recovery Object')]  [VPGVMRecovery] $VPGVMRecovery
            #Add other optional vpg components here
        )
        
        [VPGVirtualMachine] $NewZertoVM = [VPGVirtualMachine]::New($VMName);

        if ($VPGFailoverIPAddress)  {
            $NewZertoVM.AddVPGFailoverIPAddress($VPGFailoverIPAddress)
        }
        if ($VPGVMRecovery)  {
            $NewZertoVM.AddVPGVMRecovery($VPGVMRecovery)
        }
        #Add other optional vpg components Add's here

        Return $NewZertoVM    
    }

    class VRAIPAddressConfig {
            [String] $IPAddress;
            [String] $SubnetMask;
            [String] $Gateway;
            [string] $VRAIPType;

        #region base CTOR
        VRAIPAddressConfig ([String] $IPAddress, [String] $SubnetMask, [String] $Gateway, [ZertoVRAIPConfigType] $VRAIPType) {
            $this.IPAddress = $IPAddress;
            $this.SubnetMask = $SubnetMask;
            $this.Gateway = $Gateway;
            $this.VRAIPType = $VRAIPType.ToString();
        }
        #endregion
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVRAIPAddressConfig {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, HelpMessage = 'IP Address')]           [String] $IPAddress,
            [Parameter(Mandatory=$true, HelpMessage = 'Subnet Mask')]          [String] $SubnetMask,
            [Parameter(Mandatory=$true, HelpMessage = 'Gateway')]              [String] $Gateway,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VRA IP Config Type')] [ZertoVRAIPConfigType] $VRAIPType
        )
        
        try { $TestIP = [IPAddress]$IPAddress  } catch {throw "Invalid IP Address '$IPAddress'"}
        try { $TestIP = [IPAddress]$SubnetMask  } catch {throw "Invalid SubnetMask '$SubnetMask'"}
        try { $TestIP = [IPAddress]$Gateway  } catch {throw "Invalid Gateway '$Gateway'"}

        [VRAIPAddressConfig] $NewVRAIPAddressConfig = [VRAIPAddressConfig]::new( $IPAddress, $SubnetMask, $Gateway, $VRAIPType);
        Return $NewVRAIPAddressConfig    
    }

    class ZertoVPGSettingBackupRetry {
        [int] $IntervalInMinutes; 
        [int] $Number; 
        [bool] $Retry;
    
        ZertoVPGSettingBackupRetry ([PSCustomObject] $Value) {
            $this.IntervalInMinutes = $Value.IntervalInMinutes; 
            $this.Number = $Value.Number;
            $this.Retry = $Value.Retry;
        }    
        ZertoVPGSettingBackupRetry ([int] $IntervalInMinutes, [int] $Number, [bool] $Retry) {
            $this.IntervalInMinutes = $IntervalInMinutes; 
            $this.Number = $Number;
            $this.Retry = $Retry;
        }   
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingBackupRetry {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Number of minutes to wait on failure to retry backup')] [int] $IntervalInMinutes, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Number of retries')] [int] $Number, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Retry the backup if it fails')] [bool] $Retry, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Backup Retry')] [PSCustomObject] $VPGSettingBackupRetry
        )
        
        if (-not $VPGSettingBackupRetry) {
            if ($Number -lt 1) { throw "Number of Retries must be more than 1" }
            if ($IntervalInMinutes -lt 1) { throw "Retry Interval must be more than 1" }
            [ZertoVPGSettingBackupRetry] $NewObj = [ZertoVPGSettingBackupRetry]::New($IntervalInMinutes, $Number, $Retry);
        } else {
            if ($VPGSettingBackupRetry.Number -lt 1) { throw "Number of Retries must be more than 1" }
            if ($VPGSettingBackupRetry.IntervalInMinutes -lt 1) { throw "Retry Interval must be more than 1" }
            [ZertoVPGSettingBackupRetry] $NewObj = [ZertoVPGSettingBackupRetry]::New($VPGSettingBackupRetry)
        }

        Return $NewObj
    }
        
    class ZertoVPGSettingBackupScheduler {
        [string] $DayOfWeek; 
        [string] $SchedulerPeriod; 
        [string] $TimeOfDay;
    
        ZertoVPGSettingBackupScheduler ([PSCustomObject] $Value) {
            $this.DayOfWeek = $Value.DayOfWeek; 
            $this.SchedulerPeriod = $Value.SchedulerPeriod;
            $this.TimeOfDay = $Value.TimeOfDay;
        }    
        ZertoVPGSettingBackupScheduler ([ZertoVPGSettingsBackupSchedulerDOW] $DayOfWeek, [ZertoVPGSettingsBackupSchedulerPeriod] $SchedulerPeriod, [string] $TimeOfDay) {
            $this.DayOfWeek = $DayOfWeek.ToString(); 
            $this.SchedulerPeriod = $SchedulerPeriod.ToString();
            $this.TimeOfDay = $TimeOfDay;
        }   
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingBackupScheduler {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Day of week the backup will run')] [ZertoVPGSettingsBackupSchedulerDOW] $DayOfWeek, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Scheduler Period (Daily|Weekly)')] [ZertoVPGSettingsBackupSchedulerPeriod] $SchedulerPeriod, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Time of day (24 hour in form 23:59)')] [string] $TimeOfDay, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Backup Scheduler')] [PSCustomObject] $VPGSettingBackupScheduler
        )
        
        if (-not $VPGSettingBackupScheduler) {
            if (-not ($TimeOfDay -match "^\d\d:\d\d$") )  { throw "Time Of Day must be in the form '23:59'" }
            if ( ($TimeOfDay.Split(':')[0] -lt 0 ) `
                 -OR ($TimeOfDay.Split(':')[0] -gt 23 ) `
                 -OR ($TimeOfDay.Split(':')[1] -lt 0 ) `
                 -OR ($TimeOfDay.Split(':')[1] -gt 59 )  ) { throw "Time Of Day must be in the form '00:00' through '23:59'" }


            [ZertoVPGSettingBackupScheduler] $NewObj = [ZertoVPGSettingBackupScheduler]::New($DayOfWeek, $SchedulerPeriod, $TimeOfDay);
        } else {
            if (-not ($VPGSettingBackupScheduler.TimeOfDay -match "^\d\d:\d\d$") )  { throw "Time Of Day must be in the form '23:59'" }
            if ( ($VPGSettingBackupScheduler.TimeOfDay.Split(':')[0] -lt 0 ) `
                 -OR ($VPGSettingBackupScheduler.TimeOfDay.Split(':')[0] -gt 23 ) `
                 -OR ($VPGSettingBackupScheduler.TimeOfDay.Split(':')[1] -lt 0 ) `
                 -OR ($VPGSettingBackupScheduler.TimeOfDay.Split(':')[1] -gt 59 )  ) { throw "Time Of Day must be in the form '00:00' through '23:59'" }
            [ZertoVPGSettingBackupScheduler] $NewObj = [ZertoVPGSettingBackupScheduler]::New($VPGSettingBackupScheduler)
        }

        Return $NewObj        
    }

    class ZertoVPGSettingBackup {
        [string] $RepositoryIdentifier; 
        [string] $RetentionPeriod; 
        [ZertoVPGSettingBackupRetry] $Retry;
        [ZertoVPGSettingBackupScheduler] $Scheduler;
    
        ZertoVPGSettingBackup ([PSCustomObject] $Value) {
            $this.RepositoryIdentifier = $Value.RepositoryIdentifier; 
            $this.RetentionPeriod = $Value.RetentionPeriod; 
            $this.Retry = $Value.Retry; 
            $this.Scheduler = $Value.Scheduler; 
        }    
        ZertoVPGSettingBackup ([string] $RepositoryIdentifier, [ZertoVPGSettingsBackupRetentionPeriod] $RetentionPeriod, [ZertoVPGSettingBackupRetry] $Retry, [ZertoVPGSettingBackupScheduler] $Scheduler ) {
            $this.RepositoryIdentifier = $RepositoryIdentifier; 
            $this.RetentionPeriod = $RetentionPeriod.ToString(); 
            $this.Retry = $Retry; 
            $this.Scheduler = $Scheduler; 
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingBackup {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Backup Repository ID')] [string] $RepositoryIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Retention Period')] [ZertoVPGSettingsBackupRetentionPeriod] $RetentionPeriod, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Retry')] [ZertoVPGSettingBackupRetry] $Retry, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Scheduler')] [ZertoVPGSettingBackupScheduler] $Scheduler, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Backup')] [PSCustomObject] $VPGSettingBackup
        )
        
        if (-not $VPGSettingBackup) {
            [ZertoVPGSettingBackup] $NewObj = [ZertoVPGSettingBackup]::New($RepositoryIdentifier, $RetentionPeriod, $Retry, $Scheduler);
        } else {
            [ZertoVPGSettingBackup] $NewObj = [ZertoVPGSettingBackup]::New($VPGSettingBackup)
        }

        Return $NewObj
    }

    Class ZertoVPGSettingBasic {
        [int] $JournalHistoryInHours; 
        [string] $Name; 
        [ZertoVPGPriority] $Priority; 
        [string] $ProtectedSiteIdentifier; 
        [string] $RecoverySiteIdentifier; 
        [int] $RpoInSeconds; 
        [string] $ServiceProfileIdentifier;
        [int] $TestIntervalInMinutes; 
        [Boolean] $UseWanCompression; 
        [string] $ZorgIdentifier; 

        ZertoVPGSettingBasic ([PSCustomObject] $Value) {
            $this.JournalHistoryInHours = $Value.JournalHistoryInHours;                                                
            $this.Name = $Value.Name;                   
            $this.Priority = $Value.Priority; 
            $this.ProtectedSiteIdentifier = $Value.ProtectedSiteIdentifier; 
            $this.RecoverySiteIdentifier = $Value.RecoverySiteIdentifier; 
            $this.RpoInSeconds = $Value.RpoInSeconds;                 
            $this.ServiceProfileIdentifier = $Value.ServiceProfileIdentifier | StringOrNull; 

            $this.TestIntervalInMinutes = $Value.TestIntervalInMinutes;        
            $this.UseWanCompression = $Value.UseWanCompression;    
            $this.ZorgIdentifier = $Value.ZorgIdentifier | StringOrNull; 
        }    
        ZertoVPGSettingBasic ([int] $JournalHistoryInHours, [string] $Name, [ZertoVPGPriority] $Priority, [string] $ProtectedSiteIdentifier, `
                            [string] $RecoverySiteIdentifier, [int] $RpoInSeconds, [string] $ServiceProfileIdentifier, `
                            [int] $TestIntervalInMinutes, [Boolean] $UseWanCompression, [string] $ZorgIdentifier) {
            $this.JournalHistoryInHours = $JournalHistoryInHours; 
            $this.Name = $Name;
            $this.Priority = $Priority;
            $this.ProtectedSiteIdentifier = $ProtectedSiteIdentifier;
            $this.RecoverySiteIdentifier = $RecoverySiteIdentifier;
            $this.RpoInSeconds = $RpoInSeconds;
            $this.ServiceProfileIdentifier = $ServiceProfileIdentifier | StringOrNull; 
            $this.TestIntervalInMinutes = $TestIntervalInMinutes;
            $this.UseWanCompression = $UseWanCompression;
            $this.ZorgIdentifier = $ZorgIdentifier | StringOrNull; 
        }                 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingBasic {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Name')] [string] $Name, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Protected Site Identifier')] [string] $ProtectedSiteIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Protected Site Identifier')] [string] $RecoverySiteIdentifier, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Journal History In Hours')] [int] $JournalHistoryInHours=24, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Priority')] [ZertoVPGPriority] $Priority = 'Medium', 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Zerto RPO in Seconds')] [int] $RpoInSeconds = 300, 
            [Parameter(Mandatory=$false , ParameterSetName="Individual", HelpMessage  = 'Zerto Service Profile Identifier')] [string] $ServiceProfileIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Test Interval In Minutes')] [int] $TestIntervalInMinutes = 262080,
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Use Wan Compression')] [Boolean] $UseWanCompression = $true, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Zorg Identifier')] [string] $ZorgIdentifier,
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Basic')] [PSCustomObject] $VPGSettingBasic

        )
        
        if (-not $VPGSettingBasic) {
            if ( $JournalHistoryInHours -lt 1 ) { throw "Journal history must be greather then 0 - '$JournalHistoryInHours'"}
            if ( $TestIntervalInMinutes -lt 1 ) { throw "Test Interval In Minutes must be greather then 0 - '$TestIntervalInMinutes'"}
            if ( $RpoInSeconds -lt 1 ) { throw "RpoInSeconds  must be greather then 0 - '$RpoInSeconds'"}
            [ZertoVPGSettingBasic] $NewObj = [ZertoVPGSettingBasic]::New($JournalHistoryInHours, $Name, $Priority, `
                                                                        $ProtectedSiteIdentifier, $RecoverySiteIdentifier, $RpoInSeconds, `
                                                                        $ServiceProfileIdentifier, $TestIntervalInMinutes, $UseWanCompression, `
                                                                        $ZorgIdentifier );
        } else {
            if ( $VPGSettingBasic.JournalHistoryInHours -lt 1 ) { throw "Journal history must be greather then 0 - '$VPGSettingBasic.JournalHistoryInHours'"}
            if ( $VPGSettingBasic.TestIntervalInMinutes -lt 1 ) { throw "Test Interval In Minutes must be greather then 0 - '$VPGSettingBasic.TestIntervalInMinutes'"}
            if ( $VPGSettingBasic.RpoInSeconds -lt 1 ) { throw "RpoInSeconds  must be greather then 0 - '$VPGSettingBasic.RpoInSeconds'"}
            [ZertoVPGSettingBasic] $NewObj = [ZertoVPGSettingBasic]::New($VPGSettingBasic)
        }

        Return $NewObj       
    }

    Class ZertoVPGSettingBootGroupsBootGroups {
        [int] $BootDelayInSeconds; 
        [string] $BootGroupIdentifier; 
        [string] $Name;

        ZertoVPGSettingBootGroupsBootGroups ([PSCustomObject] $Value) {
            $this.BootDelayInSeconds = $Value.BootDelayInSeconds;
            $this.BootGroupIdentifier = $Value.BootGroupIdentifier | StringOrNull; ;
            $this.Name = $Value.Name;
        }    
        ZertoVPGSettingBootGroupsBootGroups ([int] $BootDelayInSeconds, [string] $BootGroupIdentifier, [string] $Name ) {
            $this.BootDelayInSeconds = $BootDelayInSeconds;
            $this.BootGroupIdentifier = $BootGroupIdentifier | StringOrNull; ; 
            $this.Name = $Name;
        }                 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingBootGroupsBootGroups {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'BootDelayInSeconds')] [int] $BootDelayInSeconds, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Boot Group Identifier')] [string] $BootGroupIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Boot Group Name')] [string] $Name, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Bootgroups Bootgroups')] [PSCustomObject] $VPGSettingBootgroupsBootGroups
        )
        
        if (-not $VPGSettingBootgroupsBootgroups) {
            if ( $BootDelayInSeconds -lt 1 ) { throw "BootDelayInSeconds must be greather then 0 - '$BootDelayInSeconds'"}
            [ZertoVPGSettingBootGroupsBootGroups] $NewObj = [ZertoVPGSettingBootGroupsBootGroups]::New($BootDelayInSeconds, $BootGroupIdentifier, $Name );
        } else {
            if ( $VPGSettingBootgroup.BootDelayInSeconds -lt 1 ) { throw "BootDelayInSeconds must be greather then 0 - '$VPGSettingBootgroup.BootDelayInSeconds'"}
            [ZertoVPGSettingBootGroupsBootGroups] $NewObj = [ZertoVPGSettingBootGroupsBootGroups]::New($VPGSettingBootgroupsBootGroups)
        }

        Return $NewObj
    }

    Class ZertoVPGSettingBootGroups {
        [ZertoVPGSettingBootGroupsBootGroups[]] $BootGroups; 

        ZertoVPGSettingBootGroups ([PSCustomObject] $Value) {
            $this.BootGroups = $Value.BootGroups;
        }    
        ZertoVPGSettingBootGroups ([ZertoVPGSettingBootGroupsBootGroups[]] $BootGroups ) {
            $this.BootGroups = $BootGroups;
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingBootGroups {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'ZertoVPGSettingBootgroup')] [ZertoVPGSettingBootGroups[]] $BootGroups,
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Bootgroup')] [PSCustomObject] $VPGSettingBootGroups
        )
        
        if (-not $VPGSettingBootGroups) {
            [ZertoVPGSettingBootGroups] $NewObj = [ZertoVPGSettingBootGroups]::New( $Bootgroups );
        } else {
            [ZertoVPGSettingBootGroups] $NewObj = [ZertoVPGSettingBootGroups]::New($VPGSettingBootGroups)
        }

        Return $NewObj
    }

    Class ZertoVPGSettingJournalLimitation {
        [int] $HardLimitInMB; 
        [int] $HardLimitInPercent; 
        [int] $WarningThresholdInMB;
        [int] $WarningThresholdInPercent;

        ZertoVPGSettingJournalLimitation ([PSCustomObject] $Value) {
            $this.HardLimitInMB = $Value.HardLimitInMB;                                                
            $this.HardLimitInPercent = $Value.HardLimitInPercent;                                                
            $this.WarningThresholdInMB = $Value.WarningThresholdInMB;                                                
            $this.WarningThresholdInPercent = $Value.WarningThresholdInPercent;                                                
        }    
        ZertoVPGSettingJournalLimitation ([int] $HardLimitInMB, [int] $HardLimitInPercent, [int] $WarningThresholdInMB, [int] $WarningThresholdInPercent ) {
            $this.HardLimitInMB = $HardLimitInMB;                                                
            $this.HardLimitInPercent = $HardLimitInPercent;                                                
            $this.WarningThresholdInMB = $WarningThresholdInMB;                                                
            $this.WarningThresholdInPercent = $WarningThresholdInPercent;                    
        }                 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingJournalLimitation {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'HardLimitInMB')] [int] $HardLimitInMB = 153600,
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'HardLimitInPercent')] [int] $HardLimitInPercent, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'WarningThresholdInMB')] [int] $WarningThresholdInMB = 115200, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'WarningThresholdInPercent')] [int] $WarningThresholdInPercent, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Journal Limitation')] [PSCustomObject] $VPGSettingJournalLimitation
        )
        
        if (-not $VPGSettingJournalLimitation) {
            if ( $HardLimitInMB -lt 0 ) { throw "HardLimitInMB must be greather then 0 - '$HardLimitInMB'"}
            if ( ($HardLimitInPercent -lt 0) -or ($HardLimitInPercent -gt 100 ) ) { throw "HardLimitInPercent must be between 0 and 100  - '$HardLimitInPercent'"}
            if ( $WarningThresholdInMB -lt 0 ) { throw "WarningThresholdInMB must be greather then 0 - '$WarningThresholdInMB'"}
            if ( ($WarningThresholdInPercent -lt 0) -or ($WarningThresholdInPercent -gt 100 ) ) { throw "WarningThresholdInPercent must be between 0 and 100  - '$WarningThresholdInPercent'"}
            [ZertoVPGSettingJournalLimitation] $NewObj = [ZertoVPGSettingJournalLimitation]::New($HardLimitInMB, $HardLimitInPercent, $WarningThresholdInMB,  $WarningThresholdInPercent);
        } else {
            if ( $VPGSettingJournalLimitation.HardLimitInMB -lt 0 ) { throw "HardLimitInMB must be greather then 0 - '$VPGSettingJournalLimitation.HardLimitInMB'"}
            if ( ($VPGSettingJournalLimitation.HardLimitInPercent -lt 0) -or ($VPGSettingJournalLimitation.HardLimitInPercent -gt 100 ) ) { throw "HardLimitInPercent must be between 0 and 100  - '$VPGSettingJournalLimitation.HardLimitInPercent'"}
            if ( $VPGSettingJournalLimitation.WarningThresholdInMB -lt 0 ) { throw "WarningThresholdInMB must be greather then 0 - '$VPGSettingJournalLimitation.WarningThresholdInMB'"}
            if ( ($VPGSettingJournalLimitation.WarningThresholdInPercent -lt 0) -or ($VPGSettingJournalLimitation.WarningThresholdInPercent -gt 100 ) ) { throw "WarningThresholdInPercent must be between 0 and 100  - '$VPGSettingJournalLimitation.WarningThresholdInPercent'"}
            [ZertoVPGSettingJournalLimitation] $NewObj = [ZertoVPGSettingJournalLimitation]::New($VPGSettingJournalLimitation)
        }

        Return $NewObj        
    }

    Class ZertoVPGSettingJournal{
        [string] $DatastoreClusterIdentifier; 
        [string] $DatastoreIdentifier; 
        [ZertoVPGSettingJournalLimitation] $Limitation;

        ZertoVPGSettingJournal ([PSCustomObject] $Value) {
            $this.DatastoreClusterIdentifier = $Value.DatastoreClusterIdentifier | StringOrNull;                                                 
            $this.DatastoreIdentifier = $Value.DatastoreIdentifier | StringOrNull; 
            $this.Limitation = $Value.Limitation;                   
        }    
        ZertoVPGSettingJournal ([string] $DatastoreClusterIdentifier, [string] $DatastoreIdentifier, [ZertoVPGSettingJournalLimitation] $Limitation) {
            $this.DatastoreClusterIdentifier = $DatastoreClusterIdentifier | StringOrNull;                                                 
            $this.DatastoreIdentifier = $DatastoreIdentifier | StringOrNull; 
            $this.Limitation = $Limitation;                   
        }                 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingJournal {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'DatastoreClusterIdentifier')] [string] $DatastoreClusterIdentifier, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'DatastoreIdentifier')] [string] $DatastoreIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VPG Setting Journal Limitation object')] [ZertoVPGSettingJournalLimitation] $Limitation, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Journal ')] [PSCustomObject] $VPGSettingJournal
        )
        
        if (-not $VPGSettingJournal) {
            [ZertoVPGSettingJournal] $NewObj = [ZertoVPGSettingJournal]::New($DatastoreClusterIdentifier, $DatastoreIdentifier, $Limitation);
        } else {
            [ZertoVPGSettingJournal] $NewObj = [ZertoVPGSettingJournal]::New($VPGSettingJournal)
        }

        Return $NewObj
    }

    class ZertoVPGSettingNetworksNetworkHypervisor  {
        [String] $DefaultNetworkIdentifier;

        ZertoVPGSettingNetworksNetworkHypervisor ([PSCustomObject] $Value) {
            $this.DefaultNetworkIdentifier = $Value.DefaultNetworkIdentifier | StringOrNull; ; 
        }    
        ZertoVPGSettingNetworksNetworkHypervisor ([string] $DefaultNetworkIdentifier) {
            $this.DefaultNetworkIdentifier = $DefaultNetworkIdentifier | StringOrNull; ; 
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingNetworksNetworkHypervisor {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'DefaultNetworkIdentifier')]   [string] $DefaultNetworkIdentifier = $null,
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Networking Network Hypervisor object')] [PSCustomObject] $VPGSettingNetworkingNetworkHypervisor
        )
        
        if (-not $VPGSettingNetworkingNetworkHypervisor) {
            [ZertoVPGSettingNetworksNetworkHypervisor] $NewObj = [ZertoVPGSettingNetworksNetworkHypervisor]::New($DefaultNetworkIdentifier);
        } else {
            [ZertoVPGSettingNetworksNetworkHypervisor] $NewObj = [ZertoVPGSettingNetworksNetworkHypervisor]::New($VPGSettingNetworkingNetworkHypervisor)
        }

        Return $NewObj
    }

    class ZertoVPGSettingNetworksNetwork {
        [ZertoVPGSettingNetworksNetworkHypervisor] $Hypervisor;

        ZertoVPGSettingNetworksNetwork ([PSCustomObject] $Value) {
            $this.Hypervisor = $Value.Hypervisor; 
        }    
        ZertoVPGSettingNetworksNetwork ([ZertoVPGSettingNetworksNetworkHypervisor] $Hypervisor) {
            $this.Hypervisor = $Hypervisor; 
        }  
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingNetworksNetwork {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Hypervisor')] [ZertoVPGSettingNetworksNetworkHypervisor] $Hypervisor,
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'ZertoVPGSettingNetworksNetworkHypervisor object')] [PSCustomObject] $VPGSettingNetworksNetwork
        )
        
        if (-not $VPGSettingNetworksNetwork) {
            [ZertoVPGSettingNetworksNetwork] $NewObj = [ZertoVPGSettingNetworksNetwork]::New($Hypervisor);
        } else {
            [ZertoVPGSettingNetworksNetwork] $NewObj = [ZertoVPGSettingNetworksNetwork]::New($VPGSettingNetworksNetwork)
        }

        Return $NewObj
    }

    class ZertoVPGSettingNetworks {
        [ZertoVPGSettingNetworksNetwork] $Failover;
        [ZertoVPGSettingNetworksNetwork] $FailoverTest;

        ZertoVPGSettingNetworks ([PSCustomObject] $Value) {
            $this.Failover = $Value.Failover; 
            $this.FailoverTest = $Value.FailoverTest; 
        }    
        ZertoVPGSettingNetworks ([ZertoVPGSettingNetworksNetwork] $Failover, [ZertoVPGSettingNetworksNetwork] $FailoverTest) {
            $this.Failover = $Failover; 
            $this.FailoverTest = $FailoverTest; 
        }  
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingNetworks {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Network Failover object')] [ZertoVPGSettingNetworksNetwork] $Failover, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Network FailoverTest object')] [ZertoVPGSettingNetworksNetwork] $FailoverTest, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Network')] [PSCustomObject] $VPGSettingNetworks
        )
        
        if (-not $VPGSettingNetworks) {
            #Reset Null Networks
            if ($Failover -eq $null) { $Failover = New-ZertoVPGSettingNetworkHypervisor -DefaultNetworkIdentifier $null }
            if ($FailoverTest -eq $null) { $FailoverTest = New-ZertoVPGSettingNetworkHypervisor -DefaultNetworkIdentifier $null }
            [ZertoVPGSettingNetworks] $NewObj = [ZertoVPGSettingNetworks]::New($Failover, $FailoverTest);
        } else {
            if ($VPGSettingNetworks.Failover -eq $null) { $VPGSettingNetworks.Failover = New-ZertoVPGSettingNetworkHypervisor -DefaultNetworkIdentifier $null }
            if ($VPGSettingNetworks.FailoverTest -eq $null) { $VPGSettingNetworks.FailoverTest = New-ZertoVPGSettingNetworkHypervisor -DefaultNetworkIdentifier $null }
            [ZertoVPGSettingNetworks] $NewObj = [ZertoVPGSettingNetworks]::New($VPGSettingNetworks)
        }

        Return $NewObj
    }

    Class ZertoVPGSettingRecovery {
        [string] $DefaultDatastoreIdentifier; 
        [string] $DefaultFolderIdentifier; 
        [string] $DefaultHostClusterIdentifier; 
        [string] $DefaultHostIdentifier; 
        [string] $ResourcePoolIdentifier; 

        ZertoVPGSettingRecovery ([PSCustomObject] $Value) {
            $this.DefaultDatastoreIdentifier = $Value.DefaultDatastoreIdentifier | StringOrNull;
            $this.DefaultFolderIdentifier = $Value.DefaultFolderIdentifier | StringOrNull; 
            $this.DefaultHostClusterIdentifier = $Value.DefaultHostClusterIdentifier | StringOrNull;  
            $this.DefaultHostIdentifier = $Value.DefaultHostIdentifier | StringOrNull; 
            $this.ResourcePoolIdentifier = $Value.ResourcePoolIdentifier | StringOrNull; 
        }    
        ZertoVPGSettingRecovery ([string] $DefaultDatastoreIdentifier, [string] $DefaultFolderIdentifier, [string] $DefaultHostClusterIdentifier, `
                            [string] $DefaultHostIdentifier, [string] $ResourcePoolIdentifier ) {
            #Handle the nulls.  PS converts a $null in a [string] as a string.empty. 
            $this.DefaultDatastoreIdentifier = $DefaultDatastoreIdentifier | StringOrNull; 
            $this.DefaultFolderIdentifier = $DefaultFolderIdentifier | StringOrNull; 
            $this.DefaultHostClusterIdentifier = $DefaultHostClusterIdentifier | StringOrNull; 
            $this.DefaultHostIdentifier = $DefaultHostIdentifier | StringOrNull; 
            $this.ResourcePoolIdentifier = $ResourcePoolIdentifier | StringOrNull; 
        }                 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingRecovery {
        [CmdletBinding(DefaultParameterSetName = 'Individual')]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Datastore Identifier')] [string] $DefaultDatastoreIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Folder Identifier')] [string] $DefaultFolderIdentifier, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Zerto Host Cluster Identifier')] [string] $DefaultHostClusterIdentifier = $null, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Zerto Host Identifier')] [string] $DefaultHostIdentifier = $null, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Zerto Resource Pool Identifier')] [string] $ResourcePoolIdentifier = $null, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Recovery')] [PSCustomObject] $VPGSettingRecovery
        )
        
        if (-not $VPGSettingRecovery) {

            [ZertoVPGSettingRecovery] $NewObj = [ZertoVPGSettingRecovery]::New($DefaultDatastoreIdentifier, $DefaultFolderIdentifier, `
                                                $DefaultHostClusterIdentifier, $DefaultHostIdentifier, $ResourcePoolIdentifier );
        } else {

            [ZertoVPGSettingRecovery] $NewObj = [ZertoVPGSettingRecovery]::New($VPGSettingRecovery)
        }

        Return $NewObj
    }

    class ZertoVPGSettingScript {
        [String] $Command;
        [string] $Parameters;
        [int] $TimeoutInSeconds;

        ZertoVPGSettingScript ([PSCustomObject] $Value) {
            $this.Command = $Value.Command | StringOrNull; 
            $this.Parameters = $Value.Parameters | StringOrNull;
            $this.TimeoutInSeconds = $Value.TimeoutInSeconds;  
        }    
        ZertoVPGSettingScript ([string] $Command, [string] $Parameters, [int] $TimeoutInSeconds ) {
            $this.Command = $Command | StringOrNull; 
            $this.Parameters = $Parameters | StringOrNull; 
            $this.TimeoutInSeconds = $TimeoutInSeconds; 
        }  

    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingScript {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Command')] [AllowNull()]  [AllowEmptyString()]  [string] $Command, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Parameters')] [AllowNull()]  [AllowEmptyString()] [string] $Parameters, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Timeout In Seconds')] [int] $TimeoutInSeconds = 300, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Script object')] [PSCustomObject] $VPGSettingScript
        )
        
        if (-not $VPGSettingScript) {
            if ( ($TimeoutInSeconds -lt 300) -or ($TimeoutInSeconds -gt 6000) ) { throw "TimeoutInSeconds must be between 300 & 6000 " }
            [ZertoVPGSettingScript] $NewObj = [ZertoVPGSettingScript]::New($Command, $Parameters, $TimeoutInSeconds);
        } else {
            if ( ($VPGSettingScript.TimeoutInSeconds -lt 300) -or ($VPGSettingScript.TimeoutInSeconds -gt 6000) ) { throw "TimeoutInSeconds must be between 300 & 6000 " }
            [ZertoVPGSettingScript] $NewObj = [ZertoVPGSettingScript]::New($VPGSettingScript)
        }

        Return $NewObj
    }

    class ZertoVPGSettingScripting {
        [ZertoVPGSettingScript] $PostBackup;
        [ZertoVPGSettingScript] $PostRecovery;
        [ZertoVPGSettingScript] $PreRecovery;

        ZertoVPGSettingScripting ([PSCustomObject] $Value) {
            $this.PostBackup = $Value.PostBackup; 
            $this.PostRecovery = $Value.PostRecovery; 
            $this.PreRecovery = $Value.PreRecovery; 
        }    
        ZertoVPGSettingScripting ([ZertoVPGSettingScript] $PostBackup, [ZertoVPGSettingScript] $PostRecovery, [ZertoVPGSettingScript] $PreRecovery ) {
            $this.PostBackup = $PostBackup; 
            $this.PostRecovery = $PostRecovery; 
            $this.PreRecovery = $PreRecovery; 
        }  
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingScripting {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'PostBackup script object')] [ZertoVPGSettingScript] $PostBackup, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'PostRecovery script object')] [ZertoVPGSettingScript] $PostRecovery, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'PreRecovery script object')] [ZertoVPGSettingScript] $PreRecovery, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Scripting')] [PSCustomObject] $VPGSettingScripting
        )
        
        if (-not $VPGSettingScripting) {
            #Reset Null scripts
            if ($PostRecovery -eq $null) { $PostRecovery = New-ZertoVPGSettingScript -Command $null -Parameters $null }
            if ($PreRecovery -eq $null) { $PreRecovery = New-ZertoVPGSettingScript -Command $null -Parameters $null }
            [ZertoVPGSettingScripting] $NewObj = [ZertoVPGSettingScripting]::New($PostBackupCommand, $PostRecovery, $PreRecovery);
        } else {
            if ($VPGSettingScripting.PostRecovery -eq $null) { $VPGSettingScripting.PostRecovery = New-ZertoVPGSettingScript -Command $null -Parameters $null }
            if ($VPGSettingScripting.PreRecovery -eq $null) { $VPGSettingScripting.PreRecovery = New-ZertoVPGSettingScript -Command $null -Parameters $null }
            [ZertoVPGSettingScripting] $NewObj = [ZertoVPGSettingScripting]::New($VPGSettingScripting)
        }

        Return $NewObj
    }

    class ZertoVPGSettingVMNicNetworkHypervisorIpConfig {
        [string] $Gateway;
        [bool] $IsDhcp; 
        [string] $PrimaryDns; 
        [string] $SecondaryDns;
        [string] $StaticIp; 
        [string] $SubnetMask; 

        ZertoVPGSettingVMNicNetworkHypervisorIpConfig ([PSCustomObject] $Value) {
            $this.Gateway = $value.Gateway;
            $this.IsDhcp = $value.IsDhcp;
            $this.PrimaryDns = $value.PrimaryDns;
            $this.SecondaryDns = $value.SecondaryDns;
            $this.StaticIp = $value.StaticIp;
            $this.SubnetMask = $value.SubnetMask;
        }
        ZertoVPGSettingVMNicNetworkHypervisorIpConfig ([string] $Gateway,
                                    [bool] $IsDhcp, 
                                    [string] $PrimaryDns,
                                    [string] $SecondaryDns,
                                    [string] $StaticIp,
                                    [string] $SubnetMask ) {
            $this.Gateway = $Gateway;
            $this.IsDhcp = $IsDhcp;
            $this.PrimaryDns = $PrimaryDns;
            $this.SecondaryDns = $SecondaryDns;
            $this.StaticIp = $StaticIp;
            $this.SubnetMask = $SubnetMask;
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingVMNicNetworkHypervisorIpConfig {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'IsDHCP')] [bool] $IsDhcp = $false,
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'StaticIp')] [string] $StaticIp,
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'SubnetMask')] [string] $SubnetMask,
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Gateway')] [string] $Gateway ="",
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'PrimaryDNS')] [string] $PrimaryDNS ="",
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'SecondaryDns')] [string] $SecondaryDns= "",
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting VM NIC Network object')] [PSCustomObject] $VPGSettingVMNicNetworkHypervisorIpConfig
        )

        if (-not $VPGSettingVMNicNetworkHypervisorIpConfig) {
            [ZertoVPGSettingVMNicNetworkHypervisorIpConfig] $NewObj = [ZertoVPGSettingVMNicNetworkHypervisorIpConfig]::New( $Gateway,
                                                                                                                        $IsDhcp, 
                                                                                                                        $PrimaryDns,
                                                                                                                        $SecondaryDns,
                                                                                                                        $StaticIp,
                                                                                                                        $SubnetMask );
        } else {
            [ZertoVPGSettingVMNicNetworkHypervisorIpConfig] $NewObj = [ZertoVPGSettingVMNicNetworkHypervisorIpConfig]::New($VPGSettingVMNicNetworkHypervisorIpConfig)
        }

        Return $NewObj
    }  

    class ZertoVPGSettingVMNicNetworkHypervisor {
        [string] $DnsSuffix;
        [ZertoVPGSettingVMNicNetworkHypervisorIpConfig] $IpConfig;
        [string] $NetworkIdentifier;
        [bool] $ShouldReplaceMacAddress;

        ZertoVPGSettingVMNicNetworkHypervisor ([PSCustomObject] $Value) {
            $this.DnsSuffix = $Value.DnsSuffix | StringOrNull; 
            $this.IpConfig = $Value.IpConfig; 
            $this.NetworkIdentifier = $Value.NetworkIdentifier | StringOrNull; ; 
            $this.ShouldReplaceMacAddress = $Value.ShouldReplaceMacAddress; 
        }
        ZertoVPGSettingVMNicNetworkHypervisor ([string] $DnsSuffix, 
                                    [ZertoVPGSettingVMNicNetworkHypervisorIpConfig] $IpConfig, 
                                    [string] $NetworkIdentifier, 
                                    [bool] $ShouldReplaceMacAddress) {
            $this.DnsSuffix = $DnsSuffix | StringOrNull; 
            $this.IpConfig = $IpConfig; 
            $this.NetworkIdentifier = $NetworkIdentifier | StringOrNull; ; 
            $this.ShouldReplaceMacAddress = $ShouldReplaceMacAddress; 
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingVMNicNetworkHypervisor {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'DNS Suffix')] [string] $DnsSuffix, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VPGSetting VM NIC Network Hypervisor IpConfig object')] [ZertoVPGSettingVMNicNetworkHypervisorIpConfig] $IpConfig, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VPGSetting VM NIC Network ID')] [string] $NetworkIdentifier,
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Should Replace MacAddress')] [bool] $ShouldReplaceMacAddress, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting VM NIC Network object')] [PSCustomObject] $VPGSettingVMNicNetworkHypervisor
        )

        if (-not $VPGSettingVMNicNetworkHypervisor) {
            [ZertoVPGSettingVMNicNetworkHypervisor] $NewObj = [ZertoVPGSettingVMNicNetworkHypervisor]::New($Hypervisor);
        } else {
            [ZertoVPGSettingVMNicNetworkHypervisor] $NewObj = [ZertoVPGSettingVMNicNetworkHypervisor]::New($VPGSettingVMNicNetwork)
        }

        Return $NewObj
    }  

    class ZertoVPGSettingVMNicNetwork {
        [ZertoVPGSettingVMNicNetworkHypervisor] $Hypervisor;

        ZertoVPGSettingVMNicNetwork ([PSCustomObject] $Value) {
            $this.Hypervisor = $Value.Hypervisor; 
        }
        ZertoVPGSettingVMNicNetwork ([ZertoVPGSettingVMNicNetworkHypervisor] $Hypervisor) {
            $this.Hypervisor = $Hypervisor; 
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingVMNicNetwork {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VPGSetting VM NIC Network Hypervisor')] [ZertoVPGSettingVMNicNetworkHypervisor] $Hypervisor, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting VM NIC Network object')] [PSCustomObject] $VPGSettingVMNicNetwork
        )

        if (-not $VPGSettingVMNicNetwork) {
            [ZertoVPGSettingVMNicNetwork] $NewObj = [ZertoVPGSettingVMNicNetwork]::New($Hypervisor);
        } else {
            [ZertoVPGSettingVMNicNetwork] $NewObj = [ZertoVPGSettingVMNicNetwork]::New($VPGSettingVMNicNetwork)
        }

        Return $NewObj
    }    

    class ZertoVPGSettingVMNic {
        [ZertoVPGSettingVMNicNetwork] $Failover;
        [ZertoVPGSettingVMNicNetwork] $FailoverTest;
        [string] $NicIdentifier;


        ZertoVPGSettingVMNic ([PSCustomObject] $Value) {
            $this.NicIdentifier = $Value.NicIdentifier; 
            $this.Failover = $Value.Failover; 
            $this.FailoverTest = $Value.FailoverTest; 
        }
        ZertoVPGSettingVMNic ([string] $NicIdentifier, [ZertoVPGSettingVMNicNetwork] $Failover,  [ZertoVPGSettingVMNicNetwork] $FailoverTest) {
            $this.NicIdentifier = $NicIdentifier; 
            $this.Failover = $Failover; 
            $this.FailoverTest = $FailoverTest; 
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingVMNic {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Nic Identifier')] [string] $NicIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VM Failover Network')] [ZertoVPGSettingVMNicNetwork] $VMNetworkFailover, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VM Test Network')] [ZertoVPGSettingVMNicNetwork] $VMNetworkTest, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting VM NIC object')] [PSCustomObject] $VPGSettingVMNic
        )

        if (-not $VPGSettingVMNic) {
            [ZertoVPGSettingVMNic] $NewObj = [ZertoVPGSettingVMNic]::New($NicIdentifier, $ParaVMNetworkFailovermeters, $VMNetworkTest);
        } else {
            [ZertoVPGSettingVMNic] $NewObj = [ZertoVPGSettingVMNic]::New($VPGSettingVMNic)
        }

        Return $NewObj
    }

    class ZertoVPGSettingVMRecovery {
        [string] $DatastoreClusterIdentifier;
        [string] $DatastoreIdentifier;
        [string] $FolderIdentifier;
        [string] $HostClusterIdentifier;
        [string] $HostIdentifier;
        [string] $ResourcePoolIdentifier;

        ZertoVPGSettingVMRecovery ([PSCustomObject] $Value) {
            $this.DatastoreClusterIdentifier = $value.DatastoreClusterIdentifier | StringOrNull; 
            $this.DatastoreIdentifier = $value.DatastoreIdentifier | StringOrNull; 
            $this.FolderIdentifier = $value.FolderIdentifier | StringOrNull; 
            $this.HostClusterIdentifier = $value.HostClusterIdentifier | StringOrNull; 
            $this.HostIdentifier = $value.HostIdentifier | StringOrNull; 
            $this.ResourcePoolIdentifier = $value.ResourcePoolIdentifier | StringOrNull;             
        }
        ZertoVPGSettingVMRecovery ([string] $DatastoreClusterIdentifier,
                                [string] $DatastoreIdentifier,
                                [string] $FolderIdentifier,
                                [string] $HostClusterIdentifier,
                                [string] $HostIdentifier,
                                [string] $ResourcePoolIdentifier) {
            $this.DatastoreClusterIdentifier = $DatastoreClusterIdentifier | StringOrNull; 
            $this.DatastoreIdentifier = $DatastoreIdentifier | StringOrNull; 
            $this.FolderIdentifier = $FolderIdentifier | StringOrNull; 
            $this.HostClusterIdentifier = $HostClusterIdentifier | StringOrNull; 
            $this.HostIdentifier = $HostIdentifier | StringOrNull; 
            $this.ResourcePoolIdentifier = $ResourcePoolIdentifier | StringOrNull;    
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingVMRecovery {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'DatastoreClusterIdentifier')] [string] $DatastoreClusterIdentifier = $null, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'DatastoreIdentifier')] [string] $DatastoreIdentifier = $null, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'FolderIdentifier')] [string] $FolderIdentifier = $null,
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'HostClusterIdentifier')] [string] $HostClusterIdentifier = $null, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'HostIdentifier')] [string] $HostIdentifier = $null, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'ResourcePoolIdentifier')] [string] $ResourcePoolIdentifier = $null, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting VM Recovery object')] [PSCustomObject] $VPGSettingVMRecovery
        )

        if (-not $VPGSettingVMRecovery) {
            [ZertoVPGSettingVMRecovery] $NewObj = [ZertoVPGSettingVMRecovery]::New($DatastoreClusterIdentifier,
                                                                            $DatastoreIdentifier,
                                                                            $FolderIdentifier,
                                                                            $HostClusterIdentifier,
                                                                            $HostIdentifier,
                                                                            $ResourcePoolIdentifier);
        } else {
            [ZertoVPGSettingVMRecovery] $NewObj = [ZertoVPGSettingVMRecovery]::New($VPGSettingVMRecovery)
        }

        Return $NewObj
    }

    class ZertoVPGSettingVMVolumeDatastore {
        [string] $DatastoreClusterIdentifier;
        [string] $DatastoreIdentifier;
        [bool] $IsThin;

        ZertoVPGSettingVMVolumeDatastore ([PSCustomObject] $Value) {
            $this.IsThin = $value.IsThin;    
            $this.DatastoreClusterIdentifier = $value.DatastoreClusterIdentifier | StringOrNull; 
            $this.DatastoreIdentifier = $value.DatastoreIdentifier | StringOrNull; 
        }
        ZertoVPGSettingVMVolumeDatastore ([bool] $IsThin,
                                [string] $DatastoreClusterIdentifier,
                                [string] $DatastoreIdentifier) {
            $this.IsThin = $IsThin;    
            $this.DatastoreClusterIdentifier = $DatastoreClusterIdentifier | StringOrNull; 
            $this.DatastoreIdentifier = $DatastoreIdentifier | StringOrNull; 
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingVMVolumeDatastore {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'IsSwap')] [bool] $IsThin, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'DatastoreClusterIdentifier')] [string] $DatastoreClusterIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'DatastoreIdentifier')] [string] $DatastoreIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting VM Volume Datastore object')] [PSCustomObject] $VPGSettingVMVolumeDatastore
        )

        if (-not $VPGSettingVMVolumeDatastore) {
            [ZertoVPGSettingVMVolumeDatastore] $NewObj = [ZertoVPGSettingVMVolumeDatastore]::New($IsThin,
                                                                            $DatastoreClusterIdentifier,
                                                                            $DatastoreIdentifier);
        } else {
            [ZertoVPGSettingVMVolumeDatastore] $NewObj = [ZertoVPGSettingVMVolumeDatastore]::New($VPGSettingVMVolumeDatastore)
        }

        Return $NewObj
    }

    class ZertoVPGSettingVMVolumeExistingVolume {
        [string] $DatastoreIdentifier;
        [string] $ExistingVmIdentifier;
        [string] $Mode;
        [string] $Path;

        ZertoVPGSettingVMVolumeExistingVolume ([PSCustomObject] $Value) {
            $this.DatastoreIdentifier = $value.DatastoreIdentifier | StringOrNull; 
            $this.ExistingVmIdentifier = $value.ExistingVmIdentifier;
            $this.Mode = $value.Mode;
            $this.Path = $value.Path;
        }
        ZertoVPGSettingVMVolumeExistingVolume ([string] $DatastoreIdentifier,
                                [string] $ExistingVmIdentifier,
                                [string] $Mode,
                                [string] $Path) {
            $this.DatastoreIdentifier = $DatastoreIdentifier | StringOrNull; 
            $this.ExistingVmIdentifier = $ExistingVmIdentifier;
            $this.Mode = $Mode;
            $this.Path = $Path;
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingVMVolumeExistingVolume {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'DatastoreIdentifier')] [string] $DatastoreIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'ExistingVmIdentifier')] [string] $ExistingVmIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Mode')] [string] $Mode, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Path')] [string] $Path, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting VM existing Volume object')] [PSCustomObject] $VPGSettingVMVolumeExistingVolume
        )

        if (-not $VPGSettingVMVolumeExistingVolume) {
            [ZertoVPGSettingVMVolumeExistingVolume] $NewObj = [ZertoVPGSettingVMVolumeExistingVolume]::New($DatastoreIdentifier,
                                                                            $ExistingVmIdentifier,
                                                                            $Mode,
                                                                            $Path);
        } else {
            [ZertoVPGSettingVMVolumeExistingVolume] $NewObj = [ZertoVPGSettingVMVolumeExistingVolume]::New($VPGSettingVMVolumeExistingVolume)
        }

        Return $NewObj
    }

    class ZertoVPGSettingVMVolume {
        [ZertoVPGSettingVMVolumeDatastore] $Datastore;
        [ZertoVPGSettingVMVolumeExistingVolume] $ExistingVolume;
        [bool] $IsSwap;
        [string] $VolumeIdentifier;

        ZertoVPGSettingVMVolume ([PSCustomObject] $Value) {
            $this.IsSwap = $value.IsSwap;    
            $this.VolumeIdentifier = $value.VolumeIdentifier;
            $this.Datastore = $value.Datastore;
            $this.ExistingVolume = $value.ExistingVolume;
        }
        ZertoVPGSettingVMVolume ([bool] $IsSwap,
                                [string] $VolumeIdentifier,
                                [ZertoVPGSettingVMVolumeDatastore] $Datastore,
                                [ZertoVPGSettingVMVolumeExistingVolume] $ExistingVolume) {
            $this.IsSwap = $IsSwap;    
            $this.VolumeIdentifier = $VolumeIdentifier;
            $this.Datastore = $Datastore;
            $this.ExistingVolume = $ExistingVolume; 
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingVMVolume {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'IsSwap')] [bool] $IsSwap, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VolumeIdentifier')] [string] $VolumeIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'ZertoVPGSettingVMVolumeDatastore')] [string] $Datastore, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'ZertoVPGSettingVMVolumeExistingVolume')] [string] $ExistingVolume, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPG Setting VM Volume object')] [PSCustomObject] $VPGSettingVMVolume
        )

        if (-not $VPGSettingVMVolume) {
            [ZertoVPGSettingVMVolume] $NewObj = [ZertoVPGSettingVMVolume]::New($IsSwap,
                                                                            $VolumeIdentifier,
                                                                            $Datastore,
                                                                            $ExistingVolume);
        } else {
            [ZertoVPGSettingVMVolume] $NewObj = [ZertoVPGSettingVMVolume]::New($VPGSettingVMVolume)
        }

        Return $NewObj
    }

    class ZertoVPGSettingVM {
        [string] $BootGroupIdentifier;
        [ZertoVPGSettingJournal] $Journal;
        [ZertoVPGSettingVMNic[]] $NICs;
        [ZertoVPGSettingVMRecovery] $Recovery;
        [string] $VmIdentifier;
        [ZertoVPGSettingVMVolume[]] $Volumes; 
 
        ZertoVPGSettingVM ([PSCustomObject] $Value) {
            $this.BootGroupIdentifier = $Value.BootGroupIdentifier; 
            $this.Journal = $Value.Journal; 

            $this.NICs = @();
            $Value.NICs | ForEach-Object { $this.NICs += $_};
            $this.Recovery = $Value.Recovery; 
            $this.VmIdentifier = $Value.VmIdentifier; 
            $this.Volumes = @();
            $Value.Volumes | ForEach-Object { $this.Volumes += $_ };
        }    
        ZertoVPGSettingVM ([string] $BootGroupIdentifier, [ZertoVPGSettingJournal] $Journal, [ZertoVPGSettingVMNic[]] $VMNICs, `
                        [ZertoVPGSettingVMRecovery] $VMRecovery, [string] $VmIdentifier, [ZertoVPGSettingVMVolume[]] $VMVolumes ) {
            $this.BootGroupIdentifier = $BootGroupIdentifier; 
            $this.Journal = $Journal; 
            $this.VMNICs = $VMNICs; 
            $this.VMRecovery = $VMRecovery; 
            $this.VmIdentifier = $VmIdentifier; 
            $this.VMVolumes = $VMVolumes; 
        }  
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingVM {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'BootGroup Identifier')] [string] $BootGroupIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Array of VPG Setting VM Nic objects')] [ZertoVPGSettingVMNic[]] $Nics, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VPG Setting VM Recovery object')] [ZertoVPGSettingVMRecovery] $Recovery, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VM Identifier')] [string] $VmIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Array of VPG Setting VM Volume objects')] [ZertoVPGSettingVMVolume[]] $Volumes, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting VM Object')] [PSCustomObject] $VPGSettingVM
        )
        
        if (-not $VPGSettingVM) {
            #Check for bad values
            [ZertoVPGSettingVM] $NewObj = [ZertoVPGSettingVM]::New($BootGroupIdentifier, $Journal, $NICs, $Recovery, $VmIdentifier, $Volumes);
        } else {
            [ZertoVPGSettingVM] $NewObj = [ZertoVPGSettingVM]::New($VPGSettingVM)
        }

        Return $NewObj
    }

    class ZertoVPGSetting {
        [ZertoVPGSettingBackup] $Backup;
        [ZertoVPGSettingBasic] $Basic;
        [ZertoVPGSettingBootGroups] $BootGroups;
        [ZertoVPGSettingJournal] $Journal;
        [ZertoVPGSettingNetworks] $Networks;
        [ZertoVPGSettingRecovery] $Recovery;
        [ZertoVPGSettingScripting] $Scripting;
        [ZertoVPGSettingVM[]] $Vms;
        [string] $VpgIdentifier;
        [string] $VpgSettingsIdentifier;

        ZertoVPGSetting ([PSCustomObject] $Value) {
            $this.Backup = $Value.Backup;
            $this.Basic = $Value.Basic;
            $this.BootGroups = $Value.BootGroups            
            $this.Journal = $Value.Journal;
            $this.Networks = $Value.Networks;
            $this.Recovery = $Value.Recovery;
            $this.Scripting = $Value.Scripting;
            $this.Vms = @();
            $Value.Vms | ForEach-Object { $this.Vms += $_};
            $this.VpgIdentifier = $Value.VpgIdentifier;
            $this.VpgSettingsIdentifier = $Value.VpgSettingsIdentifier;
        }    
        ZertoVPGSetting ([ZertoVPGSettingBackup] $Backup,  [ZertoVPGSettingBasic] $Basic, [ZertoVPGSettingBootGroups] $BootGroups, `
                           [ZertoVPGSettingJournal] $Journal, [ZertoVPGSettingNetworks] $Networks, [ZertoVPGSettingRecovery] $Recovery, `
                           [ZertoVPGSettingScripting] $Scripting, [ZertoVPGSettingVM[]] $Vms, [string] $VpgIdentifier, [string] $VpgSettingsIdentifier
        ) {
            $this.Backup = $Backup;
            $this.Basic = $Basic;
            $this.BootGroups = $BootGroups;
            $this.Journal = $Journal;
            $this.Networks = $Networks;
            $this.Recovery = $Recovery;
            $this.Scripting = $Scripting;
            $this.Vms = $Vms;
            $this.VpgIdentifier = $VpgIdentifier;
            $this.VpgSettingsIdentifier = $VpgSettingsIdentifier;
        }  
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSetting {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'VPG Settings Backup  object')] [ZertoVPGSettingBackup] $Backup, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VPG Settings Basics  object')] [ZertoVPGSettingBasic] $Basic, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Array of VPG Settings BootGroups  objects')] [ZertoVPGSettingBootGroups[]] $BootGroups, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VPG Settings Journal object')] [ZertoVPGSettingJournal] $Journal,
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VPG Settings Networks object')] [ZertoVPGSettingNetworks] $Networks, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'VPG Settings Recovery object')] [ZertoVPGSettingRecovery] $Recovery, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'VPG Settings Scripting object')] [ZertoVPGSettingNetworks] $Scripting, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'Array of VPG Settings Vms objects')] [ZertoVPGSettingVM[]] $Vms, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'VPG Settings VPG Identifier')] [string] $VpgIdentifier, 
            [Parameter(Mandatory=$false, ParameterSetName="Individual", HelpMessage  = 'VPG Settings VPG Settings Identifier')] [string] $VpgSettingsIdentifierVms, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting VM Object')] [PSCustomObject] $VPGSetting
        )

        if (-not $VPGSetting) {
            #Check for bad values
            [ZertoVPGSetting] $NewObj = [ZertoVPGSetting]::New($Backup, $Basic, $BootGroups, $Journal, $Networks, $Recovery, $Scripting, `
                                                                $Vms, $VpgIdentifier, $VpgSettingsIdentifierVms );
        } else {
            [ZertoVPGSetting] $NewObj = [ZertoVPGSetting]::New($VPGSetting)
        }

        Return $NewObj
    }



#endregion

#region Utility Functions

    Function Set-SSLCertByPass () {
        ################################################
        # Setting certificate exception to prevent authentication issues to the ZVM
        ################################################
        try {
            $type = "using System.Net;" + [Environment]::NewLine 
            $type +="using System.Security.Cryptography.X509Certificates;" +  [Environment]::NewLine  
            $type +="public class TrustAllCertsPolicy : ICertificatePolicy {" +  [Environment]::NewLine  
            $type +="  public bool CheckValidationResult( ServicePoint srvPoint, X509Certificate certificate, WebRequest request, int certificateProblem) {" +  [Environment]::NewLine  
            $type +="    return true;" +  [Environment]::NewLine  
            $type +="  }" +  [Environment]::NewLine  
            $type +="}" +  [Environment]::NewLine  
            
            Add-Type -TypeDefinition $type -ErrorAction SilentlyContinue

        } catch {            
        }
        [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
    }

    Function Get-QueryStringFromHashTable {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Query String Hash Table')] [Hashtable] $QueryStringHash
        )
        
        $out = ""
        
        $QueryStringHash.keys | ForEach-Object{
            if ($Out.Length -eq 0 ) {
                $Out += "?"
            } else {
                $Out += "&"
            }
            # HTML Encode???
            $Out +=  $_ + "=" +  $QueryStringHash[$_]
        }
        Return $Out
    }

    Function Parse-ZertoDate {
        param (
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto Date in the form YYYY-MM-DD or YYYY-MM-DDThh:mm:ss')] [String] $ZertoDate
        )
        
        try {
            $out = [DateTime]::Parse($ZertoDate) | Out-Null
            Return $True
        } catch {
            Return $False
        }
    }

    Function Test-RESTError {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Error')] [System.Management.Automation.ErrorRecord] $err
        )
        
        If ($err.Exception -is [System.Net.WebException]) {
            If ($err.Exception.Response.StatusCode.value__  -eq 500) {
                $stream = $err.Exception.Response.GetResponseStream()
                $reader = New-Object System.IO.StreamReader($stream)
                $reader.BaseStream.Position = 0
                $reader.DiscardBufferedData()
                $responseBody = $reader.ReadToEnd();
                $obj = $responseBody | ConvertFrom-Json
                if ($obj.Message) {
                    throw $obj.Message
                } else {
                    throw $obj
                }
            } else {
                throw "Unknown web error: " + $err.Exception.Response.StatusCode.value__ + " : " +  $err.Exception.Response.StatusDescription
            }
        } else {
            throw "Unknown error: " + $err.Exception
        }

    }

    Function Convert-ZertoTokenHash {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto Token')] [System.Object] $ZertoToken
        )

        #Saving the token to the ENV as json has to be converted back to hashtable 
        if ($ZertoToken -is [String]) {
            try { 
                $ZertoToken = $ZertoToken | ConvertFrom-Json
            } catch {
                Throw "Invalid Zerto Token - '$ZertoToken'"
            }
        }

        #Round tripping the ZertoToken Hashtable to JSON returns it as a PSCustomObject
        #This converts it back to a hash table from either JSON or string  
        if ($ZertoToken -is [PSCustomObject]) {
            $NewHash = @{}
            $ZertoToken.PSObject.Properties | ForEach-Object {
                $NewHash.Add($_.Name, $_.Value)
            }
            Return $NewHash
        } 
        
        #Already a hash table
        if ($ZertoToken -is [HashTable]) {
            Return $ZertoToken
        }

        Throw "Invalid Zerto Token - '$ZertoToken'"
    } 

    Function Get-EnvZertoServer {
        If ( (get-item Env:\ZertoServer -ErrorAction SilentlyContinue) ) {
            return (get-item Env:\ZertoServer).Value 
        } 
    }

    Function Get-EnvZertoPort {
        If ((get-item Env:\ZertoPort -ErrorAction SilentlyContinue) ) { 
            Return (get-item Env:\ZertoPort).Value 
        } else { 
            Return '9669' 
        } 
    }

    Function Get-EnvZertoToken {
        If ((get-item Env:\ZertoToken -ErrorAction SilentlyContinue) ) { 
            Return Convert-ZertoTokenHash -ZertoToken  (get-item Env:\ZertoToken).Value 
        } 
    }
    

    Function StringOrNull {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'String')][AllowEmptyString()] [string] $ThisString
        )
        if ([String]::IsNullOrEmpty($ThisString) ) { 
            Return  [NullString]::Value ; 
        } else { 
            Return $ThisString;
        }
    }

#endregion

#region Zerto Authentication

    #.ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAuthToken  {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer ) ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$true,ParameterSetName="User", HelpMessage  = 'User to connect to Zerto')] [string] $ZertoUser,
            [Parameter(Mandatory=$true,ParameterSetName="Credential", HelpMessage  = 'Credentials to connect to Zerto')] [pscredential] $ZertoCredentials
        )
        
        Set-SSLCertByPass

        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

        if ([String]::IsNullOrEmpty($ZertoServer) ) {
            throw "Missing Zerto Server"
        }

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $FullURL = $baseURL + "session/add"
        $TypeJSON = "application/json"
        Write-Verbose $FullURL

        if(!$ZertoCredentials)
        {
            if ([String]::IsNullOrEmpty($ZertoUser) ) {
                $cred = Get-Credential -Message "Enter your Zerto credentials for '$ZertoServer'"
            } else {
                $cred = Get-Credential -Message "Enter your Zerto credentials for '$ZertoServer'" -UserName $ZertoUser
            }
        }
        else {
            $cred = $ZertoCredentials
            $ZertoUser = $($cred.UserName)
            
        }


        If ($cred -NE $null) {
            #Remove  our Zerto Version
            Remove-Item ENV:ZertoToken -Force -ErrorAction Ignore
            Remove-Item ENV:ZertoVersion -Force -ErrorAction Ignore

            # Authenticating with Zerto APIs - Basic AUTH over SSL

            If ($cred.GetNetworkCredential().domain)
            {
                $authInfo = ("{0}\{1}:{2}" -f  $cred.GetNetworkCredential().domain ,  $cred.GetNetworkCredential().UserName,  $cred.GetNetworkCredential().Password )
            }
            else
            {
                $authInfo = ("{0}:{1}" -f  $cred.GetNetworkCredential().UserName,  $cred.GetNetworkCredential().Password )
            }            
            $authInfo = [System.Text.Encoding]::UTF8.GetBytes($authInfo)            
            $authInfo = [System.Convert]::ToBase64String($authInfo)

      

            $headers = @{Authorization=("Basic {0}" -f $authInfo)}


            $sessionBody = '{"AuthenticationMethod": "0"}'

            #Need to check our Response.
            try { 
                $xZertoSessionResponse = Invoke-WebRequest -Uri $FullURL -Headers $headers -Method POST -Body $sessionBody -ContentType $TypeJSON             
            } catch {
                $xZertoSessionResponse = $_.Exception.Response
            }

            if ($xZertoSessionResponse -eq $null  ) {
                Throw "Zerto Server ${ZertoServer}:${ZertoPort} not responding."
            } elseif ($xZertoSessionResponse.StatusCode -eq "200") {
                $xZertoSession = $xZertoSessionResponse.headers.get_item("x-zerto-session")
                $ZertoSessionHeader = @{"x-zerto-session"=$xZertoSession}
                return $ZertoSessionHeader 
            } else {
                if ($xZertoSessionResponse.StatusCode.value__ -eq "401") {
                    Throw "User $ZertoUser not authorized or invalid password."
                }
                return $null
            }
        } else {
            return $null
        }
    }

    #.ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoAuthToken  {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer ) ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$true,ParameterSetName="User", HelpMessage  = 'User to connect to Zerto')] [string] $ZertoUser,
            [Parameter(Mandatory=$true,ParameterSetName="Credential", HelpMessage  = 'Credentials to connect to Zerto')] [pscredential] $ZertoCredentials
        )
        
        If ($PSCmdlet.ParameterSetName -eq "User")
        {
            Set-Item ENV:ZertoToken ( (Get-ZertoAuthToken -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoUser $ZertoUser) | ConvertTo-Json -Compress) 
        }
        else {
            Set-Item ENV:ZertoToken ( (Get-ZertoAuthToken -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoCredentials $ZertoCredentials) | ConvertTo-Json -Compress)    
        }
        
        #Set our Zerto Version
        Set-Item ENV:ZertoVersion (Get-ZertoLocalSite).version
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoAuthToken  {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )  
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "Session" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        #Remove Zerto Vars
        Remove-Item ENV:ZertoVersion -Force -ErrorAction Ignore
        Remove-Item ENV:ZertoToken -Force -ErrorAction Ignore
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Connect-ZertoZVM {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669 ,
            [Parameter(Mandatory=$true,ParameterSetName="User", HelpMessage  = 'User to connect to Zerto')] [string] $ZertoUser,
            [Parameter(Mandatory=$true,ParameterSetName="Credential", HelpMessage  = 'Credentials to connect to Zerto')] [pscredential] $ZertoCredentials
        )
        
        Set-Item ENV:ZertoServer $ZertoServer
        Set-Item ENV:ZertoPort  $ZertoPort 
        If ($PSCmdlet.ParameterSetName -eq "User")
        {
            Set-Item ENV:ZertoToken ((Get-ZertoAuthToken -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoUser $ZertoUser) | ConvertTo-Json -Compress) 
        }
        else {
            Set-Item ENV:ZertoToken ((Get-ZertoAuthToken -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoCredentials $ZertoCredentials) | ConvertTo-Json -Compress) 
        }

        Set-Item ENV:ZertoVersion (Get-ZertoLocalSite).version
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Disconnect-ZertoZVM {
        Remove-ZertoAuthToken
        Remove-Item ENV:ZertoVersion -Force -ErrorAction Ignore
        Remove-Item ENV:ZertoServer -Force -ErrorAction Ignore
        Remove-Item ENV:ZertoPort -Force -ErrorAction Ignore
        Remove-Item ENV:ZertoToken -Force -ErrorAction Ignore
    }

#endregion

#region Zerto Rest API

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoRESTAPI {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort )
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        $FullURL = $baseURL 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }
#endregion

#region Zerto Alerts

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAlert {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Alert Start Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $StartDate, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Alert End Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $EndDate, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VPG Identifier')] [string] $VPGIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto ZORG Identifier')] [string] $ZORGIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Site Identifier')] [string] $SiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Alert Level')] [ZertoAlertLevel] $Level, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Alert Entity')] [ZertoAlertEntity] $Entity, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Alert HelpIdentifier')] [ZertoAlertHelpIdentifier] $HelpIdentifier,
            [Parameter(Mandatory=$true, ParameterSetName="ID", HelpMessage = 'Zerto Alert Identifier')] [string] $ZertoAlertIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoAlertIdentifier)  ) {
                    throw "Missing Zerto Alert Identifier"
                }
            
                $FullURL = $baseURL + "alerts/" + $ZertoAlertIdentifier
            }
            Default {
                $FullURL = $baseURL + "alerts" 
                if ($StartDate -or $EndDate -or $VPGIdentifier -or $ZORGIdentifier -or $SiteIdentifier -or $Level -ne $null  -or $Entity -ne $null -or $HelpIdentifier -ne $null) {
                    $qs = [ordered] @{}
                    if ($StartDate)        { if (Parse-ZertoDate($StartDate)) { $qs.Add("StartDate", $StartDate) } else { throw "Invalid StartDate: '$StartDate'" } }
                    if ($EndDate)          { if (Parse-ZertoDate($EndDate))   { $qs.Add("EndDate",   $EndDate)   } else { throw "Invalid EndDate: '$EndDate'" } }
                    if ($VPGIdentifier)    { $qs.Add("VPGIdentifier", $VPGIdentifier) }
                    if ($ZORGIdentifier)   { $qs.Add("ZORGIdentifier", $ZORGIdentifier) }
                    if ($SiteIdentifier)   { $qs.Add("SiteIdentifier", $SiteIdentifier) }
                    if ($Level -ne $null)     { $qs.Add("Level", $Level) }
                    if ($Entity -ne $null)     { $qs.Add("Entity", $Entity) }
                    if ($HelpIdentifier -ne $null) { $qs.Add("HelpIdentifier", $HelpIdentifier) }

                    $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
                }
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    function Get-ZertoAlertHelpIdentifierDescription {
        param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto Alert HelpIdentifier')] [ZertoAlertHelpIdentifier] $HelpIdentifier
        )
        switch ($HelpIdentifier){
            AWS0001 { Return "AWS S3 bucket removed" }
            BCK0001 { Return "Offsite backup fails" }
            BCK0002 { Return "Offsite backup fails" }
            BCK0005 { Return "Offsite backup repository disconnected." }
            BCK0006 { Return "Offsite backup repository disconnected." }
            BCK0007 { Return "Offsite backup repository not defined." }
            LIC0001 { Return "License exceeded" }
            LIC0002 { Return "License exceeded" }
            LIC0003 { Return "License about to expire" }
            LIC0004 { Return "License expired and exceeded" }
            LIC0005 { Return "License expired and exceeded" }
            LIC0006 { Return "License expired" }
            LIC0007 { Return "License exceeded" }
            LIC0008 { Return "License exceeded" }
            STR0001 { Return "Datastore not accessible" }
            STR0002 { Return "Datastore full" }
            STR0004 { Return "Datastore low in space" }
            VCD0001 { Return "vCenter Server for the Org vDC is not found" }
            VCD0002 { Return "Org vDC is defined in multiple vCenter Servers" }
            VCD0003 { Return "Org vDC storage profile not found in vCenter Server" }
            VCD0004 { Return "Provider vDC storage profile not found in vCenter Server" }
            VCD0005 { Return "Org vDC network not retrieved" }
            VCD0006 { Return "Provider vDC metadata not found" }
            VCD0007 { Return "Org vDC resource pool not retrieved" }
            VCD0010 { Return "OrgNetwork not retrieved" }
            VCD0014 { Return "vCD disconnection" }
            VCD0015 { Return "AMQP-server disconnection" }
            VCD0016 { Return "Provider vDC datastore not found" }
            VCD0017 { Return "Metadata not accessible" }
            VCD0018 { Return "Duplicated MAC addresses" }
            VCD0020 { Return "VM inconsistency in vApp" }
            VCD0021 { Return "VM inconsistency in vApp" }
            VPG0003 { Return "VPG has low journal history" }
            VPG0004 { Return "VPG has low journal history" }
            VPG0005 { Return "VPG in error state" }
            VPG0006 { Return "VPG missing configuration details" }
            VPG0007 { Return "VPG replication paused" }
            VPG0008 { Return "VPG rollback failed" }
            VPG0009 { Return "VPG target RPO exceeded" }
            VPG0010 { Return "VPG target RPO exceeded" }
            VPG0011 { Return "VPG test overdue" }
            VPG0012 { Return "VPG test overdue" }
            VPG0014 { Return "VPG waiting for commit or rollback" }
            VPG0015 { Return "Resources not enough to support VPG" }
            VPG0016 { Return "Resources pool not found" }
            VPG0017 { Return "VPG protection paused" }
            VPG0018 { Return "VMs in VPG not configured with a storage profile" }
            VPG0019 { Return "VPG recovery storage profile disabled" }
            VPG0020 { Return "VPG recovery storage profile not found" }
            VPG0021 { Return "VPG recovery storage profile not found" }
            VPG0022 { Return "VPG recovery storage profile disabled" }
            VPG0023 { Return "VPG recovery storage profile not found" }
            VPG0024 { Return "VPG recovery storage profile does not include active datastores" }
            VPG0025 { Return "vApp network mapping not defined" }
            VPG0026 { Return "VPG recovery storage profile changed" }
            VPG0027 { Return "VPG includes VMs that are no longer protected" }
            VPG0028 { Return "Corrupted Org vDC network mapping" }
            VPG0035 { Return "VPG protected resources not in ZORG" }
            VPG0036 { Return "VPG recovery resources not in ZORG" }
            VPG0037 { Return "Journal history is compromised" }
            VPG0038 { Return "Journal history is compromised" }
            VPG0039 { Return "RDM has an odd number of blocks" }
            VPG0040 { Return "Virtual machine hardware mismatch with recovery site" }
            VPG0041 { Return "Virtual machine running Windows 2003" }
            VPG0042 { Return "Recovery network not found" }
            VPG0043 { Return "Cross-replication: warning" }
            VPG0044 { Return "Cross-replication: error" }
            VPG0045 { Return "VPG has low journal history: warning" }
            VPG0046 { Return "VPG has low journal history: error" }
            VPG0047 { Return "Journal history is compromised: warning" }
            VPG0048 { Return "Journal history is compromised: error" }
            VRA0001 { Return "Host without VRA" }
            VRA0002 { Return "VRA without IP" }
            VRA0003 { Return "Host IP changes" }
            VRA0004 { Return "VRA lost IP" }
            VRA0005 { Return "VRAs not connected" }
            VRA0006 { Return "Datastore for journal disk is full" }
            VRA0007 { Return "I/O error to journal" }
            VRA0008 { Return "Recovery disk and VMs missing" }
            VRA0009 { Return "Recovery disk missing" }
            VRA0010 { Return "Recovery disks turned off" }
            VRA0011 { Return "Recovery disk inaccessible" }
            VRA0012 { Return "Cannot write to recovery disk" }
            VRA0013 { Return "I/O error to recovery disk" }
            VRA0014 { Return "Cloned disks turned off" }
            VRA0015 { Return "Cloned disk inaccessible" }
            VRA0016 { Return "Datastore for clone disk is full" }
            VRA0017 { Return "I/O error to clone" }
            VRA0018 { Return "Protected disk and VM missing" }
            VRA0019 { Return "Protected disk missing" }
            VRA0020 { Return "VM powered off" }
            VRA0021 { Return "VM disk inaccessible" }
            VRA0022 { Return "VM disk incompatible" }
            VRA0023 { Return "VRA cannot be registered." }
            VRA0024 { Return "VRA removed" }
            VRA0025 { Return "I/O synchronization" }
            VRA0026 { Return "Recovery disk removed" }
            VRA0027 { Return "Journal disk removed" }
            VRA0028 { Return "VRA powered off" }
            VRA0029 { Return "VRA memory low" }
            VRA0030 { Return "Journal size mismatch" }
            VRA0032 { Return "VRA out-of-date" }
            VRA0035 { Return "VRA reconciliation" }
            VRA0036 { Return "For internal use only" }
            VRA0037 { Return "Local MAC Address Conflict" }
            VRA0038 { Return "MAC Address Conflict" } 
            VRA0039 { Return "Journal reached configured limit" }
            VRA0040 { Return "Journal space low" }
            VRA0049 { Return "Host rollback failed" }
            VRA0050 { Return "Wrong host password" }
            VRA0051 { Return "For internal use only" }
            VRA0052 { Return "Disk visible but not recognized" }
            VRA0053 { Return "System disk removed" }
            VRA0054 { Return "" }
            VRA0055 { Return "" }
            ZCC0001 { Return "Zerto Cloud Connector removed" }
            ZCC0002 { Return "Zerto Cloud Connector powered off" }
            ZCC0003 { Return "Orphaned Zerto Cloud Connector" }
            ZCM0001 { Return "No connection to Zerto Virtual Manager" }
            ZVM0001 { Return "No connection to hypervisor manager, such as VMware vCenter Server and Microsoft SCVMM" }
            ZVM0002 { Return "No connection to VRA" }
            ZVM0003 { Return "No connection to site" }
            ZVM0004 { Return "Peer site out-of-date" }
            ZVM0005 { Return "Zerto Virtual Manager space low" }
            ZVM0006 { Return "Upgrade available" }
            ZVM0007 { Return "Cannot upgrade" }
            ZVM0008 { Return "Version mismatch" }
            ZVM0009 { Return "Internal error" }
            ZVM0010 { Return "Synchronization between Zerto Virtual Managers" }
            ZVM0011 { Return "Metadata collection" }
            ZVM0012 { Return "Metadata collection" }
            ZVM0013 { Return "Metadata collection" }
            ZVM0014 { Return "SCSI not found" }
            ZVM0015 { Return "Hyper-V host not accessible" }
            FLR0001 { Return "Files cannot be restored" }
            Unknown { Return "Unknown" }

        
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoAlertDismiss {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Alert Identifier')] [string] $ZertoAlertIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoAlertIdentifier)  ) {
            throw "Missing Zerto Alert Identifier"
        }
            
        $FullURL = $baseURL + "alerts/" + $ZertoAlertIdentifier + "/dismiss"
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoAlertUndismiss {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Alert Identifier')] [string] $ZertoAlertIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoAlertIdentifier)  ) {
            throw "Missing Zerto Alert Identifier"
        }
            
        $FullURL = $baseURL + "alerts/" + $ZertoAlertIdentifier + "/undismiss"
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAlertEntity {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "alerts/entities" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAlertHelpIdentifier {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "alerts/helpidentifiers" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAlertLevel {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "alerts/levels" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }
#endregion

#region Zerto Events

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoEvent {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Event Start Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $StartDate, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Event End Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $EndDate, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VPG Identifier')] [string] $VPGIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Alert Entity')] [ZertoEventType] $EventType, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Site Name')] [string] $SiteName,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Site Identifier')] [string] $SiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto ZORG Identifier')] [ZertoEventType] $ZORGIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Alert Entity Type')] [ZertoAlertEntity] $EntityType, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto User Name')] [string] $UserName,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Event Category')] [ZertoEventCategory] $EventCategory,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Alert Identifier')] [string] $ZertoAlertIdentifier,
            [Parameter(Mandatory=$true,  ParameterSetName="ID", HelpMessage = 'Zerto Event Identifier')] [string] $ZertoEventIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoEventIdentifier)  ) {
                    throw "Missing Zerto Event Identifier"
                }
                    
                $FullURL = $baseURL + "events/" + $ZertoEventIdentifier
            }
            Default {
                $FullURL = $baseURL + "events" 
                if ($StartDate -or $EndDate -or $VPGIdentifier -or $EventType -ne $null -or $SiteName -or $SiteIdentifier -or $ZORGIdentifier `
                    -or $EntityType  -ne $null -or $UserName -or $EventCategory -ne $null -or $ZertoAlertIdentifier) {
                    $qs = [ordered] @{}
                    if ($StartDate)                { if (Parse-ZertoDate($StartDate)) { $qs.Add("StartDate", $StartDate) } else { throw "Invalid StartDate: '$StartDate'" } }
                    if ($EndDate)                  { if (Parse-ZertoDate($EndDate))   { $qs.Add("EndDate",   $EndDate)   } else { throw "Invalid EndDate: '$EndDate'" } }
                    if ($VPGIdentifier)            { $qs.Add("VPGIdentifier", $VPGIdentifier) }
                    if ($EventType -ne $null)      { $qs.Add("EventType", $EventType) }
                    if ($SiteName)                 { $qs.Add("siteName", $SiteName) }
                    if ($SiteIdentifier)           { $qs.Add("SiteIdentifier", $SiteIdentifier) }
                    if ($EntityType -ne $null)     { $qs.Add("EntityType", $EntityType) }
                    if ($ZORGIdentifier)           { $qs.Add("ZORGIdentifier", $ZORGIdentifier) }
                    if ($UserName)                 { $qs.Add("UserName", $UserName) }
                    if ($EventCategory -ne $null)  { $qs.Add("EventCategory", $EventCategory) }
                    if ($ZertoAlertIdentifier)     { $qs.Add("ZertoAlertIdentifier", $ZertoAlertIdentifier) }

                    $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
                }
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoEventCategory {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "events/categories" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoEventEntity {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "Events/entities" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoEventType {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "events/types" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }
#endregion

#region Zerto Local Site

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoLocalSite {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "localsite"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoLocalSiteID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )
        
        $ID = Get-ZertoLocalSite -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                    Select-Object SiteIdentifier -ExpandProperty SiteIdentifier

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoLocalSitePairingStatus {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "localsite/pairingstatuses"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }
#endregion

#region Zerto Peer Sites

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoPeerSite {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Peer Site name')] [string] $PeerName, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Peer Site pairing status')] [ZertoPairingStatus] $ParingStatus, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Peer Site location')] [string] $Location, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Peer Site host name')] [string] $HostName, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Peer Site port')] [string] $Port,
            [Parameter(Mandatory=$true, ParameterSetName="ID", HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
                    throw "Missing Zerto Site Identifier"
                }
                    
                $FullURL = $baseURL + "peersites/" + $ZertoSiteIdentifier
            }
            Default {
                $FullURL = $baseURL + "peersites"
                if ($PeerName -or $ParingStatus -ne $null -or $Location -or $HostName -or $Port) {
                    $qs = [ordered] @{}
                    if ($PeerName)               { $qs.Add("peerName", $PeerName) }
                    if ($ParingStatus -ne $null) { $qs.Add("paringStatus", $ParingStatus) }
                    if ($Location)               { $qs.Add("location", $Location) }
                    if ($HostName)               { $qs.Add("hostName", $HostName) }
                    if ($Port)                   { $qs.Add("port", $Port) }

                    $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
                }
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoPeerSiteID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto PeerSite Name')] [string] $ZertoPeerSiteName
        )
        
        $ID = Get-ZertoPeerSite -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.PeerSiteName -eq $ZertoPeerSiteName} | `
                            Select-Object SiteIdentifier -ExpandProperty SiteIdentifier

        if ($ID.Count -gt 1) {Throw "'$ZertoPeerSiteName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$ZertoPeerSiteName' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Connect-ZertoPeerSite {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, ParameterSetName="Post", HelpMessage = 'Address or DNS name of new site')] [string] $HostName,
            [Parameter(Mandatory=$false, ParameterSetName="Post", HelpMessage = 'The default port used for communication between paired Zerto Virtual Managers. The default port is 9081.')] [int] $Port = 9081
            ,[Parameter(Mandatory=$false, HelpMessage = 'Dump Json without posting for debug')] [switch] $DumpJson   
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( $HostName -eq $null) {
            throw "Missing new site HostName"
        }
        if ( $Port -eq $null) {
            throw "Missing new site Port"
        }
        If (-Not (Test-Connection $HostName -Count 1 -Quiet) ) {
            throw "Could not ping '$hostname'"
        }
        $testport = 0
        If ( -Not ([int]::TryParse($port, [ref] $testport) ) ) {
            throw "Invaild port '$port'. Must be a postive integer."
        }
        If ( ($port -le 0) -or ($Port -gt [math]::Pow(2,16) )  ) {
            throw ("Invaild port '$port'. Must be > 0 and < " + ([math]::Pow(2,16)))
        }

        $FullURL = $baseURL + "peersites"
        Write-Verbose $FullURL

        $BodyHash = [ordered] @{}
        $BodyHash.Add("HostName", $HostName)
        $BodyHash.Add("Port", $Port)
        $BodyJson = $BodyHash | ConvertTo-Json -Depth 20

        if ($DumpJson ) {
            #Display JSON, and exit
            Write-host $BodyJson
            return
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $BodyJson
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Disconnect-ZertoPeerSite {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true,  HelpMessage = 'Zerto Site Identifier of Peersite to disconnect')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Keep Target Disks in Peer site')] [boolean] $KeepTargetDisks = $false
            ,[Parameter(Mandatory=$false, HelpMessage = 'Dump Json without posting for debug')] [switch] $DumpJson   
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "peersites/" + $ZertoSiteIdentifier
        Write-Verbose $FullURL
        
        $BodyHash = [ordered] @{}
        $BodyHash.Add("IsKeepTargetDisks", $KeepTargetDisks)
        $BodyJson = $BodyHash | ConvertTo-Json -Depth 20

        if ($DumpJson ) {
            #Display JSON, and exit
            Write-host $BodyJson
            return
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete -Body $BodyJson
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }


#endregion

#region Zerto Service Profiles
    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoServiceProfile {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, ParameterSetName="ID", HelpMessage = 'Zerto Service Profile Identifier')] [string] $ZertoServiceProfileIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoServiceProfileIdentifier)  ) {
                    throw "Missing Zerto Service Profile Identifier"
                }
                $FullURL = $baseURL + "serviceprofiles/" + $ZertoServiceProfileIdentifier
            }
            Default {
                $FullURL = $baseURL + "serviceprofiles"
                if ($ZertoSiteIdentifier) {
                    $qs = [ordered] @{}
                    if ($SiteIdentifier) { $qs.Add("Site", $ZertoSiteIdentifier) }

                    $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
                }
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoServiceProfileID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Site Identifier')] [string] $SiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Service Profile Name')] [string] $ZertoServiceProfileName
        )
        
        $ID = Get-ZertoServiceProfile -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -SiteIdentifier $SiteIdentifier | `
                            Where-Object {$_.ServiceProfileName -eq $ZertoServiceProfileName} | `
                            Select-Object ServiceProfileIdentifier -ExpandProperty ServiceProfileIdentifier

        if ($ID.Count -gt 1) {Throw "'$ZertoServiceProfileName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$ZertoServiceProfileName' was not found"}

        return $ID.ToString()
    }
#endregion

#region Zerto Virtualization Sites

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSite {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )
       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                Return Get-ZertoVirtualizationSite -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier
            }
            Default {
                Return Get-ZertoVirtualizationSite -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken
            }
        }

        if ($ZertoSiteIdentifier) {
        } else {
            Return Get-ZertoVirtualizationSite -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Name')] [string] $ZertoSiteName
        )

        Return Get-ZertoVirtualizationSiteID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteName $ZertoSiteName
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVirtualizationSite {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
                    throw "Missing Zerto Site Identifier"
                }
                $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier
            }
            Default {
                $FullURL = $baseURL + "virtualizationsites"
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVirtualizationSiteID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Name')] [string] $ZertoSiteName
        )
        
        $ID = Get-ZertoVirtualizationSite -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.VirtualizationSiteName -eq $ZertoSiteName} | `
                            Select-Object SiteIdentifier -ExpandProperty SiteIdentifier

        if ($ID.Count -gt 1) {Throw "'$ZertoSiteName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$ZertoSiteName' was not found"}
        
        return $ID.ToString()
    }

#endregion

#region Zerto Site Secondarys

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteDatastoreCluster {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Site Datastore Cluster Identifier')] [string] $ZertoSiteDatastoreClusterIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/datastoreclusters"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }

        #Filter by ID if needed
        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                $Result = $Result | Where-Object {$_.DatastoreClusterIdentifier -eq $ZertoSiteDatastoreClusterIdentifier} 
            }
            Default {
            }
        }
        

        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteDatastoreClusterID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter Datastore Cluster Name')] [string] $DatastoreClusterName
        )

        $ID =  Get-ZertoSiteDatastoreCluster -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier  | `
                            Where-Object {$_.DatastoreClusterName -eq $DatastoreClusterName} | `
                            Select-Object DatastoreClusterIdentifier -ExpandProperty DatastoreClusterIdentifier

        if ($ID.Count -gt 1) {Throw "'$DatastoreClusterName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$DatastoreClusterName' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteDatastore {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Site Datastore Identifier')] [string] $ZertoSiteDatastoreIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/datastores"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }

        #Filter by ID if needed
        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                $Result = $Result | Where-Object {$_.DatastoreIdentifier -eq $ZertoSiteDatastoreIdentifier} 
            }
            Default {
            }
        }
        
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteDatastoreID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter Datastore Name')] [string] $DatastoreName
        )

        $ID = Get-ZertoSiteDatastore -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier  | `
                            Where-Object {$_.DatastoreName -eq $DatastoreName} | `
                            Select-Object DatastoreIdentifier -ExpandProperty DatastoreIdentifier

        if ($ID.Count -gt 1) {Throw "'$DatastoreName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$DatastoreName' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteFolder {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Site Folder Identifier')] [string] $ZertoSiteFolderIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/folders"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }

        #Filter by ID if needed
        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                $Result = $Result | Where-Object {$_.FolderIdentifier -eq $ZertoSiteFolderIdentifier} 
            }
            Default {
            }
        }
                
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteFolderID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto vCenter Folder Name')] [string] $FolderName
        )
        
        $ID = Get-ZertoSiteFolder -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier  | `
                            Where-Object {$_.FolderName -eq  $FolderName } | `
                            Select-Object FolderIdentifier -ExpandProperty FolderIdentifier

        if ($ID.Count -gt 1) {Throw "'$FolderName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$FolderName' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteHostCluster {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Site HostCluster Identifier')] [string] $ZertoSiteHostClusterIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/hostclusters"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }

        #Filter by ID if needed
        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                $Result = $Result | Where-Object {$_.ClusterIdentifier -eq $ZertoSiteHostClusterIdentifier} 
            }
            Default {
            }
        }

        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteHostClusterID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter Host Cluster Name')] [string] $HostClusterName
        )
        
        $ID = Get-ZertoSiteHostCluster -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier | `
                                Where-Object {$_.VirtualizationClusterName -eq $HostClusterName} | `
                                Select ClusterIdentifier -ExpandProperty ClusterIdentifier

        if ($ID.Count -gt 1) {Throw "'$HostClusterName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$HostClusterName' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteHost {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Host Identifier')] [string] $ZertoHostIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoHostIdentifier)  ) {
                    throw "Missing Zerto Host Identifier"
                }

                $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/hosts/" + $ZertoHostIdentifier
            }
            Default {
                $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/hosts"
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteHostID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter Host Name')] [string] $HostName
        )
        
        $ID = Get-ZertoSiteHost -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier | `
                                Where-Object {$_.VirtualizationHostName -eq $HostName} | `
                                Select HostIdentifier -ExpandProperty HostIdentifier

        if ($ID.Count -gt 1) {Throw "'$HostName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$HostName' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteNetwork {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Site Network Identifier')] [string] $ZertoSiteNetworkIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/networks"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        
        #Filter by ID if needed
        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                $Result = $Result | Where-Object {$_.NetworkIdentifier -eq $ZertoSiteNetworkIdentifier} 
            }
            Default {
            }
        }

        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteNetworkID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter Network Name')] [string] $NetworkName
        )
        
        $ID = Get-ZertoSiteNetwork -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier | `
                Where-Object {$_.VirtualizationNetworkName -eq $NetworkName} | `
                Select-Object   NetworkIdentifier -ExpandProperty NetworkIdentifier

        if ($ID.Count -gt 1) {Throw "'$NetworkName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$NetworkName' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteOrgVCD {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/orgvdcs"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteResourcePool {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Site ResourcePool Identifier')] [string] $ZertoSiteResourcePoolIdentifier            
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/resourcepools"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }

        #Filter by ID if needed
        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                $Result = $Result | Where-Object {$_.ResourcePoolIdentifier -eq $ZertoSiteResourcePoolIdentifier} 
            }            
            Default {
            }
        }

        return $Result
    }

    Function Get-ZertoSiteResourcePoolId {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Site ResourcePool Identifier')] [string] $ZertoSiteResourcePoolIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="NAME", HelpMessage = 'Zerto Site ResourcePool Identifier')] [string] $ZertoSiteResourcePoolName
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/resourcepools"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }

        #Filter by ID if needed
        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                $Result = $Result | Where-Object {$_.ResourcePoolIdentifier -eq $ZertoSiteResourcePoolIdentifier} 
            }
            "NAME" {
                $Result = $Result | Where-Object {$_.ResourcepoolName -eq $ZertoSiteResourcePoolName} 
            }
            Default {
            }
        }

        return $($Result.ResourcePoolIdentifier)
    }


    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteVApp {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/vapps"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteVcdVapp {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/vcdvapps"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteVM {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto Site VM Identifier')] [string] $ZertoSiteVMIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/vms"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }

        #Filter by ID if needed
        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                $Result = $Result | Where-Object {$_.VmIdentifier -eq $ZertoSiteVMIdentifier} 
            }
            Default {
            }
        }

        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteVMID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Virtual Machine Name')] [string] $VMName
        )
        
        $ID = Get-ZertoSiteVM -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier | `
                    Where-Object {$_.VmName -eq $VMName } | `
                    Select-Object VmIdentifier -ExpandProperty VmIdentifier

        if ($ID.Count -gt 1) {Throw "'$VMName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$VMName' was not found"}

        return $ID.ToString()
    }
    
    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteRepository {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/repositories"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteRepositoryID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Backup Repository Name')] [string] $RepositoryName
        )
        
        $ID = Get-ZertoSiteRepository -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier | `
                    Where-Object {$_.DisplayName -eq $RepositoryName } | `
                    Select-Object ID  -ExpandProperty ID

        if ($ID.Count -gt 1) {Throw "'$RepositoryName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$RepositoryName' was not found"}

        return $ID.ToString()
    }
#endregion

#region Zerto Tasks

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoTask {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Task Started Before Date (YYYY-MM-DD)')] [string] $StartedBeforeDate, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Task Started After Date')] [string] $StartedAfterDate, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Task Completed Before Date (YYYY-MM-DD)')] [string] $CompletedBeforeDate, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Task Completed After Date')] [string] $CompletedAfterDate, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Task Type')] [ZertoTaskTypes] $TaskType, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Task Status')] [string] $Status,
            [Parameter(Mandatory=$true, ParameterSetName="ID", HelpMessage = 'Zerto Task Identifier')] [string] $ZertoTaskIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoTaskIdentifier)  ) {
                    throw "Missing Zerto Task Identifier"
                }

                #Zerto Returns TASK id's using a ':' as a separator - this needs to be a '.' for the API
                if ($ZertoTaskIdentifier -match ':') {
                    $ZertoTaskIdentifier = $ZertoTaskIdentifier -replace ':','.'
                }

                $FullURL = $baseURL + "tasks/" + $ZertoTaskIdentifier
            }
            Default {
                $FullURL = $baseURL + "tasks"
                if ($StartedBeforeDate -or $StartedAfterDate -or $CompletedBeforeDate -or $CompletedAfterDate -or $TaskType -ne $null -or $Status) {
                    $qs = [ordered] @{}
                    if ($StartedBeforeDate)   { if (Parse-ZertoDate($StartedBeforeDate))    { $qs.Add("startedBeforeDate",   $StartedBeforeDate)   } else { throw "Invalid StartedBeforeDate: '$StartedBeforeDate'" } }
                    if ($StartedAfterDate)    { if (Parse-ZertoDate($StartedAfterDate))     { $qs.Add("startedAfterDate",    $StartedAfterDate)    } else { throw "Invalid StartedAfterDate: '$StartedAfterDate'" } }
                    if ($CompletedBeforeDate) { if (Parse-ZertoDate($CompletedBeforeDate))  { $qs.Add("completedBeforeDate", $CompletedBeforeDate) } else { throw "Invalid CompletedBeforeDate: '$CompletedBeforeDate'" } }
                    if ($CompletedAfterDate)  { if (Parse-ZertoDate($CompletedAfterDate))   { $qs.Add("completedAfterDate",  $CompletedAfterDate)  } else { throw "Invalid CompletedAfterDate: '$CompletedAfterDate'" } }
                    if ($TaskType -ne $null)  { $qs.Add("type", $TaskType) }
                    if ($Status)              { $qs.Add("status", $Status) }

                    $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
                }
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoTaskType {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "tasks/types"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoTaskState {
        [CmdletBinding(DefaultParameterSetName = 'default')]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, ParameterSetName="State", HelpMessage = 'Zerto Task State')] [string] $ZertoTaskState,
            [Parameter(Mandatory=$true, ParameterSetName="ID", HelpMessage = 'Zerto Task State ID')] [ZertoTaskStates] $ZertoTaskStateID
        )

        #$baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        #$TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "State" {
                if ([string]::IsNullOrEmpty($ZertoTaskState)  ) {
                    throw "Missing Zerto Task State"
                }
                Return [ZertoTaskStates]::$ZertoTaskState.value__
            }
            "ID" {
                Return [ZertoTaskStates]$ZertoTaskStateID
            }
            Default {
                return [System.Enum]::GetNames([ZertoTaskStates])
            }
        }        
    }
    
#endregion

#region Zerto Virtual Machines

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVM {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VPG name')] [string] $VPGName, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VM name')] [string] $VMName, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VM Status')] [ZertoVPGStatus] $Status, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VM Substatus')] [ZertoVPGSubstatus] $SubStatus, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Protected Site Type')] [ZertoProtectedSiteType] $ProtectedSiteType, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Recovery Site Type')] [ZertoRecoverySiteType] $RecoverySiteType, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Protected Site Identifier')] [string] $ProtectedSiteIdentifier, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Recovery Site Identifier')] [string] $RecoverySiteIdentifier, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VM Organization Name')] [string] $OrganizationName, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VM Priority')] [ZertoVPGPriority] $Priority,
            [Parameter(Mandatory=$true, ParameterSetName="ID", HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVMIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoVMIdentifier)  ) {
                    throw "Missing Zerto VM Identifier"
                }

                $FullURL = $baseURL + "vms/" + $ZertoVMIdentifier
            }
            Default {
                $FullURL = $baseURL + "vms"
                if ($VPGName -or $VMName -or $Status -ne $null -or $Substatus -ne $null -or `
                        $ProtectedSiteType -ne $null -or $RecoverySiteType -ne $null -or $ProtectedSiteIdentifier -or $RecoverySiteIdentifier -or $OrganizationName `
                        -or $Priority -ne $null) {
                    $qs = [ordered] @{}
                    if ($VPGName)                     { $qs.Add("vpgName", $VPGName) }
                    if ($VMName)                      { $qs.Add("vmName", $VMName) }
                    if ($Status -ne $null)            { $qs.Add("status", $Status) }
                    if ($Substatus -ne $null)         { $qs.Add("substatus", $Substatus) }
                    if ($ProtectedSiteType -ne $null) { $qs.Add("protectedSiteType", $ProtectedSiteType) }
                    if ($RecoverySiteType -ne $null)  { $qs.Add("recoverySiteType", $RecoverySiteType) }
                    if ($ProtectedSiteIdentifier)     { $qs.Add("ProtectedSiteIdentifier", $ProtectedSiteIdentifier) }
                    if ($RecoverySiteIdentifier)      { $qs.Add("RecoverySiteIdentifier", $RecoverySiteIdentifier) }
                    if ($OrganizationName)            { $qs.Add("organizationName", $OrganizationName) }
                    if ($Priority -ne $null)          { $qs.Add("priority", $Priority) }

                    $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
                }
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVMID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Name')] [string] $VmName
        )
        
        $ID = Get-ZertoVM -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.VmName -eq $VmName} | `
                            Select-Object VmIdentifier -ExpandProperty VmIdentifier

        if ($ID.Count -gt 1) {Throw "'$VMName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$VMName' was not found"}

        return $ID.ToString()
    }
#endregion

#region Zerto VRAs

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVRA {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VRA Name')] [string] $VRAName, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VRA Status')] [ZertoVRAStatus] $VRAStatus,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VRA Version')] [string] $VRAVersion, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Host Version')] [string] $HostVersion, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VRA IP Address')] [string] $IPAddress, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VRA Group')] [string] $VRAGroup, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VRA Datastore Name')] [string] $DatastoreName, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VRA Datastore Cluster Name')] [string] $DatastoreClusterName, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VRA Network Name')] [string] $NetworkName,
            [Parameter(Mandatory=$true, ParameterSetName="ID", HelpMessage = 'Zerto VRA Identifier')] [string] $ZertoVraIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoVraIdentifier)  ) {
                    throw "Missing Zerto VRA Identifier"
                }
                    
                $FullURL = $baseURL + "vras"
            }
            Default {
                $FullURL = $baseURL + "vras" 
                if ($VRAName -or $VRAStatus -ne $null -or $VRAVersion -or $HostVersion -or $IPAddress `
                        -or $VRAGroup -or $DatastoreName -or $DatastoreClusterName -or $NetworkName ) {
                    $qs = [ordered] @{}
                    if ($VRAName)              { $qs.Add("VRAName", $VRAName) }
                    if ($VRAStatus -ne $null)  { $qs.Add("Status", $VRAStatus) }
                    if ($VRAVersion)           { $qs.Add("VRAVersion", $VRAVersion) }
                    if ($HostVersion)          { $qs.Add("HostVersion", $HostVersion) }
                    if ($IPAddress)            { $qs.Add("IPAddress", $IPAddress) }
                    if ($VRAGroup)             { $qs.Add("VRAGroup", $VRAGroup) }
                    if ($DatastoreName)        { $qs.Add("DatastoreName", $DatastoreName) }
                    if ($DatastoreClusterName) { $qs.Add("DatastoreClusterName", $DatastoreClusterName) }
                    if ($NetworkName)          { $qs.Add("type", $NetworkName) }

                    $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
                }
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }

        #Filter by ID if needed
        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                $Result = $Result | Where-Object {$_.VraIdentifier -eq $ZertoVraIdentifier} 
            }
            Default {
            }
        }

        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVRAID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VRA Name')] [string] $VraName
        )

        $ID =  Get-ZertoVRA -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.VraName -eq $VraName} | `
                            Select-Object VraIdentifier -ExpandProperty VraIdentifier

        if ($ID.Count -gt 1) {Throw "'$VraName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$VraName' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVRAIPConfigurationType {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "vras/ipconfigurationtypes" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVRAStatus {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "vras/statuses" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVRA {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VRA Identifier')] [string] $ZertoVraIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVraIdentifier)  ) {
            throw "Missing Zerto VRA Identifier"
        }
            
        $FullURL = $baseURL + "vras/" + $ZertoVraIdentifier
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVRAUpgrade {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VRA Identifier')] [string] $ZertoVraIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVraIdentifier)  ) {
            throw "Missing Zerto VRA Identifier"
        }
            
        $FullURL = $baseURL + "vras/" + $ZertoVraIdentifier + "/upgrade"
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Add-ZertoVRA {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Datastore Name')] [string] $DatastoreName,
            [Parameter(Mandatory=$False, HelpMessage = 'Zerto VRA Group Name (optional)')] [string] $VRAGroupName,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Host Name')] [string] $HostName,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Network Name')] [string] $NetworkName,
            [Parameter(Mandatory=$false, HelpMessage = 'Memory in GB for new VRA (1-16, defaults to 16)')] [string] $MemoryInGB = 16,
            [Parameter(Mandatory=$true, ParameterSetName="Password", HelpMessage = 'Zerto Host Root Password')] [string] $HostRootPassword,
            [Parameter(Mandatory=$true, ParameterSetName="PublicKey", HelpMessage = 'Use vCenter PublicKey instead of Password')] [bool] $UseVCenterPublicKey = $true,
            [Parameter(Mandatory=$true, HelpMessage = 'VRA IP Configuration')] [VRAIPAddressConfig] $VRAIPConfiguration

            ,[Parameter(Mandatory=$false, HelpMessage = 'Dump Json without posting for debug')] [switch] $DumpJson   
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        #Validate
        if ($UseVCenterPublicKey -and $HostRootPassword) {
            throw "Cannot specify both HostRootPassword and Use vCenter Public Key"
        }
        if ($MemoryInGB -lt 1 -or $MemoryInGB -gt 16) {
            throw "Invalid MemoryInGB - must be from 1 to 16"
        }  

        #Get Identifiers
        $LocalSiteID = Get-ZertoLocalSiteID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken
        if ([string]::IsNullOrEmpty($LocalSiteID)  ) { throw "Could not find Local Site ID" }

        $HostID = Get-ZertoSiteHostID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $LocalSiteID -HostName $HostName
 
        $DatastoreID = Get-ZertoSiteDatastoreID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $LocalSiteID -DatastoreName $DatastoreName

        $NetworkID = Get-ZertoSiteNetworkID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $LocalSiteID -NetworkName $NetworkName

        #Validate IDs
        if ([string]::IsNullOrEmpty($DatastoreID)  ) { throw "Could not find Datastore ID for $DatastoreName " }
        if ([string]::IsNullOrEmpty($HostID)  ) { throw "Could not find Datastore ID for $DatastoreName " }
        if ([string]::IsNullOrEmpty($NetworkID)  ) { throw "Could not find  Network ID for $NetworkName " }

        $FullURL = $baseURL + "vras"  
        Write-Verbose $FullURL

        $BodyHash = [ordered] @{}
        $BodyHash.Add("DatastoreIdentifier", $DatastoreID)
        $BodyHash.Add("GroupName", $VRAGroupName)
        $BodyHash.Add("HostIdentifier", $HostID)
        If ($HostRootPassword) {
            $BodyHash.Add("HostRootPassword", $HostRootPassword)
            $BodyHash.Add("UsePublicKeyInsteadOfCredentials", $false)
        } else {
            $BodyHash.Add("HostRootPassword", $null)
            $BodyHash.Add("UsePublicKeyInsteadOfCredentials", $UseVCenterPublicKey)
        }

        $BodyHash.Add("MemoryInGb", $MemoryInGB)
        $BodyHash.Add("NetworkIdentifier", $NetworkID)
        $NewVRAIPInfo = [ordered] @{}
            $NewVRAIPInfo.Add("DefaultGateway", $VRAIPConfiguration.Gateway )
            $NewVRAIPInfo.Add("SubnetMask", $VRAIPConfiguration.SubnetMask )
            $NewVRAIPInfo.Add("VraIPAddress", $VRAIPConfiguration.IPAddress )
            $NewVRAIPInfo.Add("VraIPConfigurationTypeApi", $VRAIPConfiguration.VRAIPType.ToString() )
        $BodyHash.Add("VraNetworkDataApi", $NewVRAIPInfo)

        #Convert VPG Hash to JSON - Remember DEPTH!!!
        $BodyJson = $BodyHash | ConvertTo-Json -Depth 20

        Write-Verbose $NewVRAJson

        if ($DumpJson ) {
            #Display JSON, and exit
            Write-host $BodyJson
            return
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $BodyJson
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Update-ZertoVRA {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VRA Identifier')] [string] $ZertoVraIdentifier,
            [Parameter(Mandatory=$False, HelpMessage = 'Zerto VRA Group Name (optional)')] [string] $VRAGroupName,
            [Parameter(Mandatory=$true, ParameterSetName="Password", HelpMessage = 'Zerto Host Root Password')] [string] $HostRootPassword,
            [Parameter(Mandatory=$true, ParameterSetName="PublicKey", HelpMessage = 'Use vCenter PublicKey instead of Password')] [bool] $UseVCenterPublicKey = $true,
            [Parameter(Mandatory=$true, HelpMessage = 'VRA IP Configuration')] [VRAIPAddressConfig] $VRAIPConfiguration
            ,[Parameter(Mandatory=$false, HelpMessage = 'Dump Json without posting for debug')] [switch] $DumpJson   
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        #Validate
        if ($UseVCenterPublicKey -and $HostRootPassword) {
            throw "Cannot specify both HostRootPassword and Use vCenter Public Key"
        }

        #Get Identifiers
        $LocalSiteID = Get-ZertoLocalSiteID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken
        if ([string]::IsNullOrEmpty($LocalSiteID)  ) { throw "Could not find Local Site ID" }

        $FullURL = $baseURL + "vras/" + $ZertoVraIdentifier
        Write-Verbose $FullURL

        $BodyHash = [ordered] @{}

        $BodyHash.Add("GroupName", $VRAGroupName)
        If ($HostRootPassword) {
            $BodyHash.Add("HostRootPassword", $HostRootPassword)
            $BodyHash.Add("UsePublicKeyInsteadOfCredentials", $false)
        } else {
            $BodyHash.Add("HostRootPassword", $null)
            $BodyHash.Add("UsePublicKeyInsteadOfCredentials", $UseVCenterPublicKey)
        }

        $NewVRAIPInfo = [ordered] @{}
            $NewVRAIPInfo.Add("DefaultGateway", $VRAIPConfiguration.Gateway )
            $NewVRAIPInfo.Add("SubnetMask", $VRAIPConfiguration.SubnetMask )
            $NewVRAIPInfo.Add("VraIPAddress", $VRAIPConfiguration.IPAddress )
            $NewVRAIPInfo.Add("VraIPConfigurationTypeApi", $VRAIPConfiguration.VRAIPType.ToString() )
        $BodyHash.Add("VraNetworkDataApi", $NewVRAIPInfo)        

        #Convert VPG Hash to JSON - Remember DEPTH!!!
        $BodyJson = $BodyHash | ConvertTo-Json -Depth 20

        Write-Verbose $BodyJson
        if ($DumpJson ) {
            #Display JSON, and exit
            Write-host $BodyJson
            return
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Put -Body $BodyJson
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }


#endregion

#region Zerto VPGs  

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPG {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VPG Name')] [string] $VPGName, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VPG Status')] [ZertoVPGStatus] $Status,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VPG Status')] [ZertoVPGSubStatus] $SubStatus,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Protected Site Type')] [ZertoProtectedSiteType] $ProtectedSiteType, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Recovery Site Type')] [ZertoRecoverySiteType] $RecoverySiteType, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Protected Site Identifier')] [string] $ProtectedSiteIdentifier, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Recovery Site Identifier')] [string] $RecoverySiteIdentifier, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto ZOrg Name')] [string] $ZOrganizationName, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto ZOrg Identifier')] [string] $ZOrgIdentifier, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VPG Priority')] [string] $Priority, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Service Profile Identifier')] [string] $ServiceProfileIdentifier, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto VPG Backup Enabled ')] [boolean] $BackupEnabled,
            [Parameter(Mandatory=$true, ParameterSetName="ID", HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
                    throw "Missing Zerto VPG Identifier"
                }

                $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier
            }
            Default {        
                $FullURL = $baseURL + "vpgs"
                if ($VPGName -or $Status -ne $null -or $SubStatus -ne $null -or $ProtectedSiteType -ne $null `
                        -or $RecoverySiteType -ne $null -or $ProtectedSiteIdentifier -or `
                        $RecoverySiteIdentifier -or $ZOrganizationName -or $ZOrgIdentifier `
                        -or $priority -ne $null -or $serviceProfileIdentifier -or $backupEnabled ) {
                    $qs = [ordered] @{}
                    if ($VPGName)                     { $qs.Add("Name", $VPGName) }
                    if ($Status -ne $null)            { $qs.Add("Status", $Status) }
                    if ($SubStatus -ne $null)         { $qs.Add("SubStatus", $SubStatus) }
                    if ($ProtectedSiteType -ne $null) { $qs.Add("ProtectedSiteType", $ProtectedSiteType) }
                    if ($RecoverySiteType -ne $null)  { $qs.Add("RecoverySiteType", $RecoverySiteType) }
                    if ($ProtectedSiteIdentifier)     { $qs.Add("ProtectedSiteIdentifier", $ProtectedSiteIdentifier) }
                    if ($RecoverySiteIdentifier)      { $qs.Add("RecoverySiteIdentifier", $RecoverySiteIdentifier) }
                    if ($ZOrganizationName)           { $qs.Add("ZOrganizationName", $ZOrganizationName) }
                    if ($ZOrgIdentifier)              { $qs.Add("ZOrgIdentifier", $ZOrgIdentifier) }
                    if ($Priority -ne $null)          { $qs.Add("priority", $Priority) }
                    if ($ServiceProfileIdentifier)    { $qs.Add("ServiceProfileIdentifier", $ServiceProfileIdentifier) }
                    if ($BackupEnabled)               { $qs.Add("BackupEnabled", $BackupEnabled) }

                    $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
                }
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Convert-ZertoVPGToVPGSetting {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
            ,[Parameter(Mandatory=$false, HelpMessage = 'Dump Json without posting for debug')] [switch] $DumpJson   
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgSettings" 
        Write-Verbose $FullURL

        $BodyHash = @{}
        $BodyHash.Add("VpgIdentifier", $ZertoVpgIdentifier )
        $BodyJson = $BodyHash | ConvertTo-Json
        Write-Verbose $BodyJson
        if ($DumpJson ) {
            #Display JSON, and exit
            Write-host $BodyJson
            return
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Body $BodyJson -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Name')] [string] $VpgName
        )

        $ID =  Get-ZertoVPG -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.VpgName -eq $VpgName} | `
                            Select-Object VpgIdentifier -ExpandProperty VpgIdentifier

        if ($ID.Count -gt 1) {Throw "'$VpgName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$VpgName' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGCheckpoint {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$True, ParameterSetName="ID", HelpMessage = 'Zerto VPG Checkpoint Identifier')] [string] $ZertoVpgCheckpointIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Checkpoint Start Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $StartDate, 
            [Parameter(Mandatory=$false, ParameterSetName="Filter", HelpMessage = 'Zerto Checkpoint End Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $EndDate
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoVpgCheckpointIdentifier)  ) {
                    throw "Missing Zerto VPG Checkpoint Identifier"
                }
                $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/checkpoints"
            }
            Default {
                $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/checkpoints"

                if ($StartDate -or $EndDate ) {
                    $qs = [ordered] @{}
                    if ($StartDate)      { if (Parse-ZertoDate($StartDate)) { $qs.Add("StartDate", $StartDate) } else { throw "Invalid StartDate: '$StartDate'" } }
                    if ($EndDate)        { if (Parse-ZertoDate($EndDate))   { $qs.Add("EndDate",   $EndDate)   } else { throw "Invalid EndDate: '$EndDate'" } }
                    $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
                }
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }

        #Filter by ID if needed
        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                $Result = $Result | Where-Object {$_.CheckpointIdentifier -eq $ZertoVpgCheckpointIdentifier} 
            }
            Default {
            }
        }

        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGCheckpointID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$true, ParameterSetName="Tag", HelpMessage = 'Zerto Checkpoint Tag')] [string] $ZertoVpgCheckpointTag
        )
        
        #if ($ZertoVpgCheckpointIdentifier) {
        #    $ID =  Get-ZertoVPGCheckpoint -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgIdentifier $ZertoVpgIdentifier | `
        #                        Where-Object {$_.CheckpointIdentifier -eq $ZertoVpgCheckpointIdentifier} | `
        #                        Select-Object CheckpointIdentifier -ExpandProperty CheckpointIdentifier
        #} elseif ($ZertoVpgCheckpointTag) {
        #    $ID =  Get-ZertoVPGCheckpoint -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgIdentifier $ZertoVpgIdentifier | `
        #                        Where-Object {$_.Tag -eq $ZertoVpgCheckpointTag} | `
        #                        Select-Object CheckpointIdentifier -ExpandProperty CheckpointIdentifier
        #}

        $ID =  Get-ZertoVPGCheckpoint -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgIdentifier $ZertoVpgIdentifier | `
                            Where-Object {$_.Tag -eq $ZertoVpgCheckpointTag} | `
                            Select-Object CheckpointIdentifier -ExpandProperty CheckpointIdentifier

        if ($ID.Count -gt 1) {Throw "'$ZertoVpgCheckpointTag' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$ZertoVpgCheckpointTag' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGCheckpointLastID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )
        
        $ID = (Get-ZertoVPGCheckpoint -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgIdentifier $ZertoVpgIdentifier)[-1] | 
                            Select-Object CheckpointIdentifier -ExpandProperty CheckpointIdentifier

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGCheckpointSummary {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/checkpoints/Summary"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        #Show depricated if 5.0u2 or higher
        try {
            switch ( [Version] $env:ZertoVersion) {
                { $_ -ge [Version]::new("5.0.21") }     #5.0u2
                  {         Write-Warning "Get-ZertoVPGCheckpointSummary is depricated as of Zerto 5.0u2.  Use Get-Get-ZertoVPGCheckpointStats."  }
                5.0.12 {  }   #5.0u1
                Default {}
            }
        } catch {
            Write-Warning "Invalid ZertoVersion: $env:ZertoVersion "
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGCheckpointStats {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/checkpoints/stats"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGEntityType {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/entitytypes"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGFailoverCommitPolicy {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/failovercommitpolicies"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGFailoverShutdownPolicy {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/failovershutdownpolicies"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGPriority {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/priorities"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGRetentionPolicy {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/retentionpolicies"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGStatus {
        [CmdletBinding(DefaultParameterSetName = 'Default')]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, ParameterSetName="Status", HelpMessage = 'Zerto VPG Status')] [string] $ZertoVPGStatus,
            [Parameter(Mandatory=$true, ParameterSetName="ID", HelpMessage = 'Zerto VPG Status ID')] [ZertoVPGStatus] $ZertoVPGStatusID
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "Status" {
                if ([string]::IsNullOrEmpty($ZertoVPGStatus)  ) {
                    throw "Missing Zerto VPG Status"
                }
                Return [ZertoVPGStatus]::$ZertoVPGStatus.value__
            }
            "ID" {
                Return [ZertoVPGStatus]$ZertoVPGStatusID
            }
            Default {
                #return [System.Enum]::GetNames([ZertoVPGStatus])
                $FullURL = $baseURL + "vpgs/statuses"
                Write-Verbose $FullURL

                try {
                    $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
                } catch {
                    Test-RESTError -err $_
                }
                return $Result
            }
        }    
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSubstatus {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken )
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/substatuses"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Add-ZertoVPG {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Name')] [string] $VPGName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Priority')] [ZertoVPGPriority] $Priority = 'Medium', 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Recovery Site Name')] [string] $RecoverySiteName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto RPO Alert in seconds')] [ValidateRange(0,99999)]  [int] $RPOAlertInSeconds = 300, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Test Interval in minutes')] [ValidateRange(0,9999999)] [int] $TestIntervalInMinutes = 262080, 
            [Parameter(Mandatory=$false, HelpMessage = 'Host Cluster Name')] [string] $ClusterName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Host Name')] [string] $HostName, 
            [Parameter(Mandatory=$false, HelpMessage = 'ResourcePool Name')] [string] $ResourcePoolName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Failover Network')] [string] $FailoverNetwork, 
            [Parameter(Mandatory=$false, HelpMessage = 'Failover Network ID')] [string] $FailoverNetworkID, 
            [Parameter(Mandatory=$false, HelpMessage = 'Test Network')] [string] $TestNetwork, 
            [Parameter(Mandatory=$false, HelpMessage = 'Test Network ID')] [string] $TestNetworkID, 
            [Parameter(Mandatory=$false, HelpMessage = 'Datastore Name')] [string] $DatastoreName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Datastore Cluster Name')] [string] $DatastoreClusterName,
            [Parameter(Mandatory=$false, HelpMessage = 'Use Default for Journal Datastore')] [switch] $JournalUseDefault, 
            [Parameter(Mandatory=$false, HelpMessage = 'Journal Datastore Name')] [string] $JournalDatastoreName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Journal Datastore Cluster Name')] [string] $JournalDatastoreClusterName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Journal History In Hours')] [ValidateRange(0,9999)] [int] $JournalHistoryInHours = 24, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Journal Hard Limit in MB')] [ValidateRange(0,9999999)] [int] $JournalHardLimitMB = 153600, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Journal Warning Threshold in MB')] [ValidateRange(0,9999999)] [int] $JournalWarningThresholdMB = 115200, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto vCenter Folder')] [string] $Folder,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto vCenter Folder ID')] [string] $FolderID,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Zorg ID')] [string] $ZorgID,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Service  Profile ID')] [string] $ServiceProfileID,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Pre-Recovery Script')] [string] $PreRecoveryScript,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Post-Recovery Script')] [string] $PostRecoveryScript,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Post-Recovery Script Timeout')] [int] $PostRecoveryScriptTimeOut =0,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Pre-Recovery Script Timeout')] [int] $PreRecoveryScriptTimeOut =0,

            
            

            [Parameter(Mandatory=$true, ParameterSetName="VMNames", HelpMessage = 'Zerto Virtual Machine names')] [string[]] $VmNames,
            [Parameter(Mandatory=$true, ParameterSetName="VMClass", HelpMessage = 'Zerto VPG Virtual Machine class')] [VPGVirtualMachine[]] $VPGVirtualMachines

            ,[Parameter(Mandatory=$false, HelpMessage = 'Commit this Zerto VPG')] [bool] $VPGCommit = $true
            ,[Parameter(Mandatory=$false, HelpMessage = 'Dump Json without posting for debug')] [switch] $DumpJson
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($VPGName)  ) { throw "Missing Zerto VPG Name" }
        if ([string]::IsNullOrEmpty($Priority)  ) { throw "Missing Zerto Priority" }

        #Validate Parameter Sets
        if ($FailoverNetwork -and $FailoverNetworkID) {throw "Cannot specify both Failover Network and Failover Network ID"}
        if (-not $FailoverNetwork -and -not $FailoverNetworkID) {throw "Must specify either Failover Network or Failover Network ID"}

        if ($TestNetwork -and $TestNetworkID) {throw "Cannot specify both Test Network and Test Network ID"}
        if (-not $TestNetwork -and -not $TestNetworkID) {throw "Must specify either Test Network or Test Network ID"}

        if ($HostName -and $ClusterName) {throw "Cannot specify Host Name and Cluster Name"}
        if ($HostName -and $ResourcePoolName) {throw "Cannot specify Host Name and Resource Pool Name"}
        if ($ClusterName -and $ResourcePoolName) {throw "Cannot specify Cluster Name and Resource Pool Name"}
        if (-not $HostName -and -not $ClusterName -and -not $ResourcePoolName) {throw "Must specify either Host Name,Cluster Name or ResourcePool Name"}

        if ($DatastoreName -and $DatastoreClusterName) {throw "Cannot specify both Datastore Name and Datastore Cluster Name"}
        if (-not $DatastoreName -and -not $DatastoreclusterName) {throw "Must specify either Datastore Name or Datastore Cluster Name"}

        if ($JournalUseDefault -and ($JournalDatastoreName -OR $JournalDatastoreclusterName ) )  {throw "Cannot specify JournalUseDefault and JournalDatastoreName or JournalDatastoreClusterName"}
        if ((-not $JournalUseDefault ) -and ($JournalDatastoreName -AND $JournalDatastoreclusterName) ) {throw "Cannot specify both JournalDatastoreName and JournalDatastoreClusterName"}
        if ((-not $JournalUseDefault ) -and (-not $JournalDatastoreName -and -not $JournalDatastoreclusterName)) {throw "Must specify either Journal Datastore Name or Journal Datastore Cluster Name"}

        if ($Folder -and $FolderID) {throw "Cannot specify both Folder and Folder ID"}
        if (-not $Folder -and -not $FolderID) {throw "Must specify either Folder or Folder ID"}

        if ($PreRecoveryScript -and $PreRecoveryScriptTimeOut -eq 0) { throw "Must specify a PreRecoveryScript timeout greater then 0"}
        if ($PostRecoveryScript -and $PostRecoveryScriptTimeOut -eq 0) { throw "Must specify a PostRecoveryScript timeout greater then 0"}

        ### Temp validation
        #If ($DatastoreClusterName)  {throw "Cannot specify DatastoreClusterName as a default value for the VPG (bug in zerto 5.0)"}

        if ( $VmNames.Count -lt 1 -and $VPGVirtualMachines.Count -lt 1 ) { throw "Must specify at least one VmName or VPGVirtualMachine"}

        #Get Identifiers
        $LocalSiteID = Get-ZertoLocalSiteID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken
        if ([string]::IsNullOrEmpty($LocalSiteID)  ) { throw "Could not find Local Site ID" }

        $RecoverySiteID = Get-ZertoVirtualizationSiteID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                     -ZertoSiteName $RecoverySiteName
        if ([string]::IsNullOrEmpty($RecoverySiteID)  ) { throw "Could not find Recovery Site ID for $RecoverySiteName " }
        
        #Get FailoverNeworkID if not specified
        if ($FailoverNetwork ) {
            $FailoverNetworkID = Get-ZertoSiteNetworkID -ZertoServer $ZertoServer -ZertoPort $ZertoPort  -ZertoToken $ZertoToken `
                                                        -ZertoSiteIdentifier $RecoverySiteID -NetworkName $FailoverNetwork
            if ([string]::IsNullOrEmpty($FailoverNetworkID)  ) { throw "Could not find Failover Network ID for $FailoverNetwork " }
            if ( $FailoverNetworkID.Count -gt 1 ) { throw "More than one Failover Network ID has the name $FailoverNetwork " }
        }
        #Get FailoverNeworkID if not specified
        if ($TestNetwork ) {
            $TestNetworkID = Get-ZertoSiteNetworkID -ZertoServer $ZertoServer -ZertoPort $ZertoPort  -ZertoToken $ZertoToken `
                                                     -ZertoSiteIdentifier $RecoverySiteID -NetworkName $TestNetwork
            if ([string]::IsNullOrEmpty($TestNetworkID)  ) { throw "Could not find Test Network ID for $TestNetwork " }
            if ( $TestNetworkID.Count -gt 1 ) { throw "More than one Test Network ID has the name $TestNetwork " }
        }

        if ($ClusterName) {
            $ClusterID = Get-ZertoSiteHostClusterID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                     -ZertoSiteIdentifier $RecoverySiteID -HostClusterName $ClusterName
            if ([string]::IsNullOrEmpty($ClusterID)  ) { throw "Could not find Cluster ID for $ClusterName " }
            $HostID = $null
        } elseif ($HostName) {
            $ClusterID = $null
            $HostID = Get-ZertoSiteHostID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                     -ZertoSiteIdentifier $RecoverySiteID -HostName $HostName
            if ([string]::IsNullOrEmpty($HostID)  ) { throw "Could not find Host ID for $HostName " }
        } elseif ($ResourcePoolName)
        {
            $ResourcePoolId = $null
            $ResourcePoolId = Get-ZertoSiteResourcePoolId -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                     -ZertoSiteIdentifier $RecoverySiteID -ZertoSiteResourcePoolName $ResourcePoolName
            if ([string]::IsNullOrEmpty($ResourcePoolId)  ) { throw "Could not find Resource Poool ID for $ResourcePoolName " }
        }
        

        #BROKEN
        #$ServiceProfileID = Get-ZertoServiceProfile -ZertoToken $ZertoToken  | `
        #                    Where-Object {$_.Description -eq  $ServiceProfile} | `
        #                    Select-Object SiteIdentifier -ExpandProperty SiteIdentifier

        if ($DatastoreName) {
            $DatastoreID = Get-ZertoSiteDatastoreID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                    -ZertoSiteIdentifier $RecoverySiteID -DatastoreName $DatastoreName
            if ([string]::IsNullOrEmpty($DatastoreID)  ) { throw "Could not find Datastore ID for $DatastoreName " }
            $DatastoreClusterID = $null
        } elseif ($DatastoreClusterName) {
            $DatastoreID = $null
            $DatastoreClusterID = Get-ZertoSiteDatastoreClusterID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                    -ZertoSiteIdentifier $RecoverySiteID -DatastoreClusterName $DatastoreclusterName
            if ([string]::IsNullOrEmpty($DatastoreClusterID)  ) { throw "Could not find Datastore Cluster ID for $DatastoreclusterName " }
        }

        if (-NOT $JournalUseDefault) {
            if ($JournalDatastoreName) {
                $JournalDatastoreID = Get-ZertoSiteDatastoreID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                        -ZertoSiteIdentifier $RecoverySiteID -DatastoreName  $JournalDatastoreName
                $JournalDatastoreClusterID = $null
                if ([string]::IsNullOrEmpty($JournalDatastoreID)  ) { throw "Could not find Datastore ID for $JournalDatastoreName " }
            } elseif ($JournalDatastoreClusterName) {
                $JournalDatastoreID = $null
                $JournalDatastoreClusterID = Get-ZertoSiteDatastoreClusterID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                        -ZertoSiteIdentifier $RecoverySiteID -DatastoreClusterName  $JournalDatastoreClusterName
                if ([string]::IsNullOrEmpty($JournalDatastoreClusterID)  ) { throw "Could not find Datastore Cluster ID for $JournalDatastoreclusterName " }
            }
        }

        #Get FailoverNeworkID if not specified
        if ($Folder ) {
            $FolderID = Get-ZertoSiteFolderID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                         -ZertoSiteIdentifier $RecoverySiteID -FolderName $Folder
            if ([string]::IsNullOrEmpty($FolderID)  ) { throw "Could not find Folder ID for $Folder " }
            if ( $FolderID.Count -gt 1 ) { throw "More than one Folder ID has the name $Folder " }
        }

        #Save our VMID in a VMName/ID Hash
        $VMNameAndIDHash = [ordered] @{}
        if ($VmNames) {
            $VmNames | ForEach-Object  {
                #VM's are always from LocalSite
                $VMID =  Get-ZertoSiteVMID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                     -ZertoSiteIdentifier $LocalSiteID -VMName $_ 
                $VMNameAndIDHash.Add($_, $VMID)
            }
        } elseif ($VPGVirtualMachines) {
            $VPGVirtualMachines | ForEach-Object  {
                #VM's are always from LocalSite
                $VMID =  Get-ZertoSiteVMID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken `
                                                     -ZertoSiteIdentifier $LocalSiteID -VMName $_.VMName 
                $VMNameAndIDHash.Add($_.VMName , $VMID)
            }
        } else {
            throw "No VM's specified"
        }

        if ( $RecoverySiteID.Count -gt 1 ) { throw "More than one Recovery site has the name $RecoverySiteName " }
        if ($ClusterName) {
            if ( $ClusterID.Count -gt 1 ) { throw "More than one Cluster ID has the name $ClusterName " }
        } elseif ($HostName) {
            if ( $HostID.Count -gt 1 ) { throw "More than one Host ID has the name $HostName  " }        
        } elseif ($ResourcePoolName) {
            if ( $ResourcePoolId.Count -gt 1 ) { throw "More than one Host ID has the name $HostName  " }
        }   
        
        if ($DatastoreName) {
            if ( $DatastoreID.Count -gt 1 ) { throw "More than one Datastore ID has the name $DatastoreName " }
        } elseif ($DatastoreClusterName) {
            if ( $DatastoreClusterID.Count -gt 1 ) { throw "More than one Datastore Cluster ID has the name $DatastoreclusterName " }
        }

        if (-NOT $JournalUseDefault) {
            if ($JournalDatastoreName) {
                if ( $JournalDatastoreID.Count -gt 1 ) { throw "More than one Datastore ID has the name $JournalDatastoreName " }
            } elseif ($JournalDatastoreClusterName) {
                if ( $JournalDatastoreClusterID.Count -gt 1 ) { throw "More than one Datastore Cluster ID has the name $JournalDatastoreclusterName " }
            }
        }

        #Build up our json object
        $NewBodyHash = [ordered] @{}
        #$NewBodyHash.Add('Backup' , $null)
        $Basic = [ordered] @{}        
        $Basic.Add( 'Name', $VPGName)
        $Basic.Add( 'Priority', $Priority.ToString() )
        $Basic.Add( 'ProtectedSiteIdentifier', $LocalSiteID)
        $Basic.Add( 'RecoverySiteIdentifier', $RecoverySiteID )        
        

        If ($ServiceProfileID){
            If ($ServiceProfileID -eq "11111111-1111-1111-1111-111111111111")
            {
                $Basic.Add( 'ServiceProfileIdentifier', $ServiceProfileID )
                $Basic.Add( 'RpoInSeconds', $RPOAlertInSeconds)
                $Basic.Add( 'JournalHistoryInHours', $JournalHistoryInHours)
                $Basic.Add( 'TestIntervalInMinutes', $TestIntervalInMinutes )

                $Journal = [ordered] @{}
                if ($JournalUseDefault) {
                    #Use the defaults
                    #if ($DatastoreID) {
                    #    $Journal.Add( 'DatastoreClusterIdentifier', $null)
                    #    $Journal.Add( 'DatastoreIdentifier', $DatastoreID)
                    #} else {
                    #    $Journal.Add( 'DatastoreClusterIdentifier', $DatastoreClusterID)
                    #    $Journal.Add( 'DatastoreIdentifier', $null)
                    #}
                    #$Journal.Add( 'DatastoreClusterIdentifier', $null)
                    #$Journal.Add( 'DatastoreIdentifier', $null)
                } else {
                    if ($JournalDatastoreID) {                        
                        $Journal.Add( 'DatastoreIdentifier', $JournalDatastoreID)
                    } else {                        
                        $Journal.Add( 'DatastoreIdentifier', $null)
                    }

                    if ($DatastoreClusterID)
                    {
                        #$Journal.Add('DatastoreClusterIdentifier', $DatastoreClusterID)
                        #$Journal.Add('DatastoreClusterIdentifier', $null)
                    }
                    else {                    
                        #$Journal.Add('DatastoreClusterIdentifier', $null)
                    }
                }
                $JournalLimit = [ordered] @{}
                #This should allow the %, but currently not a parameter
                if ($JournalHardLimitMB -gt 0) {
                    $JournalLimit.Add( 'HardLimitInMB', $JournalHardLimitMB )
                    $JournalLimit.Add( 'HardLimitInPercent', $null )
                } else {
                    $JournalLimit.Add( 'HardLimitInMB', $JournalHardLimitMB )
                    $JournalLimit.Add( 'HardLimitInPercent', $null )
                }
                $JournalLimit.Add( 'WarningThresholdInMB', $JournalWarningThresholdMB )
                $JournalLimit.Add( 'WarningThresholdInPercent', $null )
                $Journal.Add( 'Limitation', $JournalLimit)
                $NewBodyHash.Add('Journal' , $Journal )
            }
            else {
                $Basic.Add( 'ServiceProfileIdentifier', $ServiceProfileID )
                $Basic.Add( 'RpoInSeconds', $null)
                $Basic.Add( 'JournalHistoryInHours', $null)
                $Basic.Add( 'TestIntervalInMinutes', $null)
            }                            
        } else {
            $Basic.Add( 'ServiceProfileIdentifier', $null )

        }        

        
        $Basic.Add( 'UseWanCompression', $true )
        If ($ZorgID){
            $Basic.Add( 'ZorgIdentifier', $ZorgID )
        } else {
            $Basic.Add( 'ZorgIdentifier', $null )
        }        
        $NewBodyHash.Add('Basic' , $Basic)
        $BootGroupsItem = [ordered] @{}
        $BootGroupsItem.Add( 'BootDelayInSeconds', 0)
        $BootGroupsItem.Add( 'BootGroupIdentifier', '00000000-0000-0000-0000-000000000000')
        $BootGroupsItem.Add( 'Name', 'Default')
        $BootGroupsArray = @()
        $BootGroupsArray += $BootGroupsItem
        $BootGroups= @{'BootGroups' = $BootGroupsArray }
        $NewBodyHash.Add('BootGroups' , $BootGroups )
       
        $Networks = [ordered] @{}
                $Failover = [ordered] @{}
                    $DefaultNetworkIdentifier = [ordered] @{}
                    $DefaultNetworkIdentifier.Add('DefaultNetworkIdentifier', $FailoverNetworkID)
                    $Failover.Add( 'Hypervisor', $DefaultNetworkIdentifier )
            $Networks.Add( 'Failover', $Failover)
                $FailoverTest = [ordered] @{}
                    $DefaultNetworkIdentifier = [ordered] @{}
                    $DefaultNetworkIdentifier.Add('DefaultNetworkIdentifier', $TestNetworkID)
                $FailoverTest.Add( 'Hypervisor', $DefaultNetworkIdentifier )
            $Networks.Add( 'FailoverTest', $FailoverTest)
            $NewBodyHash.Add('Networks' , $Networks )
        $Recovery = [ordered] @{}
            if ($DatastoreID) {                
                $Recovery.Add( 'DefaultDatastoreIdentifier', $DatastoreID)
            } else {                
                $Recovery.Add( 'DefaultDatastoreClusterIdentifier', $DatastoreClusterID)                 
                $Recovery.Add( 'DefaultDatastoreIdentifier', $null)
            }
            $Recovery.Add( 'DefaultFolderIdentifier', $FolderID)
            if ($ClusterID) {
                $Recovery.Add( 'DefaultHostClusterIdentifier', $ClusterID)
                $Recovery.Add( 'DefaultHostIdentifier', $null)
            }
            elseif ($ResourcePoolId){
                $Recovery.Add( 'ResourcePoolIdentifier', $ResourcePoolId)
                $Recovery.Add( 'DefaultHostIdentifier', $null)
                $Recovery.Add( 'DefaultHostClusterIdentifier', $null)
            } else {
                $Recovery.Add( 'DefaultHostClusterIdentifier', $null)
                $Recovery.Add( 'DefaultHostIdentifier', $HostID)
            }
            
            $NewBodyHash.Add( 'Recovery' , $Recovery )
        $Scripting = [ordered] @{}
            $Scripting.Add( 'PostBackup', $null)
                $PostRecovery = [ordered] @{}                
                $PostRecovery.Add( 'Command', $PostRecoveryScript)
                $PostRecovery.Add( 'Parameters', $null)
                $PostRecovery.Add( 'TimeoutInSeconds', $PostRecoveryScriptTimeOut)
            $Scripting.Add( 'PostRecovery', $PostRecovery)
                $PreRecovery = [ordered] @{}
                $PreRecovery.Add( 'Command', $PreRecoveryScript)
                $PreRecovery.Add( 'Parameters', $null)
                $PreRecovery.Add( 'TimeoutInSeconds', $PreRecoveryScriptTimeOut)
            $Scripting.Add( 'PreRecovery', $PreRecovery)               
            $NewBodyHash.Add( 'Scripting' , $Scripting )
        $VMArray= @()
            if ($VmNames) {
                #This section is VM + ID only
                if ($VMNameAndIDHash.Keys.Count -gt 0) { 
                    $VMNameAndIDHash.Keys | ForEach-Object {
                        $VMArray += @{ 'VmIdentifier' =  $VMNameAndIDHash[$_] }
                    }
                }
            } elseif ($VPGVirtualMachines) {
                $VPGVirtualMachines | ForEach-Object {
                    #region VM Foreach
                    $NewVmHash = [ordered] @{}
                        #Lookup ID from $VMNameAndIDHash
                        $NewVmHash.Add('VmIdentifier' , $VMNameAndIDHash[$_.VMName] )
                        $NewVmHash.Add('BootGroupIdentifier', '00000000-0000-0000-0000-000000000000' )
                        #Loop through our NICs
                        $AllNics = @()
                        $_.VPGFailoverIPAddresses | ForEach-Object {
                            $Nic = [ordered] @{}
                                $Nic.Add( "NicIdentifier" , $_.NicName)
                                $NicFail = [ordered] @{}
                                    $NicFailHyper = [ordered] @{}
                                        $NicFailHyper.Add("DnsSuffix", $_.DnsSuffix)
                                            $NicFailHyperIP = [ordered] @{}
                                            if ($_.UseDHCP) {
                                                $NicFailHyperIP.Add("Gateway", "")
                                                $NicFailHyperIP.Add("IsDhcp", $true)
                                                $NicFailHyperIP.Add("PrimaryDns", "")
                                                $NicFailHyperIP.Add("SecondaryDns", "")
                                                $NicFailHyperIP.Add("StaticIp", "")
                                                $NicFailHyperIP.Add("SubnetMask", "")
                                            } else {
                                                $NicFailHyperIP.Add("Gateway", $_.Gateway)
                                                $NicFailHyperIP.Add("IsDhcp", $false)
                                                $NicFailHyperIP.Add("PrimaryDns", $_.Dns1)
                                                $NicFailHyperIP.Add("SecondaryDns", $_.Dns2)
                                                $NicFailHyperIP.Add("StaticIp", $_.IPAddress)
                                                $NicFailHyperIP.Add("SubnetMask", $_.SubnetMask)
                                            }
                                        $NicFailHyper.Add("IpConfig", $NicFailHyperIP)
                                        if ($_.NetworkID) { $NicFailHyper.Add( "NetworkIdentifier" , $_.NetworkID) }
                                        $NicFailHyper.Add("ShouldReplaceMacAddress" , $_.ReplaceMAC)
                                    $NicFail.Add( "Hypervisor", $NicFailHyper)
                                #Add Failover to NIC
                                $Nic.Add("Failover", $NicFail)
                            If ($_.TestIPAddress -or $_.TestUseDHCP) {
                                $NicTest = [ordered] @{}
                                    $NicTestHyper = [ordered] @{}
                                        $NicTestHyper.Add("DnsSuffix", $_.TestDnsSuffix)
                                            $NicTestHyperIP = [ordered] @{}
                                            if ($_.TestUseDHCP) {
                                                $NicTestHyperIP.Add("Gateway", "")
                                                $NicTestHyperIP.Add("IsDhcp", $true)
                                                $NicTestHyperIP.Add("PrimaryDns", "")
                                                $NicTestHyperIP.Add("SecondaryDns", "")
                                                $NicTestHyperIP.Add("StaticIp", "")
                                                $NicTestHyperIP.Add("SubnetMask", "")
                                            } else {
                                                $NicTestHyperIP.Add("Gateway", $_.TestGateway)
                                                $NicTestHyperIP.Add("IsDhcp", $false)
                                                $NicTestHyperIP.Add("PrimaryDns", $_.TestDns1)
                                                $NicTestHyperIP.Add("SecondaryDns", $_.TestDns2)
                                                $NicTestHyperIP.Add("StaticIp", $_.TestIPAddress)
                                                $NicTestHyperIP.Add("SubnetMask", $_.TestSubnetMask)
                                            }
                                        $NicTestHyper.Add("IpConfig", $NicTestHyperIP)
                                        if ($_.TestNetworkID) { $NicTestHyper.Add( "NetworkIdentifier" , $_.TestNetworkID) }
                                        $NicTestHyper.Add( "ShouldReplaceMacAddress" , $_.TestReplaceMAC)
                                    $NicTest.Add("Hypervisor", $NicTestHyper)
                                #Add Failover Test to NIC
                                $Nic.Add("FailoverTest", $NicTest)
                            }
                        
                            $AllNics += $Nic
                        }  #end of foreach $_.VPGFailoverIPAddresses 
                        $NewVmHash.Add('Nics', $AllNics )
                        #Add recovery block if needed
                        If ($_.VPGVMRecovery) {
                            $VMRecovery = [ordered] @{}
                                #Don't send blanks
                                if ($_.VPGVMRecovery.DatastoreClusterIdentifier) { $VMRecovery.Add( 'DatastoreClusterIdentifier', $_.VPGVMRecovery.DatastoreClusterIdentifier) }
                                if ($_.VPGVMRecovery.DatastoreIdentifier) { $VMRecovery.Add( 'DatastoreIdentifier', $_.VPGVMRecovery.DatastoreIdentifier) }
                                if ($_.VPGVMRecovery.FolderIdentifier) { $VMRecovery.Add( 'FolderIdentifier', $_.VPGVMRecovery.FolderIdentifier) }
                                if ($_.VPGVMRecovery.HostClusterIdentifier) { $VMRecovery.Add( 'HostClusterIdentifier', $_.VPGVMRecovery.HostClusterIdentifier) }
                                if ($_.VPGVMRecovery.HostIdentifier) { $VMRecovery.Add( 'HostIdentifier', $_.VPGVMRecovery.HostIdentifier) }
                                if ($_.VPGVMRecovery.ResourcePoolIdentifier) { $VMRecovery.Add( 'ResourcePoolIdentifier', $_.VPGVMRecovery.ResourcePoolIdentifier) }
                            $NewVmHash.Add('Recovery', $VMRecovery)
                        }
                    #Add this VM Hash to the VMArray
                    $VMArray += $NewVmHash
                    #endregion
                }
            } else {
                throw "No VM's specified"
            }
            $NewBodyHash.Add( 'Vms' , $VMArray)
        
        #
        #Convert VPG Hash to JSON - Remember DEPTH!!!
        $NewVPGJson = $NewBodyHash | ConvertTo-Json -Depth 20

        $FullURL = $baseURL + "vpgsettings"
        Write-Verbose $FullURL
        Write-Verbose $NewVPGJson
        
        if ($DumpJson ) {
            #Display JSON, and exit
            Write-host $NewVPGJson
            return
        }

        #This POST creates the settings
        $VPGSettingsID = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $NewVPGJson
        if ( $VPGSettingsID -eq $null ) { throw "Error creating VPG" }
        Write-Verbose ("VPGSettingsID: " + $VPGSettingsID)

        $VPGSetting = Get-ZertoVPGSetting -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgSettingsIdentifier $VPGSettingsID
        if ( $VPGSetting -eq $null ) { throw "Error retrieving VPGSettings for VPGSettingsID" }

        Write-Verbose  $VPGSetting

        if (-not $VPGCommit) {
            Write-Host "VPG Setting $VPGSettingsID created.  Commit with '" -NoNewline -ForegroundColor Red
            write-host "Submit-ZertoVPGSetting -ZertoVpgSettingsIdentifier $VPGSettingsID" -ForegroundColor Cyan -NoNewline
            Write-Host "'" -ForegroundColor Red
            return $VPGSettingsID 
        }

        #Returns VPG Task ID
        $Result = Submit-ZertoVPGSetting -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgSettingsIdentifier $VPGSettingsID
        return $Result 

    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPG {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Force Remove')] [Bool] $Force = $false,
            [Parameter(Mandatory=$false, HelpMessage = 'Keep Recovery Volumes')] [Bool] $KeepRecoveryVolumes = $false
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier
        Write-Verbose $FullURL

        $BodyHash = [ordered] @{}
        $BodyHash.Add("Force", $Force)
        $BodyHash.Add("KeepRecoveryVolumes", $KeepRecoveryVolumes)
        $Body = $BodyHash | ConvertTo-Json
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete -Body $Body
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVPGForceSync {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/forcesync"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Start-ZertoVPGClone {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Checkpoint Identifier (default is latest)')] [string] $ZertoVpgCheckpointIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'DatastoreIdentifier')] [string] $DatastoreIdentifier
            ,[Parameter(Mandatory=$false, HelpMessage = 'Dump Json without posting for debug')] [switch] $DumpJson
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/Clonestart"
        Write-Verbose $FullURL
        
        #Both parameters are optional
        $BodyHash = [ordered] @{}
        if (-not ( [string]::IsNullOrEmpty($ZertoVpgCheckpointIdentifier) )  ) {
            $BodyHash.Add("CheckpointIdentifier", $ZertoVpgCheckpointIdentifier)
        }
        if (-not ( [string]::IsNullOrEmpty($DatastoreIdentifier) )  ) {
            $BodyHash.Add("DatastoreIdentifier", $DatastoreIdentifier)
        }

        $BodyJson = $BodyHash | ConvertTo-Json
        Write-Verbose $BodyJson
        if ($DumpJson ) {
            #Display JSON, and exit
            Write-host $BodyJson
            return
        }
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $BodyJson
        } catch {
            Test-RESTError -err $_
        }

        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Stop-ZertoVPGClone {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/CloneAbort"
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Start-ZertoVPGFailover {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Checkpoint Identifier (default is latest)')] [string] $ZertoVpgCheckpointIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Commit Policy')] [ZertoCommitPolicy] $CommitPolicy = "Commit",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Commit Value in seconds')] [string] $CommitInSeconds,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Shutdown Policy')] [ZertoShutdownPolicy] $ShutdownPolicy = "Shutdown",
            [Parameter(Mandatory=$true, HelpMessage = 'Time to wait before shutdown in seconds')] [string] $TimeToWaitBeforeShutdownInSec,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Reverse Protection')] [bool] $ReverseProtection = $true
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/Failover"
        Write-Verbose $FullURL
        
        $BodyHash = [ordered] @{}
        if ($ZertoVpgCheckpointIdentifier) {
            $BodyHash.Add("CheckpointIdentifier", $ZertoVpgCheckpointIdentifier )
        } else {
            $BodyHash.Add("CheckpointIdentifier", (Get-ZertoVPGCheckpointLastID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgIdentifier $ZertoVpgIdentifier )  )
        }
        $BodyHash.Add("CommitPolicy", $CommitPolicy )
        #$Failover.Add("CommitValue", $CommitInSeconds)
        $BodyHash.Add("ShutdownPolicy", $ShutdownPolicy )
        $BodyHash.Add("TimeToWaitBeforeShutdownInSec", $TimeToWaitBeforeShutdownInSec )
        $BodyHash.Add("IsReverseProtection", $ReverseProtection )
        $BodyJson = $BodyHash | ConvertTo-Json
        Write-Verbose $BodyJson

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $BodyJson
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVPGFailoverCommit {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Reverse Protection')] [bool] $ReverseProtection = $true
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/failovercommit" 
        Write-Verbose $FullURL

        $BodyHash = [ordered] @{}
        $BodyHash.Add("IsReverseProtection", $ReverseProtection)
        $BodyJson = $BodyHash | ConvertTo-Json -Depth 20

        Write-Verbose $BodyJson
        if ($DumpJson ) {
            #Display JSON, and exit
            Write-host $BodyJson
            return
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST -Body $BodyJson
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVPGFailoverRollback {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG  Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG  Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/failoverRollback" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Start-ZertoVPGFailoverTest {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Checkpoint Identifier')] [string] $ZertoVpgCheckpointIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/FailoverTest"
        Write-Verbose $FullURL
        
        if ($ZertoVpgCheckpointIdentifier) {
            $BodyHash = [ordered] @{}
            $BodyHash.Add("checkpointIdentifier", $ZertoVpgCheckpointIdentifier)
            $Body = $BodyHash | ConvertTo-Json
            Write-Verbose $Body
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $Body
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Stop-ZertoVPGFailoverTest {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Failover Test success status')] [bool] $FailoverTestSuccess = $true,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Failover Test result summary')] [string] $FailoverTestSummary
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/FailoverTestStop"
        Write-Verbose $FullURL
        
        $BodyHash = [ordered] @{}
        $BodyHash.Add("FailoverTestSuccess", $FailoverTestSuccess)
        $BodyHash.Add("FailoverTestSummary", $FailoverTestSummary)
        $Body = $BodyHash | ConvertTo-Json
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $Body
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVPGPause {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG  Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG  Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/pause" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVPGResume {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG  Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG  Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/resume" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }
#endregion

#region Zerto VPG Settings

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSetting {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
                    throw "Missing Zerto VPG Settings Identifier"
                }

                $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier
            }
            Default {        
                $FullURL = $baseURL + "vpgSettings"
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingID {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Setting Name')] [string] $VpgSettingName
        )

        $ID =  Get-ZertoVPGSetting -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.Basic.Name -eq $VpgSettingName} | `
                            Select-Object VpgSettingsIdentifier -ExpandProperty VpgSettingsIdentifier

        if ($ID.Count -gt 1) {Throw "'$VpgSettingName' returned more than one ID"}
        if ($ID.Count -eq 0) {Throw "'$VpgSettingName' was not found"}

        return $ID.ToString()
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSetting {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings obejct')] [ZertoVPGSetting] $ZertoVPGSetting
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier
        Write-Verbose $FullURL
        $Body = $ZertoVPGSetting | Remove-Null | ConvertTo-Json -Depth 99
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method PUT -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    Function Set-ZertoVPGSettingJson {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings obejct')] [PSObject] $ZertoVPGSetting
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier
        Write-Verbose $FullURL
        $Body = $ZertoVPGSetting | ConvertTo-Json -Depth 99
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method PUT -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Add-ZertoVPGSetting {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings obejct')] [ZertoVPGSetting] $ZertoVPGSetting
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "vpgSettings"
        Write-Verbose $FullURL
        $Body = $ZertoVPGSetting | ConvertTo-Json -Depth 99
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Submit-ZertoVPGSetting {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/commit" 
        Write-Verbose $FullURL

        try {
                $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPGSetting {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBackup {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/backup"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingBackup {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Basic obejct')] [ZertoVPGSettingBackup] $ZertoVPGSettingBackup
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/backup"
        Write-Verbose $FullURL
        $Body = $ZertoVPGSettingBackup | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Put -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPGSettingBackup {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/backup"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBackupDayOfWeek {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/backup/dayofweek"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBackupRetentionPeriod {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/backup/retentionperiod"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBackupSchedulerPeriod {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/backup/schedulerperiod"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBasic {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/basic"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingBasic {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Basic object')] [ZertoVPGSettingBasic] $ZertoVpgSettingBasic
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/basic"
        Write-Verbose $FullURL
        $Body = $ZertoVpgSettingBasic | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Put -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPGSettingBasic {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/basic"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBootGroup {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/bootgroup"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingBootGroup {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings BootGroup object')] [ZertoVpgSettingBootGroups] $ZertoVpgSettingBootGroup
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/bootgroup"
        Write-Verbose $FullURL
        $Body = $ZertoVpgSettingBootGroup | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Put -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPGSettingBootGroup {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/bootgroup"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingJournal {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/journal"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingJournal {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Journal object')] [ZertoVPGSettingJournal] $ZertoVPGSettingJournal
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/journal"
        Write-Verbose $FullURL
        $Body = $ZertoVPGSettingJournal | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Put -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingNetwork {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/networks"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }
    
    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingNetwork {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Network object')] [ZertoVPGSettingNetworks] $ZertoVPGSettingNetworks
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/networks"
        Write-Verbose $FullURL
        $Body = $ZertoVPGSettingNetworks | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Put -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPGSettingNetwork {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/networks"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingPriority {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/priority"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingRecovery {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/recovery"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingRecovery {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Scripting object')] [ZertoVPGSettingRecovery] $ZertoVPGSettingRecovery
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/recovery"
        Write-Verbose $FullURL
        $Body = $ZertoVPGSettingRecovery | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Put -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPGSettingRecovery {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/recovery"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }    

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingScripting {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/scripting"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingScripting {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Scripting object')] [ZertoVPGSettingScripting] $ZertoVPGSettingScripting
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/scripting"
        Write-Verbose $FullURL
        $Body = $ZertoVPGSettingScripting | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Put -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPGSettingScripting {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/scripting"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingVM {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
                    throw "Missing Zerto VPG Settings VM Identifier"
                }

                $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier
            }
            Default {        
                $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms"
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingVM {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings VM ID')] [string] $ZertoVPGSettingVMID,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings VM object')] [ZertoVPGSettingVM] $ZertoVPGSettingVM
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/VMs/" + $ZertoVPGSettingVMID
        Write-Verbose $FullURL
        $Body = $ZertoVPGSettingVM | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Put -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPGSettingVM {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ([string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Add-ZertoVPGSettingVM {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings VM object')] [ZertoVPGSettingVM] $ZertoVPGSettingVM
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/VMs"
        Write-Verbose $FullURL
        $Body = $ZertoVPGSettingVM | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }    

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingVMNIC {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto VM Identifier')] [string] $ZertoNicIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ([string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoNicIdentifier)  ) {
                    throw "Missing Zerto NIC Identifier"
                }
                $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/nics/" + $ZertoNicIdentifier
            }
            Default {        
                $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/nics"
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingVMNIC {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM NIC Identifier')] [string] $ZertoNicIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings VM Nic object')] [ZertoVPGSettingVMNic] $ZertoVPGSettingVMNic
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ([string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }
        if ([string]::IsNullOrEmpty($ZertoNicIdentifier)  ) {
            throw "Missing Zerto NIC Identifier"
        }
        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/nics/" + $ZertoNicIdentifier
        Write-Verbose $FullURL
        $Body = $ZertoVPGSettingVMNic | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method PUT -Body $Body
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPGSettingVMNIC {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM NIC Identifier')] [string] $ZertoNicIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ([string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }
        if ([string]::IsNullOrEmpty($ZertoNicIdentifier)  ) {
            throw "Missing Zerto NIC Identifier"
        }
        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/nics/" + $ZertoNicIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingVMVolume {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier,
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto VM Volumne Identifier')] [string] $ZertoVMVolumeIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ([string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }

        switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoVMVolumeIdentifier)  ) {
                    throw "Missing Zerto Volume Identifier"
                }
                $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/volumes/" + $ZertoVMVolumeIdentifier
            }
            Default {        
                $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/volumes"
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingVMVolume {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Volume Identifier')] [string] $ZertoVMVolumeIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings VM Volume object')] [ZertoVPGSettingVMVolume] $ZertoVPGSettingVMVolume
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ([string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ([string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }
        if ([string]::IsNullOrEmpty($ZertoVMVolumeIdentifier)  ) {
            throw "Missing Zerto VM Volume Identifier"
        }
        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/volumes/" + $ZertoVMVolumeIdentifier
        Write-Verbose $FullURL
        $Body = $ZertoVPGSettingVMVolume | ConvertTo-Json -Depth 10
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method PUT -Body $Body
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

#endregion

#region Zerto ZOrgs

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoZOrg {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$false, ParameterSetName="ID", HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoOrgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

       switch ($PsCmdlet.ParameterSetName) {
            "ID" {
                if ([string]::IsNullOrEmpty($ZertoOrgIdentifier)  ) {
                    throw "Missing Zerto Org Identifier"
                }
                $FullURL = $baseURL + "zorgs/" + $ZertoOrgIdentifier
            }
            Default {        
                $FullURL = $baseURL + "zorgs"
            }
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

#endregion

#region Zerto Resoure Report

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoResouresReport {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report From Time (YYYY-MM-DD HH:MM:SS)')] [string] $FromTime, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report To Time (YYYY-MM-DD HH:MM:SS)')] [string] $ToTime, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Report Start Index ')] [string] $StartIndex, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Report Records to retrieve 1 to 500')] [string] $Count = 500
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/ZvmService/ResourcesReport/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        if ($Count -lt 1 -or $Count -gt 500) {
            throw "Invalid Count - must be from 1 to 500"
        }  

        $FullURL = $baseURL + "getSamples"
        if ($FromTime -or $ToTime -or $StartIndex -or $Count ) {
            $qs = [ordered] @{}
            if ($FromTime)   { if (Parse-ZertoDate($FromTime))    { $qs.Add("fromTimeString", $FromTime) } else { throw "Invalid FromTime: '$FromTime'" } }
            if ($ToTime)     { if (Parse-ZertoDate($ToTime))      { $qs.Add("toTimeString",   $ToTime)   } else { throw "Invalid ToTime: '$ToTime'" } }
            if ($StartIndex) { $qs.Add("startIndex",    $StartIndex)  }
            if ($Count) { $qs.Add("count", $Count) }
            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoResourcesReportAdvFilter {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server or ENV:\ZertoServer')] [string] $ZertoServer = ( Get-EnvZertoServer )  ,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = ( Get-EnvZertoPort ),
            [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken or ENV:\ZertoToken')] [Hashtable] $ZertoToken = ( Get-EnvZertoToken ),
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report From Time (YYYY-MM-DD HH:MM:SS)')] [string] $FromTime, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report To Time (YYYY-MM-DD HH:MM:SS)')] [string] $ToTime, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Report Start Index ')] [string] $StartIndex, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report Records to Retrieve 1 to 500')] [string] $Count,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report Records Advanced Filter')] [string] $Filter
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/ZvmService/ResourcesReport/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "getSamples"
        if ($FromTime -or $ToTime -or $StartIndex -or $Count -or $Filter ) {
            $qs = [ordered] @{}
            if ($FromTime)   { if (Parse-ZertoDate($FromTime))    { $qs.Add("fromTimeString", $FromTime) } else { throw "Invalid FromTime: '$FromTime'" } }
            if ($ToTime)     { if (Parse-ZertoDate($ToTime))      { $qs.Add("toTimeString",   $ToTime)   } else { throw "Invalid ToTime: '$ToTime'" } }
            if ($StartIndex) { $qs.Add("startIndex",    $StartIndex)  }
            if ($Count) { $qs.Add("count", $Count) }
            if ($Filter) { $qs.Add("Filter", $Filter) }
            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    Function Remove-Null 
    {
    [cmdletbinding()]
    param(
            # Object to remove null values from
            [parameter(ValueFromPipeline,Mandatory)]
            [object]$InputObject,        
            [switch]$recurse
        )
        
        If (-not $recurse.IsPresent)
        {
            $NewObject = $InputObject.PsObject.Copy()
        }
        else
        {
            $NewObject  = $InputObject
        }


        foreach ($Item in $NewObject.psObject.Properties)
        {
            If ($($Item.TypeNameOfValue) -in ("System.Management.Automation.PSCustomObject","System.Object[]"))
            {
                $NewObject.$($Item.Name) | Remove-Null2 -recurse | Out-Null
            }
            else
            {
                If ($Item.Value -eq $null)
                {
                    $NewObject.psObject.Properties.remove($Item.name)
                }
            }
        }

        $NewObject
    }

#endregion

# $PrivateFunctions = @('Set-SSLCertByPass', 'Get-QueryStringFromHashTable', 'Parse-ZertoDate', `
#                       'Test-RESTError', 'Convert-ZertoTokenHash', 'Get-EnvZertoServer', 'Get-EnvZertoPort', 'Get-EnvZertoToken' )

# ( "Export-ModuleMember -function " + ( Get-Content .\ZertoModule\ZertoModule.psm1 | ForEach-Object {$_.trim()} | `
#                                         Where-Object { $_ -imatch "^Function *" } | sort | ForEach-Object {  ($_ -split "\s",3)[1] } | `
#                                         Where-Object {$_ -notin $PrivateFunctions} | ForEach-Object { "```n`t`t`t" + $_ + "," })).TrimEnd( ',```n' )


# $PrivateFunctions = @('Set-SSLCertByPass', 'Get-QueryStringFromHashTable', 'Parse-ZertoDate', `
#                       'Test-RESTError', 'Convert-ZertoTokenHash', 'Get-EnvZertoServer', 'Get-EnvZertoPort', 'Get-EnvZertoToken' )
# Get-Content .\ZertoModule\ZertoModule.psm1 | ForEach-Object {$_.trim()} |  Where-Object { $_ -imatch "^Function *" } | sort | ForEach-Object {  ($_ -split "\s",3)[1] } | Where-Object {$_ -notin $PrivateFunctions} | ForEach-Object {$_ + ", "}

$PrivateFunctions = @('Set-SSLCertByPass', 'Get-QueryStringFromHashTable', 'Parse-ZertoDate', `
                      'Test-RESTError', 'Convert-ZertoTokenHash', 'Get-EnvZertoServer', 'Get-EnvZertoPort', 'Get-EnvZertoToken' )

$Functions = @( ( Get-Content $MyInvocation.MyCommand.Path | ForEach-Object {$_.trim()} | `
                                         Where-Object { $_ -imatch "^Function *" } | Sort-Object | ForEach-Object {  ($_ -split "\s",3)[1] } | `
                                         Where-Object {$_ -notin $PrivateFunctions} ) )

Export-ModuleMember -function  $Functions
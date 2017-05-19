#
# Module manifest for module 'PSGet_ZertoModule'
#
# Generated by: Christopher Lewis
#
# Generated on: 5/19/2017
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'ZertoModule.psm1'

# Version number of this module.
ModuleVersion = '1.0.6'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'a7c23e30-0879-42f4-9e1c-bffbe723b02b'

# Author of this module
Author = 'Christopher Lewis'

# Company or vendor of this module
CompanyName = 'Christopher Lewis'

# Copyright statement for this module
Copyright = '(c) 2017 Christopher Lewis. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Zerto REST API Powershell Wrapping module'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Add-ZertoVPG', 'Add-ZertoVPGSettingVM', 'Add-ZertoVRA', 
               'Connect-ZertoPeerSite', 'Connect-ZertoZVM', 
               'Convert-ZertoVPGToVPGSetting', 'Disconnect-ZertoPeerSite', 
               'Disconnect-ZertoZVM', 'Get-ZertoAlert', 'Get-ZertoAlertEntity', 
               'Get-ZertoAlertHelpIdentifier', 
               'Get-ZertoAlertHelpIdentifierDescription', 'Get-ZertoAlertLevel', 
               'Get-ZertoAuthToken', 'Get-ZertoEvent', 'Get-ZertoEventCategory', 
               'Get-ZertoEventEntity', 'Get-ZertoEventType', 'Get-ZertoLocalSite', 
               'Get-ZertoLocalSiteID', 'Get-ZertoLocalSitePairingStatus', 
               'Get-ZertoPeerSite', 'Get-ZertoPeerSiteID', 
               'Get-ZertoResourcesReportAdvFilter', 'Get-ZertoResouresReport', 
               'Get-ZertoRESTAPI', 'Get-ZertoServiceProfile', 
               'Get-ZertoServiceProfileID', 'Get-ZertoSite', 
               'Get-ZertoSiteDatastore', 'Get-ZertoSiteDatastoreCluster', 
               'Get-ZertoSiteDatastoreClusterID', 'Get-ZertoSiteDatastoreID', 
               'Get-ZertoSiteFolder', 'Get-ZertoSiteFolderID', 'Get-ZertoSiteHost', 
               'Get-ZertoSiteHostCluster', 'Get-ZertoSiteHostClusterID', 
               'Get-ZertoSiteHostID', 'Get-ZertoSiteID', 'Get-ZertoSiteNetwork', 
               'Get-ZertoSiteNetworkID', 'Get-ZertoSiteOrgVCD', 
               'Get-ZertoSiteRepository', 'Get-ZertoSiteRepositoryID', 
               'Get-ZertoSiteResourcePool', 'Get-ZertoSiteVApp', 
               'Get-ZertoSiteVcdVapp', 'Get-ZertoSiteVM', 'Get-ZertoSiteVMID', 
               'Get-ZertoTask', 'Get-ZertoTaskState', 'Get-ZertoTaskType', 
               'Get-ZertoVirtualizationSite', 'Get-ZertoVirtualizationSiteID', 
               'Get-ZertoVM', 'Get-ZertoVMID', 'Get-ZertoVPG', 
               'Get-ZertoVPGCheckpoint', 'Get-ZertoVPGCheckpointID', 
               'Get-ZertoVPGCheckpointLastID', 'Get-ZertoVPGCheckpointStats', 
               'Get-ZertoVPGCheckpointSummary', 'Get-ZertoVPGEntityType', 
               'Get-ZertoVPGFailoverCommitPolicy', 
               'Get-ZertoVPGFailoverShutdownPolicy', 'Get-ZertoVPGID', 
               'Get-ZertoVPGPriority', 'Get-ZertoVPGRetentionPolicy', 
               'Get-ZertoVPGSetting', 'Get-ZertoVPGSettingBackup', 
               'Get-ZertoVPGSettingBackupDayOfWeek', 
               'Get-ZertoVPGSettingBackupRetentionPeriod', 
               'Get-ZertoVPGSettingBackupSchedulerPeriod', 
               'Get-ZertoVPGSettingBasic', 'Get-ZertoVPGSettingBootGroup', 
               'Get-ZertoVPGSettingID', 'Get-ZertoVPGSettingJournal', 
               'Get-ZertoVPGSettingNetwork', 'Get-ZertoVPGSettingPriority', 
               'Get-ZertoVPGSettingRecovery', 'Get-ZertoVPGSettingScripting', 
               'Get-ZertoVPGSettingVM', 'Get-ZertoVPGSettingVMNIC', 
               'Get-ZertoVPGSettingVMVolume', 'Get-ZertoVPGStatus', 
               'Get-ZertoVPGSubstatus', 'Get-ZertoVRA', 'Get-ZertoVRAID', 
               'Get-ZertoVRAIPConfigurationType', 'Get-ZertoVRAStatus', 
               'Get-ZertoZOrg', 'Invoke-ZertoAlertDismiss', 
               'Invoke-ZertoAlertUndismiss', 'Invoke-ZertoVPGFailoverCommit', 
               'Invoke-ZertoVPGFailoverRollback', 'Invoke-ZertoVPGForceSync', 
               'Invoke-ZertoVPGPause', 'Invoke-ZertoVPGResume', 
               'Invoke-ZertoVRAUpgrade', 'New-ZertoVPGFailoverIPAddress', 
               'New-ZertoVPGSetting', 'New-ZertoVPGSettingBackup', 
               'New-ZertoVPGSettingBackupRetry', 
               'New-ZertoVPGSettingBackupScheduler', 'New-ZertoVPGSettingBasic', 
               'New-ZertoVPGSettingBootGroups', 
               'New-ZertoVPGSettingBootGroupsBootGroups', 
               'New-ZertoVPGSettingJournal', 
               'New-ZertoVPGSettingJournalLimitation', 
               'New-ZertoVPGSettingNetworks', 'New-ZertoVPGSettingNetworksNetwork', 
               'New-ZertoVPGSettingNetworksNetworkHypervisor', 
               'New-ZertoVPGSettingRecovery', 'New-ZertoVPGSettingScript', 
               'New-ZertoVPGSettingScripting', 'New-ZertoVPGSettingVM', 
               'New-ZertoVPGSettingVMNic', 'New-ZertoVPGSettingVMNicNetwork', 
               'New-ZertoVPGSettingVMNicNetworkHypervisor', 
               'New-ZertoVPGSettingVMNicNetworkHypervisorIpConfig', 
               'New-ZertoVPGSettingVMRecovery', 'New-ZertoVPGSettingVMVolume', 
               'New-ZertoVPGSettingVMVolumeDatastore', 
               'New-ZertoVPGSettingVMVolumeExistingVolume', 
               'New-ZertoVPGVirtualMachine', 'New-ZertoVPGVMRecovery', 
               'New-ZertoVRAIPAddressConfig', 'Remove-ZertoAuthToken', 
               'Remove-ZertoVPG', 'Remove-ZertoVPGSetting', 
               'Remove-ZertoVPGSettingBackup', 'Remove-ZertoVPGSettingBasic', 
               'Remove-ZertoVPGSettingBootGroup', 'Remove-ZertoVPGSettingNetwork', 
               'Remove-ZertoVPGSettingRecovery', 'Remove-ZertoVPGSettingScripting', 
               'Remove-ZertoVPGSettingVM', 'Remove-ZertoVPGSettingVMNIC', 
               'Remove-ZertoVRA', 'Set-ZertoAuthToken', 'Set-ZertoVPGSetting', 
               'Set-ZertoVPGSettingBackup', 'Set-ZertoVPGSettingBasic', 
               'Set-ZertoVPGSettingBootGroup', 'Set-ZertoVPGSettingJournal', 
               'Set-ZertoVPGSettingNetwork', 'Set-ZertoVPGSettingRecovery', 
               'Set-ZertoVPGSettingScripting', 'Set-ZertoVPGSettingVM', 
               'Start-ZertoVPGClone', 'Start-ZertoVPGFailover', 
               'Start-ZertoVPGFailoverTest', 'Stop-ZertoVPGClone', 
               'Stop-ZertoVPGFailoverTest', 'Submit-ZertoVPGSetting', 
               'Update-ZertoVRA'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = 'ZertoModule.psm1-help.xml'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'PSModule','Zerto'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/ChristopherGLewis/ZertoModule/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/ChristopherGLewis/ZertoModule'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = 'Updated Get-ZertoVPGStatus to return enum values.'

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}


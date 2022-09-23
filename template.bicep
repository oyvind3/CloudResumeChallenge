param profiles_cdncloudresume_name string = 'cdncloudresume'
param storageAccounts_cloudresumeoyvind_name string = 'cloudresumeoyvind'

resource profiles_cdncloudresume_name_resource 'Microsoft.Cdn/profiles@2021-06-01' = {
  name: profiles_cdncloudresume_name
  location: 'Global'
  sku: {
    name: 'Standard_Microsoft'
  }
  kind: 'cdn'
  properties: {
  }
}

resource storageAccounts_cloudresumeoyvind_name_resource 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccounts_cloudresumeoyvind_name
  location: 'westeurope'
  tags: {
    'ms-resource-usage': 'azure-cloud-shell'
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
    customDomain: {
      name: 'www.finsrud.cloud'
    }
  }
}

resource profiles_cdncloudresume_name_finsrudcloud 'Microsoft.Cdn/profiles/endpoints@2021-06-01' = {
  parent: profiles_cdncloudresume_name_resource
  name: 'finsrudcloud'
  location: 'Global'
  properties: {
    originHostHeader: 'cloudresumeoyvind.z6.web.core.windows.net'
    contentTypesToCompress: [
      'application/eot'
      'application/font'
      'application/font-sfnt'
      'application/javascript'
      'application/json'
      'application/opentype'
      'application/otf'
      'application/pkcs7-mime'
      'application/truetype'
      'application/ttf'
      'application/vnd.ms-fontobject'
      'application/xhtml+xml'
      'application/xml'
      'application/xml+rss'
      'application/x-font-opentype'
      'application/x-font-truetype'
      'application/x-font-ttf'
      'application/x-httpd-cgi'
      'application/x-javascript'
      'application/x-mpegurl'
      'application/x-opentype'
      'application/x-otf'
      'application/x-perl'
      'application/x-ttf'
      'font/eot'
      'font/ttf'
      'font/otf'
      'font/opentype'
      'image/svg+xml'
      'text/css'
      'text/csv'
      'text/html'
      'text/javascript'
      'text/js'
      'text/plain'
      'text/richtext'
      'text/tab-separated-values'
      'text/xml'
      'text/x-script'
      'text/x-component'
      'text/x-java-source'
    ]
    isCompressionEnabled: true
    isHttpAllowed: true
    isHttpsAllowed: true
    queryStringCachingBehavior: 'IgnoreQueryString'
    origins: [
      {
        name: 'cloudresumeoyvind-z6-web-core-windows-net'
        properties: {
          hostName: 'cloudresumeoyvind.z6.web.core.windows.net'
          httpPort: 80
          httpsPort: 443
          originHostHeader: 'cloudresumeoyvind.z6.web.core.windows.net'
          priority: 1
          weight: 1000
          enabled: true
        }
      }
    ]
    originGroups: []
    geoFilters: []
    deliveryPolicy: {
      rules: [
        {
          name: 'EnforceHTTPS'
          order: 1
          conditions: [
            {
              name: 'RequestScheme'
              parameters: {
                typeName: 'DeliveryRuleRequestSchemeConditionParameters'
                matchValues: [
                  'HTTP'
                ]
                operator: 'Equal'
                negateCondition: false
                transforms: []
              }
            }
          ]
          actions: [
            {
              name: 'UrlRedirect'
              parameters: {
                typeName: 'DeliveryRuleUrlRedirectActionParameters'
                redirectType: 'Found'
                destinationProtocol: 'Https'
              }
            }
            {
              name: 'CacheExpiration'
              parameters: {
                typeName: 'DeliveryRuleCacheExpirationActionParameters'
                cacheBehavior: 'BypassCache'
                cacheType: 'All'
              }
            }
          ]
        }
      ]
    }
  }
}

resource storageAccounts_cloudresumeoyvind_name_default 'Microsoft.Storage/storageAccounts/blobServices@2022-05-01' = {
  parent: storageAccounts_cloudresumeoyvind_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    changeFeed: {
      enabled: false
    }
    restorePolicy: {
      enabled: false
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
    isVersioningEnabled: false
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_cloudresumeoyvind_name_default 'Microsoft.Storage/storageAccounts/fileServices@2022-05-01' = {
  parent: storageAccounts_cloudresumeoyvind_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {
      }
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_cloudresumeoyvind_name_default 'Microsoft.Storage/storageAccounts/queueServices@2022-05-01' = {
  parent: storageAccounts_cloudresumeoyvind_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_cloudresumeoyvind_name_default 'Microsoft.Storage/storageAccounts/tableServices@2022-05-01' = {
  parent: storageAccounts_cloudresumeoyvind_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource profiles_cdncloudresume_name_finsrudcloud_resume_finsrud_cloud 'Microsoft.Cdn/profiles/endpoints/customdomains@2021-06-01' = {
  parent: profiles_cdncloudresume_name_finsrudcloud
  name: 'resume-finsrud-cloud'
  properties: {
    hostName: 'resume.finsrud.cloud'
  }
  dependsOn: [

    profiles_cdncloudresume_name_resource
  ]
}

resource profiles_cdncloudresume_name_finsrudcloud_cloudresumeoyvind_z6_web_core_windows_net 'Microsoft.Cdn/profiles/endpoints/origins@2021-06-01' = {
  parent: profiles_cdncloudresume_name_finsrudcloud
  name: 'cloudresumeoyvind-z6-web-core-windows-net'
  properties: {
    hostName: 'cloudresumeoyvind.z6.web.core.windows.net'
    httpPort: 80
    httpsPort: 443
    originHostHeader: 'cloudresumeoyvind.z6.web.core.windows.net'
    priority: 1
    weight: 1000
    enabled: true
  }
  dependsOn: [

    profiles_cdncloudresume_name_resource
  ]
}

resource storageAccounts_cloudresumeoyvind_name_default_web 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = {
  parent: storageAccounts_cloudresumeoyvind_name_default
  name: '$web'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [

    storageAccounts_cloudresumeoyvind_name_resource
  ]
}

resource storageAccounts_cloudresumeoyvind_name_default_test 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = {
  parent: storageAccounts_cloudresumeoyvind_name_default
  name: 'test'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [

    storageAccounts_cloudresumeoyvind_name_resource
  ]
}

resource storageAccounts_cloudresumeoyvind_name_default_cli 'Microsoft.Storage/storageAccounts/fileServices/shares@2022-05-01' = {
  parent: Microsoft_Storage_storageAccounts_fileServices_storageAccounts_cloudresumeoyvind_name_default
  name: 'cli'
  properties: {
    accessTier: 'TransactionOptimized'
    shareQuota: 6
    enabledProtocols: 'SMB'
  }
  dependsOn: [

    storageAccounts_cloudresumeoyvind_name_resource
  ]
}

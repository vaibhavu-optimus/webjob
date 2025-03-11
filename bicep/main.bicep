param appServiceName string
param webJobName string
param webJobType string = 'continuous'

resource appService 'Microsoft.Web/sites@2021-02-01' existing = {
  name: appServiceName
}

resource webJob 'Microsoft.Web/sites/webjobs@2021-02-01' = {
  name: '${appServiceName}/${webJobName}'
  properties: {
    name: webJobName
    type: webJobType
    scriptFile: ' '
  }
}

output appServiceUrl string = appService.properties.defaultHostName
output webJobNameOutput string = webJob.name

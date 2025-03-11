param appServicePlanId string
param appServiceName string
param webJobName string
param webJobType string = 'continuous'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' existing = {
  id: appServicePlanId
}

resource appService 'Microsoft.Web/sites@2021-02-01' existing = {
  name: appServiceName
}

resource webJob 'Microsoft.Web/sites/slots/webjobs@2021-02-01' = {
  name: '${appServiceName}/default/${webJobName}'
  properties: {
    name: webJobName
    type: webJobType
    scriptFile: 'dummy-script.sh'
  }
}

output appServiceUrl string = appService.properties.defaultHostName
output webJobNameOutput string = webJob.name

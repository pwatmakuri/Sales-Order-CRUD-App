@AbapCatalog.sqlViewName: 'ZSO_STATUS_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order status view'
define view ZSTATUS_VIEW
  as select from zvbak_status as SOStatus
  association to parent ZHEADER_VIEW_SO as _SOHeader on(
    $projection.vbeln = _SOHeader.vbeln
  )
{

       @UI.facet: [{type: #COLLECTION, position: 10, id: 'SoStatus', label: 'Status'},
       {type: #FIELDGROUP_REFERENCE, position: 10, targetQualifier: 'SoStatus1',parentId: 'SoStatus', isSummary: true, isPartOfPreview: true}
       ]

       @UI: { lineItem: [ { position: 10, label: 'Document No', importance: #HIGH } ], fieldGroup: [{qualifier: 'SoStatus1',position: 20,importance: #HIGH }]}
       @EndUserText.label: 'Document No'
  key  SOStatus.vbeln,

       @UI: { lineItem: [ { position: 20, label: 'Goods Movement', importance: #HIGH } ], fieldGroup: [{qualifier: 'SoStatus1',position: 20,importance: #HIGH }]}

       @Consumption.valueHelpDefinition: [{  entity: {   name: 'zvaluehelp_view' ,
                                                         element: 'status'  }     }]
       @EndUserText.label: 'Overall rejection status'
       SOStatus.abstk,

       @UI: { lineItem: [ { position: 30 , label: 'Delivery Status', importance: #HIGH } ], fieldGroup: [{qualifier: 'SoStatus1',position: 20,importance: #HIGH }]}

       @Consumption.valueHelpDefinition: [{  entity: {   name: 'zvaluehelp_view' ,
                                                         element: 'status'  }     }]

       @EndUserText.label: 'Confirmation Status'
       SOStatus.bestk,

       @UI: { lineItem: [ { position: 40 , label: 'Delivery Block Status', importance: #HIGH } ], fieldGroup: [{qualifier: 'SoStatus1',position: 10,importance: #HIGH }]}

       @Consumption.valueHelpDefinition: [{  entity: {   name: 'zvaluehelp_view' ,
                                                         element: 'status'  }     }]

       @EndUserText.label: 'Overall status of credit check'
       SOStatus.cmgst,

       _SOHeader

}

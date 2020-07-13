@AbapCatalog.sqlViewName: 'ZVIEW_SO_ITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Item View'
define view ZITEM_VIEW_SO
  as select from zst_vbap as SOItem
  association to parent ZHEADER_VIEW_SO as _SOHeader on(
    $projection.vbeln = _SOHeader.vbeln
  )
{
       @UI.facet: [

       {type: #COLLECTION, position: 10, id: 'SoItem', label: 'Sales Document Item'},

       {type: #FIELDGROUP_REFERENCE, position: 10, targetQualifier: 'SoItem1',parentId: 'SoItem', isSummary: true, isPartOfPreview: true},

       {type: #FIELDGROUP_REFERENCE, position: 20, targetQualifier: 'SoItem2',parentId: 'SoItem', isSummary: true, isPartOfPreview: true}

       ]

       @UI: {

       lineItem: [ { position: 10, importance: #HIGH } ],

       fieldGroup: [{qualifier: 'SoItem1',position: 10,importance: #HIGH }]

       }
       @EndUserText.label: 'Sales Document'
  key  SOItem.vbeln,

       @UI: {

       lineItem: [ { position: 20, importance: #HIGH } ],

       fieldGroup: [{qualifier: 'SoItem1',position: 20,importance: #HIGH }]

       }
       @EndUserText.label: 'Item'
  key  SOItem.posnr,

       @UI: {

       lineItem: [ { position: 30, importance: #HIGH } ],

       fieldGroup: [{qualifier: 'SoItem2',position: 10,importance: #HIGH }]

       }
       @EndUserText.label: 'Material'
       SOItem.matnr,

       @UI: {

       lineItem: [ { position: 40, importance: #HIGH } ],

       fieldGroup: [{qualifier: 'SoItem2',position: 20,importance: #HIGH }]

       }
       @EndUserText.label: 'Quantity'
       SOItem.zmeng,

       @UI: {
       lineItem: [ { position: 50, importance: #HIGH } ],

       fieldGroup: [{qualifier: 'SoItem2',position: 20,importance: #HIGH }]

       }
       @EndUserText.label: 'Base Unit of Mesure'
       SOItem.meins,

       /*Association*/

       _SOHeader

}

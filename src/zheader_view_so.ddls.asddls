@AbapCatalog.sqlViewName: 'ZHEADER_SO_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Header View'

@UI : {
          headerInfo : {
                         typeName: 'Sales Document',
                         typeNamePlural: 'Sales Documents',
                         title : { type: #STANDARD, value: 'vbeln'}
                       }
      }

//@ObjectModel.representativeKey: 'vbeln'

define root view ZHEADER_VIEW_SO
  as select from zst_vbak as SOHeader
  composition [0..*] of ZITEM_VIEW_SO as _SOItem
  composition [0..*] of ZSTATUS_VIEW  as _SOStatus
{

        @UI.facet: [

        {
        id: 'GeneralData',
        type: #COLLECTION,
        position: 10,
        label: 'Sales Document Header'
        },

        {
        type: #FIELDGROUP_REFERENCE,
        position: 10,
        targetQualifier: 'GeneralData1',
        parentId: 'GeneralData',
        isSummary: true,
        isPartOfPreview: true
        },

        {

        type: #FIELDGROUP_REFERENCE,
        position: 20,
        targetQualifier: 'GeneralData2',
        parentId: 'GeneralData',
        isSummary: true,
        isPartOfPreview: true
        },

        {

        id: 'SOItem',
        purpose: #STANDARD,
        type: #LINEITEM_REFERENCE,
        label: 'Sales Document Item',
        position: 10,
        targetElement: '_SOItem'
        },

        { id: 'SOStatus', purpose: #STANDARD, type: #LINEITEM_REFERENCE, label: 'Sales Document Status', position: 10, targetElement: '_SOStatus' }

        ]

        @UI: {
        lineItem: [ { position: 10, importance: #HIGH } ],
        selectionField: [{position: 10 }],
        fieldGroup: [{qualifier: 'GeneralData1' ,position: 10,importance: #HIGH }]
        }
        @EndUserText.label: 'Sales Document'
  key   SOHeader.vbeln,

        @UI: {

        lineItem: [ { position: 20, importance: #HIGH } ],

        selectionField: [{position: 20 }],

        fieldGroup: [{qualifier: 'GeneralData2', position: 10,importance: #HIGH }]

        }
        @EndUserText.label: 'Created Date'
        SOHeader.erdat,

        @UI: {

        lineItem: [ { position: 40, importance: #HIGH } ],

        fieldGroup: [{qualifier: 'GeneralData1', position: 20,importance: #HIGH }]

        }
        @EndUserText.label: 'Sales Organization'
        SOHeader.vkorg,

        @UI: {

        lineItem: [ { position: 50, importance: #HIGH } ],

        fieldGroup: [{qualifier: 'GeneralData1', position: 30,importance: #HIGH }]

        }
        @EndUserText.label: 'Distribution Chanal'
        SOHeader.vtweg,

        @UI: {

        lineItem: [ { position: 60, importance: #HIGH } ],

        fieldGroup: [{qualifier: 'GeneralData1', position: 40,importance: #HIGH }]

        }
        @EndUserText.label: 'Divsion'
        SOHeader.spart,

        //For action Set Favourite in UI

        //@UI.lineItem: [{ type: #FOR_ACTION,dataAction: 'set_favourite', label: 'Set Favourite' },

        //{position: 15, importance: #HIGH}]

        //@EndUserText.label: 'Favourite'

        //SOHeader.favourite,

        //SOHeader.lastchangedby,

        //SOHeader.lastchangedat,

        /*Association*/

        _SOItem,
        _SOStatus


}

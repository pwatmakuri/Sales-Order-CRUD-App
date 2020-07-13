@AbapCatalog.sqlViewName: 'ZVALHELP_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'F4 help on vbap elements'
define view zvaluehelp_view as select from zpwstatus {
   
key zpwstatus.status ,
zpwstatus.description

 

}

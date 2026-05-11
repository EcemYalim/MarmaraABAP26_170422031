@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZTCN_170422031_D'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TCN_170422031_D
  as select from ZTCN_170422031_D
{
  key uuid as UUID,
  carrid as Carrid,
  connid as Connid,
  airportfrom as Airportfrom,
  cityfrom as Cityfrom,
  countryfrom as Countryfrom,
  airportto as Airportto,
  cityto as Cityto,
  countryto as Countryto,
  @Semantics.user.createdBy: true
  localcreatedby as Localcreatedby,
  @Semantics.systemDateTime.createdAt: true
  localcreatedat as Localcreatedat,
  @Semantics.user.localInstanceLastChangedBy: true
  locallastchangedby as Locallastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchangedat as Locallastchangedat,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchangedat as Lastchangedat,
  draftentitycreationdatetime as Draftentitycreationdatetime,
  draftentitylastchangedatetime as Draftentitylastchangedatetime,
  draftadministrativedatauuid as Draftadministrativedatauuid,
  draftentityoperationcode as Draftentityoperationcode,
  hasactiveentity as Hasactiveentity,
  draftfieldchanges as Draftfieldchanges
}

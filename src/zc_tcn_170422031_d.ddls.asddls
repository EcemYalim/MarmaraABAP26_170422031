@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZTCN_170422031_D'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TCN_170422031_D
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TCN_170422031_D
  association [1..1] to ZR_TCN_170422031_D as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  Carrid,
  Connid,
  Airportfrom,
  Cityfrom,
  Countryfrom,
  Airportto,
  Cityto,
  Countryto,
  @Semantics: {
    User.Createdby: true
  }
  Localcreatedby,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  Localcreatedat,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  Locallastchangedby,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  Locallastchangedat,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  Lastchangedat,
  Draftentitycreationdatetime,
  Draftentitylastchangedatetime,
  Draftadministrativedatauuid,
  Draftentityoperationcode,
  Hasactiveentity,
  Draftfieldchanges,
  _BaseEntity
}

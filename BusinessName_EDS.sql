Delete FROM dbo.DATASOURCEXSLT WHERE OwnerID = 985 AND sourceid IN (302)
Delete FROM dbo.MashupQueryParameter WHERE OwnerID = 985 AND DataSourceId IN (302)
Delete FROM dbo.MashupParamMapping WHERE OwnerID = 985 AND DataSourceId IN (302)
Delete FROM dbo.MashupDataSourceField WHERE OwnerID = 985 AND (ParentGroupID IN (SELECT GroupID FROM dbo.MashupDataSourceField where OwnerID = 985 AND GroupID > 0 and Type = 'Collection' and DataSourceId IN (302)) OR FieldId IN (SELECT GroupID FROM dbo.MashupDataSourceField where OwnerID = 985 AND GroupID > 0 and Type = 'Collection' and DataSourceId IN (302)))
Delete FROM dbo.MashupDataSourceField WHERE OwnerID = 985 AND DataSourceId IN (302)
Delete FROM dbo.MashupDataSource WHERE OwnerID = 985 AND DATASOURCEID IN (302)

INSERT INTO [dbo].[MashupDataSource] (OwnerId,DataSourceId,ConnectionId,Name,SourceType,Source,ReturnType,ReturnMode,DataXPath,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,ErrorCodePath,ErrorStringPath,PrimaryField,IsUTCDatetime,ErrorCodeFieldId,ErrorMsgFieldId,TransactionField,SuccessCode,IndexParameter,BatchSize,TotalCountXPath,BatchParameter,UserIdParameter,CurrentTimeField,InputDateTimeFormat,EnableLogging,RetentionPeriod,InitialSymbols,RenameSymbols,XSLT,Description,XSLTReferenceField,RestInvokeMethod,UseEncryption,EncryptionKey,RestInputMode,ImageHeight,ImageWidth,ImageFormat,XSLTTag,CheckForError,CurrentRecordCountPath,ReplyQueue,WaitInterval,InputXSLT,RemoteQueueManagerName,StringMode,LoginIDField,BranchCodeParameter,BranchIDParameter,BranchNameParameter,IPAddressField,EmployeeCodeField,Password,IsSecurityEnabled,ServiceTypeID,IgnoreHtmlEncode,FaultCodeXPath,FaultMessageXpath,FaultXslt,ENCODING,SkipNodeException,PrevPageTokenXPath,NextPageTokenXPath,AdditionalSettings,OutputLogXSLT,UsedBy,KafkaSourceType,ExceptionMessage,AdapterId,UniqueEdsName,IsAuditEnable,IsMetricsEnable) VALUES(985,302,2,N'MPI: Generate CSV for BusinessName BAP ',0,N'File/CSV',13,1,N'root',N'Mr. Aliasger baji','2024-05-20 05:41:28',N'Mr. Aliasger baji','2024-05-20 05:41:56',N'',N'',N'-1',0,-1,-1,Null,N'',Null,0,N'',Null,Null,Null,Null,1,5,Null,Null,N'',N'MPI: Generate CSV for BusinessName BAP',N'None',2,0,Null,4,0,0,Null,N'root',0,N'',Null,0,N'',Null,0,Null,Null,Null,Null,Null,Null,N'',Null,Null,0,Null,Null,Null,Null,Null,Null,Null,N'{"loginputafterxslt":false}',Null,0,0,N'',Null,Null,0,0)
INSERT INTO [dbo].[MashupDataSourceField] (OwnerId,FieldId,DataSourceId,Name,Label,Type,IsSearchable,IsFilterable,IsDisplay,XPath,AddedBy,AddedOn,format,MaskStartPos,MaskTotalChar,MaskChar,ApplyMaskOnNewEdit,ContentNameField,ContentTypeField,IsCastRequired,OutParameterIndex,MaskFormatId,EDSResolverId,GroupID,GroupName,ParentGroupID,MaxLength,AdditionalSettings) VALUES(985,6142,302,N'ResponseCode',N'ResponseCode',N'String',0,0,0,N'ResponseCode',N'Mr. Aliasger baji','2024-05-20 05:41:56',N'',-1,-1,N'*',0,N'',N'',Null,Null,-1,-1,0,N'',0,-1,N'{"MongoOutputFieldMode":3}')
INSERT INTO [dbo].[MashupDataSourceField] (OwnerId,FieldId,DataSourceId,Name,Label,Type,IsSearchable,IsFilterable,IsDisplay,XPath,AddedBy,AddedOn,format,MaskStartPos,MaskTotalChar,MaskChar,ApplyMaskOnNewEdit,ContentNameField,ContentTypeField,IsCastRequired,OutParameterIndex,MaskFormatId,EDSResolverId,GroupID,GroupName,ParentGroupID,MaxLength,AdditionalSettings) VALUES(985,6143,302,N'ResponseStatus',N'ResponseStatus',N'String',0,0,0,N'ResponseStatus',N'Mr. Aliasger baji','2024-05-20 05:41:56',N'',-1,-1,N'*',0,N'',N'',Null,Null,-1,-1,0,N'',0,-1,N'{"MongoOutputFieldMode":3}')
Set identity_insert dbo.MashupParamMapping On 
INSERT INTO [dbo].[MashupParamMapping] (OwnerID,MappingID,DataSourceId,MappingXml,CreatedBy,CreatedOn) VALUES(985,3753,302,N'<mappings><mapping parametername=''currentdatetime'' mappedcolumn=''InputParam1'' /></mappings>',1,'2024-05-20 05:41:56')
 Set identity_insert dbo.MashupParamMapping OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,302,N'Request',N'String',0,N'Mr. Aliasger baji','2024-05-20 05:41:56',N'{

  "fileLength": 90,

  "filePath": "/mnt/maybank_bapclient/outbox",

  "fileName": "BAP_REQUEST_##currentdatetime##.CSV",

  "isLinux": true,

  "headerValue": "BEGIN",
"Header1Value": "",
"Header2Value": "",

  "footerValue": "END",

  "spourceScript": "MPI_BAP_NIFS_GENERATE_FILE"

}',6299,N'Request',N'<templateproperties><fields><field name="currentdatetime" type="Date" regx="" errormessage="" label="" inputmode="0" ismandatory="false" isconvertbase64="false" contentname="" contenttype="" useEncryption="false" disableFieldLogging="false" dateRangeInDays ="0" toFieldName  ="" filterDisplayMode  ="0" arraytemplateid="0" arraytemplatename="" resolverID  ="" resolverName  ="" maskFormatID="" maskFormatName="" fieldValidation=''''/></fields></templateproperties>',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF


Update MashupIdList Set LastId = t.MaxId from  (select OwnerID, max ( datasourceid ) as MaxId from dbo.MashupDataSource Group by OwnerID) as t Where  MashupIdList.ItemId = 2   and t.OwnerID =MashupIdList.OwnerID    
Update MashupIdList Set LastId = t.MaxId from  (select OwnerID, max ( FieldId ) as MaxId from dbo.MashupDataSourceField Group by OwnerID) as t Where  MashupIdList.ItemId =3   and t.OwnerID =MashupIdList.OwnerID;

Update DataSourceXslt SET LastModifiedBy = 1 Where OwnerID = 985 ;
Update MashupDataSource SET CreatedBy = 1,LastModifiedBy = 1 Where OwnerID = 985 ;
Update MashupParamMapping SET CreatedBy = 1 Where OwnerID = 985 ;

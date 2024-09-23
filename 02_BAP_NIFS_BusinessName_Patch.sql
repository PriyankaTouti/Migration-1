CREATE  TABLE [dbo].[MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA](
	[APPLICATIONID] [nvarchar](256) NULL,
	[RECORDID] [int] NOT NULL,
	[BUSINESSNAME] [nvarchar](64) NULL,
	[ADDRESS] [nvarchar](256) NULL,
	[SECNO] [nvarchar](64) NULL,
	[TANNUMBER] [nvarchar](64) NULL,
	[BANKCODE] [nvarchar](32) NOT NULL,
	[INSERTEDON] [datetime] NULL,
	[BATCHNUMBER] [int] NOT NULL,
	[TO_SEND] [int] NULL,
	[IS_NO_MATCH] [int] NULL,
	[IS_SENT] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA] ADD  DEFAULT ('MPI') FOR [BANKCODE]
GO

ALTER TABLE [dbo].[MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA] ADD  DEFAULT ((0)) FOR [IS_NO_MATCH]
GO

ALTER TABLE [dbo].[MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA] ADD  DEFAULT ((0)) FOR [IS_SENT]
GO


ALTER TABLE MPI_BAP_NIFS_CHECK_LT ADD REC_TYPE_IND nvarchar(5);

ALTER TABLE MPI_BAP_NIFS_RESPONSE_FILE_DATA ADD REC_TYPE_IND nvarchar(5);




---------------------------------------------------------------------

SELECT * INTO CIS_Schedule_BKP23092024 FROM CIS_Schedule where OwnerID = 985 AND ScheduleID IN (Select ScheduleID From CIS_ScheduledJob where OwnerID = 985 AND JobID IN (89))
SELECT * INTO CIS_ScheduledJob_BKP23092024 From CIS_ScheduledJob where OwnerID = 985 AND JobID IN (89)
SELECT * INTO CIS_TaskExecutable_BKP23092024 FROM CIS_TaskExecutable WHERE OwnerID = 985 AND TaskID IN (SELECT TaskID FROM CIS_Task WHERE OwnerID = 985 AND JobID IN (89) )
SELECT * INTO CIS_Mapping_Block_BKP23092024 FROM CIS_Mapping_Block WHERE OwnerID = 985 AND TaskID IN (SELECT TaskID FROM CIS_Task WHERE OwnerID = 985 AND JobID IN (89) )
SELECT * INTO CIS_Task_BKP23092024 FROM CIS_Task WHERE OwnerID = 985 AND JobID IN (89)
SELECT * INTO CIS_Pass_BKP23092024 FROM CIS_Pass WHERE OwnerID = 985 AND JobID IN (89)
SELECT * INTO CIS_Job_BKP23092024 FROM CIS_Job WHERE OwnerID = 985 AND JobID IN (89)


Delete From CIS_Schedule where OwnerID = 985 AND ScheduleID IN (Select ScheduleID From CIS_ScheduledJob where OwnerID = 985 AND JobID IN (89))
Delete From CIS_ScheduledJob where OwnerID = 985 AND JobID IN (89)
Delete FROM CIS_TaskExecutable WHERE OwnerID = 985 AND TaskID IN (SELECT TaskID FROM CIS_Task WHERE OwnerID = 985 AND JobID IN (89) )
Delete FROM CIS_Mapping_Block WHERE OwnerID = 985 AND TaskID IN (SELECT TaskID FROM CIS_Task WHERE OwnerID = 985 AND JobID IN (89) )
Delete FROM CIS_Task WHERE OwnerID = 985 AND JobID IN (89)
Delete FROM CIS_Pass WHERE OwnerID = 985 AND JobID IN (89)
Delete FROM CIS_Job WHERE OwnerID = 985 AND JobID IN (89)


INSERT INTO CIS_Job (OwnerID,JobID,JobName,CurrentStatus,IsEnabled,LastRunOn,NextRunOn,ScheduleID,MonitoringLevel,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LogSummary,LogType,LogFilePath,Email,Description,ExecutionMode,CheckDataAvailability,ExecuteNow,ExecutionResult,JobType,QueuePath,UniqueID,IsSysJob,UseForReportScheduler,ServerIP,LastExecutedBy,CurrentExecutedBy,LastStoppedBy,RecoverInterval,LastModifiedByType,Destination,NotifyOnFailure,MobileNumber,SmsText,LastSuccessOn,LastFailureOn,DesignerXml,AdditionalSettings,RunOn)VALUES(985,89,'MPI – BAP NIFS DATA PROCESSING',1,1,'Sep  5 2024  5:42:07:740AM','Jan 10 2024 11:31:51:000AM',0,1,1,'Jan 10 2024  6:01:51:000AM',4603,'Aug 19 2024  4:18:34:903AM',1,NULL,NULL,'','',3,0,0,2,1,'','F6A3E842-62CB-4138-AFCC-92805DD77221',0,0,'',-1,-1,-1,0,0,'',0,'','','Aug 26 2024  8:51:11:890AM','Sep  5 2024  5:42:07:740AM','<?xml version="1.0" encoding="utf-8"?><Designer ItemType="ProcessDesigner" Name="Diagram 1" xmlns:p="http://www.businessnext.com/2009/designer/property.xsd" xmlns="http://www.businessnext.com/2009/designer.xsd"><Views><View ItemType="View" Name="View"><Layers><Layer Name="Layer"><Nodes><Node Id="processDesigner" ItemType="processDesignerRoot" Name="processDesignerRoot"><Nodes><Node Id="A_40b6308c-4b17-e240-8f2f-88e44250767b" ItemType="pool" Name="Job"><Nodes><Node Id="A_14186621-df1b-22b4-5069-a0769d21dd3e" ItemType="swimlanes" Name="Swimlanes"><Nodes><Node Id="A_324da7dd-f3c3-a0b0-f6a7-f314eb591f7f" ItemType="swimlane" Name="Pass"><Nodes><Node Id="A_69becbc6-3d81-4db2-df98-f64193f81da1" ItemType="workflowitems" Name="WorkflowItems"><Nodes><Node Id="A_535eaee3-4e79-fe1b-a730-3c88606fda59" ItemType="startEvent" Name="Start"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#2CD500</p:Color><p:Color Name="StrokeColor" Type="Color">#2CD500</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="35px" Width="35px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="50" Top="50"></p:Position></Properties></Node><Node Id="A_854e838b-bb89-74da-ed69-0a04d60ba316" ItemType="4" Name="execute"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#FFFFFF</p:Color><p:Color Name="StrokeColor" Type="Color">#AFAEAC</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="50px" Width="100px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="144" Top="42"></p:Position><p:String Name="Name" Type="String">Task 1: Identify the new Records</p:String><p:String Name="Label" Type="String">execute</p:String><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<task taskId="271" itemId="A_854e838b-bb89-74da-ed69-0a04d60ba316"><base><name>Task 1: Identify the new Records</name><description>Identify the new Records for BAP requests (Individual)</description><executionMode>3</executionMode><actionType>4</actionType><failureAction>1</failureAction><notification notifyOnFailure="false"><email></email><subject></subject><body></body></notification></base><sourceParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><sourceMethodology outputParameters="false">1</sourceMethodology><name>MPI_BAP_NIFS_IDENTITY_RECORDS</name><threadCount></threadCount><batchSize></batchSize><batchSizeParamName></batchSizeParamName><batchIndexParamName></batchIndexParamName></sourceParameters><inputParam></inputParam><targetParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><targetMethodology asyncCall="false">0</targetMethodology><name></name><nameHidden></nameHidden></targetParameters><tgtInputParams></tgtInputParams></task>]]></p:Xml></Properties></Node><Node Id="A_2b6ba9a3-f063-1a3a-d8c0-eef33ecd48da" ItemType="30" Name="externalDataServices"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#FFFFFF</p:Color><p:Color Name="StrokeColor" Type="Color">#AFAEAC</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="50px" Width="100px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="258" Top="42"></p:Position><p:String Name="Name" Type="String">Generate CSV for Input Request - IND</p:String><p:String Name="Label" Type="String">external data services</p:String><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<task taskId="325" itemId="A_2b6ba9a3-f063-1a3a-d8c0-eef33ecd48da"><base><name>Generate CSV for Input Request - IND</name><description>Generate CSV File by Calling API</description><executionMode>3</executionMode><actionType>30</actionType><failureAction>1</failureAction><object>0</object><notification notifyOnFailure="false"><email></email><subject></subject><body></body></notification></base><EDSParameters><sourceParameters><databaseProvider externalDataBase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><sourceMethodology>1</sourceMethodology><name>MPI_BAP_CREATE_FILE</name></sourceParameters><targetParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><targetMethodology asyncCall="false">0</targetMethodology><name>MPI_BAP_CSV_API_RESPONSE_LT</name><nameHidden></nameHidden></targetParameters><keyInformation><dataSource>151</dataSource></keyInformation><parameters><inputparameters><parameters><parameter name="DummyField" paramtype="String" value="!!date1!!" displayvalue="!!date1!!" valuetype="1" trackchange="0"></parameter></parameters></inputparameters><outputparameters></outputparameters><outputwebparameters><outputParameter name="ResponseCode" type="System.String" value="F819" _value="ResponseCode" displayvalue="" trackchange="0" fieldop="System.String" /><outputParameter name="ResponseStatus" type="System.String" value="F820" _value="ResponseStatus" displayvalue="" trackchange="0" fieldop="System.String" /></outputwebparameters><MaxApiThreads></MaxApiThreads><resumeFlow>false</resumeFlow><fireAndForget>false</fireAndForget><edsActionType>2</edsActionType></parameters></EDSParameters></task>]]></p:Xml></Properties></Node><Node Id="A_26c52888-84ca-4678-1a3a-8b06fc7bf95b" ItemType="30" Name="externalDataServices"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#FFFFFF</p:Color><p:Color Name="StrokeColor" Type="Color">#AFAEAC</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="50px" Width="100px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="380" Top="43"></p:Position><p:String Name="Name" Type="String">Generate CSV for Input Request - NND</p:String><p:String Name="Label" Type="String">external data services</p:String><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<task taskId="2363" itemId="A_26c52888-84ca-4678-1a3a-8b06fc7bf95b"><base><name>Generate CSV for Input Request - NND</name><description></description><executionMode>3</executionMode><actionType>30</actionType><failureAction>2</failureAction><object>0</object><notification notifyOnFailure="false"><email></email><subject></subject><body></body></notification></base><EDSParameters><sourceParameters><databaseProvider externalDataBase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><sourceMethodology>1</sourceMethodology><name>MPI_BAP_CREATE_FILE</name></sourceParameters><targetParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><targetMethodology asyncCall="false">0</targetMethodology><name>MPI_BAP_CSV_API_RESPONSE_LT</name><nameHidden></nameHidden></targetParameters><keyInformation><dataSource>302</dataSource></keyInformation><parameters><inputparameters><parameters><parameter name="DummyField" paramtype="String" value="!!date1!!" displayvalue="!!date1!!" valuetype="0" trackchange="0"></parameter></parameters></inputparameters><outputparameters></outputparameters><outputwebparameters><outputParameter name="ResponseCode" type="System.String" value="F6142" _value="ResponseCode" displayvalue="" trackchange="0" fieldop="System.String" /><outputParameter name="ResponseStatus" type="System.String" value="F6143" _value="ResponseStatus" displayvalue="" trackchange="0" fieldop="System.String" /></outputwebparameters><MaxApiThreads></MaxApiThreads><resumeFlow>false</resumeFlow><fireAndForget>false</fireAndForget><edsActionType>2</edsActionType></parameters></EDSParameters></task>]]></p:Xml></Properties></Node></Nodes><Properties><p:Size Name="Size" Type="Size" Unit="px" Height="100%" Width="100%"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:Behavior Name="Panel" PanelType="CanvasPanel" Type="Behavior"></p:Behavior></Properties></Node></Nodes><Properties><p:Color Name="Background" Type="Color">#5878ff</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="126px" Width="100%"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Name" Type="String">Pass 1: File Generation and Share with NIFS</p:String><p:Behavior Name="Panel" PanelType="CanvasPanel" Type="Behavior"></p:Behavior><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Int Name="Sequence" Type="Int"></p:Int><p:Xml Name="Expression" Type="Xml"><![CDATA[<pass passId="64"><keyInformation><name>Pass 1: File Generation and Share with NIFS</name><description>Pass 1: File Generation and Share with NIFS</description><executionMode disabled="false">3</executionMode></keyInformation><loggingOption><email logSummary="false" /></loggingOption></pass>]]></p:Xml></Properties></Node><Node Id="A_985e2d4d-c02c-7029-2eb2-c9e42af9a629" ItemType="swimlane" Name="Pass"><Nodes><Node Id="A_4530e719-438d-eaa7-eaef-baae5e4390c8" ItemType="workflowitems" Name="WorkflowItems"><Nodes><Node Id="A_02e743ac-1e7f-af20-e90d-db91677a39bf" ItemType="30" Name="externalDataServices"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#FFFFFF</p:Color><p:Color Name="StrokeColor" Type="Color">#AFAEAC</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="50px" Width="100px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="144" Top="24"></p:Position><p:String Name="Name" Type="String">Call BAP Service and Send CSV File</p:String><p:String Name="Label" Type="String">external data services</p:String><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<task taskId="326" itemId="A_02e743ac-1e7f-af20-e90d-db91677a39bf"><base><name>Call BAP Service and Send CSV File</name><description>Call BAP Service and Send CSV File</description><executionMode>3</executionMode><actionType>30</actionType><failureAction>1</failureAction><object>0</object><notification notifyOnFailure="false"><email></email><subject></subject><body></body></notification></base><EDSParameters><sourceParameters><databaseProvider externalDataBase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><sourceMethodology>2</sourceMethodology><name>SELECT 1 AS OUTPUT</name></sourceParameters><targetParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><targetMethodology asyncCall="false">0</targetMethodology><name>MPI_BAP_RESPONSE_LT</name><nameHidden></nameHidden></targetParameters><keyInformation><dataSource>153</dataSource></keyInformation><parameters><inputparameters><parameters><parameter name="uploadfileFolderPath" paramtype="String" value="/mnt/maybank_bapclient/outbox" displayvalue="/mnt/maybank_bapclient/outbox" valuetype="1" trackchange="0"></parameter><parameter name="downloadFolderPath" paramtype="String" value="/mnt/maybank_bapclient/inbox" displayvalue="/mnt/maybank_bapclient/inbox" valuetype="1" trackchange="0"></parameter></parameters></inputparameters><outputparameters></outputparameters><outputwebparameters><outputParameter name="RESPONSE" type="System.String" value="F825" _value="Result" displayvalue="" trackchange="0" fieldop="System.String" /></outputwebparameters><MaxApiThreads>1</MaxApiThreads><resumeFlow>false</resumeFlow><fireAndForget>false</fireAndForget><edsActionType>2</edsActionType></parameters></EDSParameters></task>]]></p:Xml></Properties></Node><Node Id="A_3285dafd-9017-eee4-44bd-ff065c087ac4" ItemType="4" Name="execute"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#FFFFFF</p:Color><p:Color Name="StrokeColor" Type="Color">#AFAEAC</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="50px" Width="100px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="312" Top="24"></p:Position><p:String Name="Name" Type="String">Check MPI API Response Status</p:String><p:String Name="Label" Type="String">execute</p:String><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<task taskId="331" itemId="A_3285dafd-9017-eee4-44bd-ff065c087ac4"><base><name>Check MPI API Response Status</name><description>Check is MPI API Call is success OR Failure</description><executionMode>3</executionMode><actionType>4</actionType><failureAction>1</failureAction><notification notifyOnFailure="false"><email></email><subject></subject><body></body></notification></base><sourceParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><sourceMethodology outputParameters="false">1</sourceMethodology><name>MPI_BAP_VALIDATE_API_RESPONSE</name><threadCount>1</threadCount><batchSize></batchSize><batchSizeParamName></batchSizeParamName><batchIndexParamName></batchIndexParamName></sourceParameters><inputParam></inputParam><targetParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><targetMethodology asyncCall="false">0</targetMethodology><name></name><nameHidden></nameHidden></targetParameters><tgtInputParams></tgtInputParams></task>]]></p:Xml></Properties></Node><Node Id="A_b6a47c1d-9958-a55a-c417-83e0aed49c4a" ItemType="10" Name="moveFile"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#FFFFFF</p:Color><p:Color Name="StrokeColor" Type="Color">#AFAEAC</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="50px" Width="100px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="494" Top="24"></p:Position><p:String Name="Name" Type="String">Archive Input CSV file</p:String><p:String Name="Label" Type="String">move file</p:String><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<task taskId="329" itemId="A_b6a47c1d-9958-a55a-c417-83e0aed49c4a"><base><name>Archive Input CSV file</name><description>Archive the file, which are already sent to MPI. We are trying to ignore sending duplicate file to MPI.</description><executionMode>3</executionMode><actionType>10</actionType><failureAction>1</failureAction><notification notifyOnFailure="false"><email></email><subject></subject><body></body></notification></base><protocol>none</protocol><serverPath></serverPath><userName></userName><password></password><keyFilePath></keyFilePath><passPhrase></passPhrase><source isDirectory="true">/mnt/maybank_bapclient/outbox</source><searchPattern></searchPattern><sourceFileName deleteAfter="false"></sourceFileName><target isNameSpecified="false">/mnt/maybank_bapclient/archive_outbox</target><fileFilter>0</fileFilter><filter>0</filter><portNumber></portNumber><key></key><keySize></keySize><paddingMode></paddingMode><cipherMode></cipherMode></task>]]></p:Xml></Properties></Node></Nodes><Properties><p:Size Name="Size" Type="Size" Unit="px" Height="100%" Width="100%"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:Behavior Name="Panel" PanelType="CanvasPanel" Type="Behavior"></p:Behavior></Properties></Node></Nodes><Properties><p:Color Name="Background" Type="Color">#F9CFD0</p:Color><p:Color Name="StrokeColor" Type="Color">#EDA22D</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="100px" Width="100%"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="126"></p:Position><p:String Name="Label" Type="String">pass</p:String><p:String Name="Name" Type="String">Pass 2: Get File List Information</p:String><p:Behavior Name="Panel" PanelType="CanvasPanel" Type="Behavior"></p:Behavior><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Int Name="Sequence" Type="Int">1</p:Int><p:Xml Name="Expression" Type="Xml"><![CDATA[<pass passId="72"><keyInformation><name>Pass 2: Get File List Information</name><description></description><executionMode disabled="false">3</executionMode></keyInformation><loggingOption><email logSummary="false"></email></loggingOption></pass>]]></p:Xml></Properties></Node><Node Id="A_70523858-0e94-3bc4-90ee-a8e6992f232f" ItemType="swimlane" Name="Pass"><Nodes><Node Id="A_7e4cd42a-dffc-8ba9-890e-99a8deca013c" ItemType="workflowitems" Name="WorkflowItems"><Nodes><Node Id="A_03b2feac-2ab9-6c1b-6b07-9a3dfd161413" ItemType="10" Name="moveFile"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#FFFFFF</p:Color><p:Color Name="StrokeColor" Type="Color">#AFAEAC</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="50px" Width="100px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="323" Top="23"></p:Position><p:String Name="Name" Type="String">Move response file to archival folder</p:String><p:String Name="Label" Type="String">move file</p:String><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<task taskId="327" itemId="A_03b2feac-2ab9-6c1b-6b07-9a3dfd161413"><base><name>Move response file to archival folder</name><description>Moving the files to archival folder, so the same must not be read again.</description><executionMode>3</executionMode><actionType>10</actionType><failureAction>1</failureAction><notification notifyOnFailure="false"><email></email><subject></subject><body></body></notification></base><protocol>none</protocol><serverPath></serverPath><userName></userName><password></password><keyFilePath></keyFilePath><passPhrase></passPhrase><source isDirectory="true">/mnt/maybank_bapclient/inbox</source><searchPattern></searchPattern><sourceFileName deleteAfter="false">undefined</sourceFileName><target isNameSpecified="false">/mnt/maybank_bapclient/archive</target><fileFilter>0</fileFilter><filter>0</filter><portNumber></portNumber><key></key><keySize></keySize><paddingMode></paddingMode><cipherMode></cipherMode></task>]]></p:Xml></Properties></Node><Node Id="A_909e6877-90a2-43b7-23e1-05b379d76b35" ItemType="4" Name="execute"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#FFFFFF</p:Color><p:Color Name="StrokeColor" Type="Color">#AFAEAC</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="50px" Width="100px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="498" Top="23"></p:Position><p:String Name="Name" Type="String">Task 7: Map the Response File Information to Application</p:String><p:String Name="Label" Type="String">execute</p:String><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<task taskId="300" itemId="A_909e6877-90a2-43b7-23e1-05b379d76b35"><base><name>Task 7: Map the Response File Information to Application</name><description>Task 7: Map the Response File Information to Application</description><executionMode>3</executionMode><actionType>4</actionType><failureAction>1</failureAction><notification notifyOnFailure="false"><email></email><subject></subject><body></body></notification></base><sourceParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><sourceMethodology outputParameters="false">1</sourceMethodology><name>MPI_BAP_NIFS_MAP_APPLICATION</name><threadCount>1</threadCount><batchSize></batchSize><batchSizeParamName></batchSizeParamName><batchIndexParamName></batchIndexParamName></sourceParameters><inputParam></inputParam><targetParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><targetMethodology asyncCall="false">0</targetMethodology><name></name><nameHidden></nameHidden></targetParameters><tgtInputParams></tgtInputParams></task>]]></p:Xml></Properties></Node><Node Id="A_04e3aad4-77ac-2575-ddae-1d269d4767cf" ItemType="8" Name="ReadFromDataSource"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#FFFFFF</p:Color><p:Color Name="StrokeColor" Type="Color">#AFAEAC</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="50px" Width="100px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="140" Top="23"></p:Position><p:String Name="Name" Type="String">Task 6: Read the File Information</p:String><p:String Name="Label" Type="String">read from data source</p:String><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<task taskId="299" itemId="A_04e3aad4-77ac-2575-ddae-1d269d4767cf"><base><name>Task 6: Read the File Information</name><description></description><executionMode>3</executionMode><actionType>8</actionType><failureAction>1</failureAction><object>6</object><notification notifyOnFailure="false"><email></email><subject></subject><body></body></notification></base><sourceParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><sourceMethodology>5</sourceMethodology><fileType>csv</fileType><bulkCopyApi>true</bulkCopyApi><dataSource readFromFolder="true">/mnt/maybank_bapclient/inbox</dataSource><columns></columns><delimiter lockTable="false" hasHeader="true" autoFormat="true">,</delimiter><headerRowsNumber></headerRowsNumber><footerRowsNumber></footerRowsNumber><formatFileBase64Name>bap_read1.fmt</formatFileBase64Name><formatFileBase64>OS4wDQozMw0KMSBTUUxDSEFSIDAgODAwMCAiLCIJMQlSRUNLRVkgIiINCjIgU1FMQ0hBUiAwIDgwMDAgIiwiCTIJU09VUkNFICIiDQozIFNRTENIQVIgMCA4MDAwICIsIgkzCU5BTUUgIiINCjQgU1FMQ0hBUiAwIDgwMDAgIiwiCTQJQklSVEggIiINCjUgU1FMQ0hBUiAwIDgwMDAgIiwiCTUJQUREUkVTUyAiIg0KNiBTUUxDSEFSIDAgODAwMCAiLCIJNglTUE9VU0UgIiINCjcgU1FMQ0hBUiAwIDgwMDAgIiwiCTcJU0VYICIiDQo4IFNRTENIQVIgMCA4MDAwICIsIgk4CVRJTiAiIg0KOSBTUUxDSEFSIDAgODAwMCAiLCIJOQlTU1MgIiINCjEwIFNRTENIQVIgMCA4MDAwICIsIgkxMAlDSVZJTFNUQVQgIiINCjExIFNRTENIQVIgMCA4MDAwICIsIgkxMQlCVVNJTkVTUyAiIg0KMTIgU1FMQ0hBUiAwIDgwMDAgIiwiCTEyCUJVU0FERFJTICIiDQoxMyBTUUxDSEFSIDAgODAwMCAiLCIJMTMJQkRUICIiDQoxNCBTUUxDSEFSIDAgODAwMCAiLCIJMTQJQkRUREFURSAiIg0KMTUgU1FMQ0hBUiAwIDgwMDAgIiwiCTE1CVNFQyAiIg0KMTYgU1FMQ0hBUiAwIDgwMDAgIiwiCTE2CVNFQ0RBVEUgIiINCjE3IFNRTENIQVIgMCA4MDAwICIsIgkxNwlSRVBPUlRFRCAiIg0KMTggU1FMQ0hBUiAwIDgwMDAgIiwiCTE4CUJBTksgIiINCjE5IFNRTENIQVIgMCA4MDAwICIsIgkxOQlCUkFOQ0ggIiINCjIwIFNRTENIQVIgMCA4MDAwICIsIgkyMAlSRU1BUktTICIiDQoyMSBTUUxDSEFSIDAgODAwMCAiLCIJMjEJTkVHREFURSAiIg0KMjIgU1FMQ0hBUiAwIDgwMDAgIiwiCTIyCUNMT1NFREFURSAiIg0KMjMgU1FMQ0hBUiAwIDgwMDAgIiwiCTIzCVRZUEUgIiINCjI0IFNRTENIQVIgMCA4MDAwICIsIgkyNAlKT0lOVCAiIg0KMjUgU1FMQ0hBUiAwIDgwMDAgIiwiCTI1CUxPQU5fU0FMQSAiIg0KMjYgU1FMQ0hBUiAwIDgwMDAgIiwiCTI2CUFNVF9MSU1JVCAiIg0KMjcgU1FMQ0hBUiAwIDgwMDAgIiwiCTI3CVNFQ1VfQ0FTRSAiIg0KMjggU1FMQ0hBUiAwIDgwMDAgIiwiCTI4CUNBUkRCQUwgIiINCjI5IFNRTENIQVIgMCA4MDAwICIsIgkyOQlFWFRfUExBSU5UICIiDQozMCBTUUxDSEFSIDAgODAwMCAiLCIJMzAJQ0FSRF9EQVRFICIiDQozMSBTUUxDSEFSIDAgODAwMCAiLCIJMzEJSU5EMSAiIg0KMzIgU1FMQ0hBUiAwIDgwMDAgIiwiCTMyCUlORDIgIiINCjMzIFNRTENIQVIgMCA4MDAwICIsIgkzMwlJTkNEQVRFICIiDQoNCg==</formatFileBase64><formatFile> /mnt/maybank_bapclient/inboxbap_read1.fmt</formatFile></sourceParameters><inputParameters></inputParameters><targetParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><instanceName></instanceName><userName></userName><oraPass></oraPass><jsonExpression></jsonExpression><dbName></dbName><targetMethodology>2</targetMethodology><name>MPI_BAP_NIFS_RESPONSE_FILE_DATA</name><dataConnectionId></dataConnectionId><datanextSourceColumns><dataSourceMapping><mapping name="" type="" /></dataSourceMapping></datanextSourceColumns></targetParameters></task>]]></p:Xml></Properties></Node></Nodes><Properties><p:Size Name="Size" Type="Size" Unit="px" Height="100%" Width="100%"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:Behavior Name="Panel" PanelType="CanvasPanel" Type="Behavior"></p:Behavior></Properties></Node></Nodes><Properties><p:Color Name="Background" Type="Color">#84AD20</p:Color><p:Color Name="StrokeColor" Type="Color">#8EC4E8</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="100px" Width="100%"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="226"></p:Position><p:String Name="Label" Type="String">pass</p:String><p:String Name="Name" Type="String">Pass 3: Download the File and Process</p:String><p:Behavior Name="Panel" PanelType="CanvasPanel" Type="Behavior"></p:Behavior><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Int Name="Sequence" Type="Int">2</p:Int><p:Xml Name="Expression" Type="Xml"><![CDATA[<pass passId="66"><keyInformation><name>Pass 3: Download the File and Process</name><description></description><executionMode disabled="false">3</executionMode></keyInformation><loggingOption><email logSummary="false"></email></loggingOption></pass>]]></p:Xml></Properties></Node><Node Id="A_64120dd9-b7f7-1bed-7f0b-fdafe25b31c1" ItemType="swimlane" Name="Pass"><Nodes><Node Id="A_1e15e38f-5641-2128-9a67-acb1d20058cb" ItemType="workflowitems" Name="WorkflowItems"><Nodes><Node Id="A_58e7d267-3fcd-5446-e30a-0c194e153f00" ItemType="4" Name="execute"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#FFFFFF</p:Color><p:Color Name="StrokeColor" Type="Color">#AFAEAC</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="50px" Width="100px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="158" Top="17"></p:Position><p:String Name="Name" Type="String">Task 8: Archive BAP NIFS Data in Archival Table</p:String><p:String Name="Label" Type="String">execute</p:String><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<task taskId="301" itemId="A_58e7d267-3fcd-5446-e30a-0c194e153f00"><base><name>Task 8: Archive BAP NIFS Data in Archival Table</name><description>Task 8: Archive BAP NIFS Data in Archival Table</description><executionMode>3</executionMode><actionType>4</actionType><failureAction>1</failureAction><notification notifyOnFailure="false"><email></email><subject></subject><body></body></notification></base><sourceParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><sourceMethodology outputParameters="false">1</sourceMethodology><name>MPI_BAP_NIFS_DATA_ARCHIVE</name><threadCount>1</threadCount><batchSize></batchSize><batchSizeParamName></batchSizeParamName><batchIndexParamName></batchIndexParamName></sourceParameters><inputParam></inputParam><targetParameters><databaseProvider externalDatabase="false">Microsoft.Data.SqlClient</databaseProvider><connectionString></connectionString><password></password><targetMethodology asyncCall="false">0</targetMethodology><name></name><nameHidden></nameHidden></targetParameters><tgtInputParams></tgtInputParams></task>]]></p:Xml></Properties></Node><Node Id="A_5507488a-756d-e51a-bea9-35bc50ef6b8b" ItemType="endEvent" Name="End"><Nodes></Nodes><Properties><p:Color Name="Background" Type="Color">#E30001</p:Color><p:Color Name="StrokeColor" Type="Color">#E30001</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="35px" Width="35px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="363" Top="25"></p:Position><p:String Name="Label" Type="String">end event</p:String></Properties></Node></Nodes><Properties><p:Size Name="Size" Type="Size" Unit="px" Height="100%" Width="100%"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:Behavior Name="Panel" PanelType="CanvasPanel" Type="Behavior"></p:Behavior></Properties></Node></Nodes><Properties><p:Color Name="Background" Type="Color">#F07D80</p:Color><p:Color Name="StrokeColor" Type="Color">#5FB1AD</p:Color><p:Color Name="TextColor" Type="Color">#000000</p:Color><p:Size Name="Size" Type="Size" Unit="px" Height="119px" Width="100%"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="326"></p:Position><p:String Name="Label" Type="String">pass</p:String><p:String Name="Name" Type="String">Pass 4: Data Archival</p:String><p:Behavior Name="Panel" PanelType="CanvasPanel" Type="Behavior"></p:Behavior><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Int Name="Sequence" Type="Int">3</p:Int><p:Xml Name="Expression" Type="Xml"><![CDATA[<pass passId="73"><keyInformation><name>Pass 4: Data Archival</name><description></description><executionMode disabled="false">3</executionMode></keyInformation><loggingOption><email logSummary="false"></email></loggingOption></pass>]]></p:Xml></Properties></Node></Nodes><Properties><p:Size Name="Size" Type="Size" Unit="px" Height="auto" Width="100%"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="30" Top="0"></p:Position><p:Margin Name="Margin" Type="Margin" Left="30" Top="0" Bottom="0" Right="0"></p:Margin><p:Behavior Name="Panel" PanelType="VStack" Type="Behavior"></p:Behavior></Properties></Node></Nodes><Properties><p:Size Name="Size" Type="Size" Unit="px" Height="auto" Width="100%"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Name" Type="String">MPI – BAP NIFS DATA PROCESSING</p:String><p:Behavior Name="Panel" PanelType="CanvasPanel" Type="Behavior"></p:Behavior><p:Boolean Name="Active" Type="Boolean">true</p:Boolean><p:Xml Name="Expression" Type="Xml"><![CDATA[<job jobId="89"><keyInformation><name>MPI – BAP NIFS DATA PROCESSING</name><description></description><executionMode disabled="false">3</executionMode><jobType>1</jobType><webApi></webApi><type></type><serverPath></serverPath><queueName></queueName><schedule scheduleIds="1042">MPI : BAP - SCHEDULER</schedule><serverIp></serverIp></keyInformation><notificationSettings><email notifyOnFail="false"></email><mobileNumbers></mobileNumbers><smsText></smsText></notificationSettings><jobVisibleSettings><jobVisibleTo>0</jobVisibleTo><members membersIds=""></members></jobVisibleSettings></job>]]></p:Xml></Properties><Connectors><Connector Name="Condition" ItemType="transition" Id="A_d76d2106-72d2-7d56-5cc0-b8c698eda6c8"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_854e838b-bb89-74da-ed69-0a04d60ba316"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_535eaee3-4e79-fe1b-a730-3c88606fda59"></Node></StartPoint></Connector><Connector Name="Condition" ItemType="transition" Id="A_47729474-2c5b-fac9-dfea-e43a8467947b"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_58e7d267-3fcd-5446-e30a-0c194e153f00"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_909e6877-90a2-43b7-23e1-05b379d76b35"></Node></StartPoint></Connector><Connector Name="Condition" ItemType="transition" Id="A_ec555cd2-0bb3-f1ca-2c53-8d1052129383"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_03b2feac-2ab9-6c1b-6b07-9a3dfd161413"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_04e3aad4-77ac-2575-ddae-1d269d4767cf"></Node></StartPoint></Connector><Connector Name="Condition" ItemType="transition" Id="A_7f6f8b37-6eb5-ac83-f72e-4f9ea8a766d6"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_3285dafd-9017-eee4-44bd-ff065c087ac4"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_02e743ac-1e7f-af20-e90d-db91677a39bf"></Node></StartPoint></Connector><Connector Name="Condition" ItemType="transition" Id="A_d9f00cd5-318a-32a6-0380-3d22b7c4db4d"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_04e3aad4-77ac-2575-ddae-1d269d4767cf"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_b6a47c1d-9958-a55a-c417-83e0aed49c4a"></Node></StartPoint></Connector><Connector Name="Condition" ItemType="transition" Id="A_ec2a5935-01a6-c014-2aa5-a1817af9f291"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_2b6ba9a3-f063-1a3a-d8c0-eef33ecd48da"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_854e838b-bb89-74da-ed69-0a04d60ba316"></Node></StartPoint></Connector><Connector Name="Condition" ItemType="transition" Id="A_799d9a13-bcef-fba5-4f34-aaaac51a6b55"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_b6a47c1d-9958-a55a-c417-83e0aed49c4a"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_3285dafd-9017-eee4-44bd-ff065c087ac4"></Node></StartPoint></Connector><Connector Name="Condition" ItemType="transition" Id="A_dd11a06e-9a4f-2c63-6275-db6285fdcec9"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_909e6877-90a2-43b7-23e1-05b379d76b35"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_03b2feac-2ab9-6c1b-6b07-9a3dfd161413"></Node></StartPoint></Connector><Connector Name="Condition" ItemType="transition" Id="A_e859dce8-0ed4-f2ca-42b5-13c6910cceef"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_5507488a-756d-e51a-bea9-35bc50ef6b8b"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_58e7d267-3fcd-5446-e30a-0c194e153f00"></Node></StartPoint></Connector><Connector Name="Condition" ItemType="transition" Id="A_34c71100-4476-064d-1ddb-92324bfbbf9e"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_26c52888-84ca-4678-1a3a-8b06fc7bf95b"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_2b6ba9a3-f063-1a3a-d8c0-eef33ecd48da"></Node></StartPoint></Connector><Connector Name="Condition" ItemType="transition" Id="A_f77b3887-9821-83ab-d05a-cd50e067e967"><EndPoints><EndPoint ItemType="flowEnd" LeftOffset="0" TopOffset="50" Radius="0"><Node Ref="A_02e743ac-1e7f-af20-e90d-db91677a39bf"></Node></EndPoint></EndPoints><Properties><p:Color Name="StrokeColor" Type="Color">#888888</p:Color><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position><p:String Name="Label" Type="String">transition</p:String><p:String Name="Name" Type="String">Condition</p:String></Properties><StartPoint ItemType="flowStart" LeftOffset="100" TopOffset="50" Radius="0"><Node Ref="A_26c52888-84ca-4678-1a3a-8b06fc7bf95b"></Node></StartPoint></Connector></Connectors></Node></Nodes><Properties><p:Size Name="Size" Type="Size" Unit="px" Height="100000px" Width="100000px"></p:Size><p:Position Name="Position" Type="Position" Unit="px" Left="0" Top="0"></p:Position></Properties></Node></Nodes></Layer></Layers></View></Views></Designer>','','Sep  5 2024  5:41:59:997AM')
-------------------------------------------------------------------------------

INSERT INTO CIS_PASS (OwnerID,PassID,PassName,JobID,ExecutionOrder,CurrentStatus,MonitoringLevel,IsEnabled,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LogSummary,LogType,LogFilePath,Email,Description,ExecutionMode,UniqueID,LastModifiedByType)VALUES(985,64,'Pass 1: File Generation and Share with NIFS',89,0,1,1,0,1,'Jan 10 2024  6:03:00:000AM',4601,'Jun  5 2024  8:38:41:707AM',0,NULL,NULL,'','Pass 1: File Generation and Share with NIFS',3,'E6525C81-21CC-4A0F-9722-D397A92D6189',0)
INSERT INTO CIS_PASS (OwnerID,PassID,PassName,JobID,ExecutionOrder,CurrentStatus,MonitoringLevel,IsEnabled,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LogSummary,LogType,LogFilePath,Email,Description,ExecutionMode,UniqueID,LastModifiedByType)VALUES(985,66,'Pass 3: Download the File and Process',89,2,1,1,0,1,'Jan 10 2024  6:03:41:000AM',4601,'Jun  5 2024  8:38:41:713AM',0,NULL,NULL,'','',3,'3834B5EE-5973-42D9-B470-3AC359A4D88E',0)
INSERT INTO CIS_PASS (OwnerID,PassID,PassName,JobID,ExecutionOrder,CurrentStatus,MonitoringLevel,IsEnabled,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LogSummary,LogType,LogFilePath,Email,Description,ExecutionMode,UniqueID,LastModifiedByType)VALUES(985,72,'Pass 2: Get File List Information',89,1,1,1,0,1,'Jan 11 2024  9:00:55:000AM',4601,'Jun  5 2024  8:38:41:710AM',0,NULL,NULL,'','',3,'5C244C05-ACA6-4E30-9CF3-B94CC6E725E4',0)
INSERT INTO CIS_PASS (OwnerID,PassID,PassName,JobID,ExecutionOrder,CurrentStatus,MonitoringLevel,IsEnabled,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LogSummary,LogType,LogFilePath,Email,Description,ExecutionMode,UniqueID,LastModifiedByType)VALUES(985,73,'Pass 4: Data Archival',89,3,1,1,0,1,'Jan 11 2024  9:01:41:000AM',4601,'Jun  5 2024  8:38:41:717AM',0,NULL,NULL,'','',3,'30810DA3-5A54-4957-BB42-5A85A6705BFC',0)

----------------------------------------------------------------------------

INSERT INTO CIS_TASK (OwnerID,TaskID,TaskName,PassID,JobID,ObjectID,ExecutionOrder,CurrentStatus,SourceMethodology,ActionType,TargetMethodology,FailureAction,IsExternalDB,ConnectionString,SourceStatement,NeedsResolution,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,Description,TargetStatement,ParentTask,SourceDatabaseProvider,TargetDatabaseProvider,IsExternalTarget,TargetConnectionString,ExecutionMode,ExecuteAllBlocks,QueuePath,UniqueID,LastModifiedByType,EmailId,NotifyOnFailure,EmailSubject,EmailBody,IsSourceCaseSensitive,IsTargetCaseSensitive,IsClientDateTime)VALUES(985,271,'Task 1: Identify the new Records',64,89,0,0,1,1,4,0,1,0,'','MPI_BAP_NIFS_IDENTITY_RECORDS',0,1,'Jan 10 2024  6:07:27:000AM',4601,'Jun  5 2024  8:38:41:723AM','Identify the new Records for BAP requests (Individual)','',0,'Microsoft.Data.SqlClient','Microsoft.Data.SqlClient',0,'',3,0,'','6C13A2E5-07C4-4D0F-A352-B8E5E33B050C',0,'',0,NULL,'',0,0,NULL)
INSERT INTO CIS_TASK (OwnerID,TaskID,TaskName,PassID,JobID,ObjectID,ExecutionOrder,CurrentStatus,SourceMethodology,ActionType,TargetMethodology,FailureAction,IsExternalDB,ConnectionString,SourceStatement,NeedsResolution,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,Description,TargetStatement,ParentTask,SourceDatabaseProvider,TargetDatabaseProvider,IsExternalTarget,TargetConnectionString,ExecutionMode,ExecuteAllBlocks,QueuePath,UniqueID,LastModifiedByType,EmailId,NotifyOnFailure,EmailSubject,EmailBody,IsSourceCaseSensitive,IsTargetCaseSensitive,IsClientDateTime)VALUES(985,299,'Task 6: Read the File Information',66,89,0,6,1,5,8,0,1,0,'','',0,1,'Jan 11 2024  9:05:04:000AM',4601,'Jun  5 2024  8:38:41:777AM','','',0,'Microsoft.Data.SqlClient','Microsoft.Data.SqlClient',0,'',3,0,'','A7E22083-5014-427C-A91C-A9E89CDB5EBF',0,'',0,NULL,'',0,0,NULL)
INSERT INTO CIS_TASK (OwnerID,TaskID,TaskName,PassID,JobID,ObjectID,ExecutionOrder,CurrentStatus,SourceMethodology,ActionType,TargetMethodology,FailureAction,IsExternalDB,ConnectionString,SourceStatement,NeedsResolution,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,Description,TargetStatement,ParentTask,SourceDatabaseProvider,TargetDatabaseProvider,IsExternalTarget,TargetConnectionString,ExecutionMode,ExecuteAllBlocks,QueuePath,UniqueID,LastModifiedByType,EmailId,NotifyOnFailure,EmailSubject,EmailBody,IsSourceCaseSensitive,IsTargetCaseSensitive,IsClientDateTime)VALUES(985,300,'Task 7: Map the Response File Information to Application',66,89,0,8,1,1,4,0,1,0,'','MPI_BAP_NIFS_MAP_APPLICATION',0,1,'Jan 11 2024  9:05:04:000AM',4601,'Jun  5 2024  8:38:41:797AM','Task 7: Map the Response File Information to Application','',0,'Microsoft.Data.SqlClient','Microsoft.Data.SqlClient',0,'',3,0,'','156957DF-249D-4A7F-AAF0-EBF1A6A6F678',0,'',0,NULL,'',0,0,NULL)
INSERT INTO CIS_TASK (OwnerID,TaskID,TaskName,PassID,JobID,ObjectID,ExecutionOrder,CurrentStatus,SourceMethodology,ActionType,TargetMethodology,FailureAction,IsExternalDB,ConnectionString,SourceStatement,NeedsResolution,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,Description,TargetStatement,ParentTask,SourceDatabaseProvider,TargetDatabaseProvider,IsExternalTarget,TargetConnectionString,ExecutionMode,ExecuteAllBlocks,QueuePath,UniqueID,LastModifiedByType,EmailId,NotifyOnFailure,EmailSubject,EmailBody,IsSourceCaseSensitive,IsTargetCaseSensitive,IsClientDateTime)VALUES(985,301,'Task 8: Archive BAP NIFS Data in Archival Table',73,89,0,9,1,1,4,0,1,0,'','MPI_BAP_NIFS_DATA_ARCHIVE',0,1,'Jan 11 2024  9:05:49:000AM',4601,'Jun  5 2024  8:38:41:807AM','Task 8: Archive BAP NIFS Data in Archival Table','',0,'Microsoft.Data.SqlClient','Microsoft.Data.SqlClient',0,'',3,0,'','DE0C45F5-4AE6-431A-9FE1-8B1BB8F1B5EC',0,'',0,NULL,'',0,0,NULL)
INSERT INTO CIS_TASK (OwnerID,TaskID,TaskName,PassID,JobID,ObjectID,ExecutionOrder,CurrentStatus,SourceMethodology,ActionType,TargetMethodology,FailureAction,IsExternalDB,ConnectionString,SourceStatement,NeedsResolution,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,Description,TargetStatement,ParentTask,SourceDatabaseProvider,TargetDatabaseProvider,IsExternalTarget,TargetConnectionString,ExecutionMode,ExecuteAllBlocks,QueuePath,UniqueID,LastModifiedByType,EmailId,NotifyOnFailure,EmailSubject,EmailBody,IsSourceCaseSensitive,IsTargetCaseSensitive,IsClientDateTime)VALUES(985,325,'Generate CSV for Input Request - IND',64,89,0,1,1,1,30,1,1,0,'','MPI_BAP_CREATE_FILE',0,1,'Feb 13 2024  4:49:08:000AM',4601,'Jun  5 2024  8:38:41:730AM','Generate CSV File by Calling API','MPI_BAP_CSV_API_RESPONSE_LT',151,'Microsoft.Data.SqlClient','Microsoft.Data.SqlClient',0,'',3,0,'','6947E093-8D4D-4EE7-9214-5031D26D16C1',0,'',0,NULL,'',0,0,NULL)
INSERT INTO CIS_TASK (OwnerID,TaskID,TaskName,PassID,JobID,ObjectID,ExecutionOrder,CurrentStatus,SourceMethodology,ActionType,TargetMethodology,FailureAction,IsExternalDB,ConnectionString,SourceStatement,NeedsResolution,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,Description,TargetStatement,ParentTask,SourceDatabaseProvider,TargetDatabaseProvider,IsExternalTarget,TargetConnectionString,ExecutionMode,ExecuteAllBlocks,QueuePath,UniqueID,LastModifiedByType,EmailId,NotifyOnFailure,EmailSubject,EmailBody,IsSourceCaseSensitive,IsTargetCaseSensitive,IsClientDateTime)VALUES(985,326,'Call BAP Service and Send CSV File',72,89,0,3,1,2,30,1,1,0,'','SELECT 1 AS OUTPUT',0,1,'Feb 13 2024  4:01:26:000PM',4601,'Jun  5 2024  8:38:41:750AM','Call BAP Service and Send CSV File','MPI_BAP_RESPONSE_LT',153,'Microsoft.Data.SqlClient','Microsoft.Data.SqlClient',0,'',3,0,'','61A95956-B814-405E-A372-EEFACBCC1B69',0,'',0,NULL,'',0,0,NULL)
INSERT INTO CIS_TASK (OwnerID,TaskID,TaskName,PassID,JobID,ObjectID,ExecutionOrder,CurrentStatus,SourceMethodology,ActionType,TargetMethodology,FailureAction,IsExternalDB,ConnectionString,SourceStatement,NeedsResolution,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,Description,TargetStatement,ParentTask,SourceDatabaseProvider,TargetDatabaseProvider,IsExternalTarget,TargetConnectionString,ExecutionMode,ExecuteAllBlocks,QueuePath,UniqueID,LastModifiedByType,EmailId,NotifyOnFailure,EmailSubject,EmailBody,IsSourceCaseSensitive,IsTargetCaseSensitive,IsClientDateTime)VALUES(985,327,'Move response file to archival folder',66,89,0,7,1,0,10,0,1,0,'','',0,1,'Feb 14 2024  5:41:17:000AM',4601,'Jun  5 2024  8:38:41:787AM','Moving the files to archival folder, so the same must not be read again.','',0,'Microsoft.Data.SqlClient','Microsoft.Data.SqlClient',0,'',3,0,'','75F7104A-2C45-445D-99D3-C04D64975A7B',0,'',0,NULL,'',0,0,NULL)
INSERT INTO CIS_TASK (OwnerID,TaskID,TaskName,PassID,JobID,ObjectID,ExecutionOrder,CurrentStatus,SourceMethodology,ActionType,TargetMethodology,FailureAction,IsExternalDB,ConnectionString,SourceStatement,NeedsResolution,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,Description,TargetStatement,ParentTask,SourceDatabaseProvider,TargetDatabaseProvider,IsExternalTarget,TargetConnectionString,ExecutionMode,ExecuteAllBlocks,QueuePath,UniqueID,LastModifiedByType,EmailId,NotifyOnFailure,EmailSubject,EmailBody,IsSourceCaseSensitive,IsTargetCaseSensitive,IsClientDateTime)VALUES(985,329,'Archive Input CSV file',72,89,0,5,1,0,10,0,1,0,'','',0,1,'Feb 14 2024  2:14:29:000PM',4601,'Jun  5 2024  8:38:41:770AM','Archive the file, which are already sent to MPI. We are trying to ignore sending duplicate file to MPI.','',0,'Microsoft.Data.SqlClient','Microsoft.Data.SqlClient',0,'',3,0,'','9F7848B6-A845-4A3C-92E4-12E7F39F1565',0,'',0,NULL,'',0,0,NULL)
INSERT INTO CIS_TASK (OwnerID,TaskID,TaskName,PassID,JobID,ObjectID,ExecutionOrder,CurrentStatus,SourceMethodology,ActionType,TargetMethodology,FailureAction,IsExternalDB,ConnectionString,SourceStatement,NeedsResolution,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,Description,TargetStatement,ParentTask,SourceDatabaseProvider,TargetDatabaseProvider,IsExternalTarget,TargetConnectionString,ExecutionMode,ExecuteAllBlocks,QueuePath,UniqueID,LastModifiedByType,EmailId,NotifyOnFailure,EmailSubject,EmailBody,IsSourceCaseSensitive,IsTargetCaseSensitive,IsClientDateTime)VALUES(985,331,'Check MPI API Response Status',72,89,0,4,1,1,4,0,1,0,'','MPI_BAP_VALIDATE_API_RESPONSE',0,1,'Mar  6 2024  2:05:42:630AM',4601,'Jun  5 2024  8:38:41:760AM','Check is MPI API Call is success OR Failure','',0,'Microsoft.Data.SqlClient','Microsoft.Data.SqlClient',0,'',3,0,'','39BA3293-3EAD-4335-AB15-BB8F3BE09CB2',0,'',0,NULL,'',0,0,NULL)
INSERT INTO CIS_TASK (OwnerID,TaskID,TaskName,PassID,JobID,ObjectID,ExecutionOrder,CurrentStatus,SourceMethodology,ActionType,TargetMethodology,FailureAction,IsExternalDB,ConnectionString,SourceStatement,NeedsResolution,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,Description,TargetStatement,ParentTask,SourceDatabaseProvider,TargetDatabaseProvider,IsExternalTarget,TargetConnectionString,ExecutionMode,ExecuteAllBlocks,QueuePath,UniqueID,LastModifiedByType,EmailId,NotifyOnFailure,EmailSubject,EmailBody,IsSourceCaseSensitive,IsTargetCaseSensitive,IsClientDateTime)VALUES(985,2363,'Generate CSV for Input Request - NND',64,89,0,2,1,1,30,1,2,0,'','MPI_BAP_CREATE_FILE',0,4601,'Jun  5 2024  7:43:02:127AM',4601,'Jun  5 2024  8:38:41:740AM','','MPI_BAP_CSV_API_RESPONSE_LT',302,'Microsoft.Data.SqlClient','Microsoft.Data.SqlClient',0,'',3,0,'','AA0B322C-2B61-4B65-88F2-70DF9BACBECF',0,'',0,NULL,'',0,0,NULL)


--------------------------------------------------------


INSERT INTO CIS_MAPPING_BLOCK (OwnerID,TaskID,BlockNumber,Type,Expression,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LastModifiedByType)VALUES(985,271,1,1,'<parameters><isasynchcall>false</isasynchcall><hasoutputprams>false</hasoutputprams><MaxApiThreads></MaxApiThreads><inputParameters></inputParameters><tgtInputParams></tgtInputParams><SRCBatchSize></SRCBatchSize><SRCBatchSizeParamName></SRCBatchSizeParamName><SRCBatchIndexParamName></SRCBatchIndexParamName></parameters>',1,'Jan 10 2024  6:07:27:000AM',4601,'Jun  5 2024  8:38:41:723AM',-1)
INSERT INTO CIS_MAPPING_BLOCK (OwnerID,TaskID,BlockNumber,Type,Expression,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LastModifiedByType)VALUES(985,299,1,1,'<parameters><dataSource>/mnt/maybank_bapclient/inbox</dataSource><sourceName></sourceName><sourceColumns></sourceColumns><sourceType>csv</sourceType><targetName>MPI_BAP_NIFS_RESPONSE_FILE_DATA</targetName><targetType>Table</targetType><jsonExpression></jsonExpression><dbName></dbName><delimiter>,</delimiter><lockTable>false</lockTable><hasHeader>true</hasHeader><autoCreateFormat>true</autoCreateFormat><formatFile> /mnt/maybank_bapclient/inboxbap_read1.fmt</formatFile><isFolder>True</isFolder><useApi>true</useApi><InstanceName></InstanceName><UserName></UserName><Password></Password><HeaderRowCount></HeaderRowCount><FooterRowCount></FooterRowCount><dataConnectionId></dataConnectionId><formatFileBase64Name>bap_read1.fmt</formatFileBase64Name><formatFileBase64>OS4wDQozMw0KMSBTUUxDSEFSIDAgODAwMCAiLCIJMQlSRUNLRVkgIiINCjIgU1FMQ0hBUiAwIDgwMDAgIiwiCTIJU09VUkNFICIiDQozIFNRTENIQVIgMCA4MDAwICIsIgkzCU5BTUUgIiINCjQgU1FMQ0hBUiAwIDgwMDAgIiwiCTQJQklSVEggIiINCjUgU1FMQ0hBUiAwIDgwMDAgIiwiCTUJQUREUkVTUyAiIg0KNiBTUUxDSEFSIDAgODAwMCAiLCIJNglTUE9VU0UgIiINCjcgU1FMQ0hBUiAwIDgwMDAgIiwiCTcJU0VYICIiDQo4IFNRTENIQVIgMCA4MDAwICIsIgk4CVRJTiAiIg0KOSBTUUxDSEFSIDAgODAwMCAiLCIJOQlTU1MgIiINCjEwIFNRTENIQVIgMCA4MDAwICIsIgkxMAlDSVZJTFNUQVQgIiINCjExIFNRTENIQVIgMCA4MDAwICIsIgkxMQlCVVNJTkVTUyAiIg0KMTIgU1FMQ0hBUiAwIDgwMDAgIiwiCTEyCUJVU0FERFJTICIiDQoxMyBTUUxDSEFSIDAgODAwMCAiLCIJMTMJQkRUICIiDQoxNCBTUUxDSEFSIDAgODAwMCAiLCIJMTQJQkRUREFURSAiIg0KMTUgU1FMQ0hBUiAwIDgwMDAgIiwiCTE1CVNFQyAiIg0KMTYgU1FMQ0hBUiAwIDgwMDAgIiwiCTE2CVNFQ0RBVEUgIiINCjE3IFNRTENIQVIgMCA4MDAwICIsIgkxNwlSRVBPUlRFRCAiIg0KMTggU1FMQ0hBUiAwIDgwMDAgIiwiCTE4CUJBTksgIiINCjE5IFNRTENIQVIgMCA4MDAwICIsIgkxOQlCUkFOQ0ggIiINCjIwIFNRTENIQVIgMCA4MDAwICIsIgkyMAlSRU1BUktTICIiDQoyMSBTUUxDSEFSIDAgODAwMCAiLCIJMjEJTkVHREFURSAiIg0KMjIgU1FMQ0hBUiAwIDgwMDAgIiwiCTIyCUNMT1NFREFURSAiIg0KMjMgU1FMQ0hBUiAwIDgwMDAgIiwiCTIzCVRZUEUgIiINCjI0IFNRTENIQVIgMCA4MDAwICIsIgkyNAlKT0lOVCAiIg0KMjUgU1FMQ0hBUiAwIDgwMDAgIiwiCTI1CUxPQU5fU0FMQSAiIg0KMjYgU1FMQ0hBUiAwIDgwMDAgIiwiCTI2CUFNVF9MSU1JVCAiIg0KMjcgU1FMQ0hBUiAwIDgwMDAgIiwiCTI3CVNFQ1VfQ0FTRSAiIg0KMjggU1FMQ0hBUiAwIDgwMDAgIiwiCTI4CUNBUkRCQUwgIiINCjI5IFNRTENIQVIgMCA4MDAwICIsIgkyOQlFWFRfUExBSU5UICIiDQozMCBTUUxDSEFSIDAgODAwMCAiLCIJMzAJQ0FSRF9EQVRFICIiDQozMSBTUUxDSEFSIDAgODAwMCAiLCIJMzEJSU5EMSAiIg0KMzIgU1FMQ0hBUiAwIDgwMDAgIiwiCTMyCUlORDIgIiINCjMzIFNRTENIQVIgMCA4MDAwICIsIgkzMwlJTkNEQVRFICIiDQoNCg==</formatFileBase64><inputParameters></inputParameters><logFields><logField>Directory Name</logField><logField>File Name</logField></logFields></parameters>',1,'Jan 11 2024  9:05:04:000AM',4601,'Jun  5 2024  8:38:41:777AM',-1)
INSERT INTO CIS_MAPPING_BLOCK (OwnerID,TaskID,BlockNumber,Type,Expression,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LastModifiedByType)VALUES(985,300,1,1,'<parameters><isasynchcall>false</isasynchcall><hasoutputprams>false</hasoutputprams><MaxApiThreads>1</MaxApiThreads><inputParameters></inputParameters><tgtInputParams></tgtInputParams><SRCBatchSize></SRCBatchSize><SRCBatchSizeParamName></SRCBatchSizeParamName><SRCBatchIndexParamName></SRCBatchIndexParamName></parameters>',1,'Jan 11 2024  9:05:04:000AM',4601,'Jun  5 2024  8:38:41:797AM',-1)
INSERT INTO CIS_MAPPING_BLOCK (OwnerID,TaskID,BlockNumber,Type,Expression,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LastModifiedByType)VALUES(985,301,1,1,'<parameters><isasynchcall>false</isasynchcall><hasoutputprams>false</hasoutputprams><MaxApiThreads>1</MaxApiThreads><inputParameters></inputParameters><tgtInputParams></tgtInputParams><SRCBatchSize></SRCBatchSize><SRCBatchSizeParamName></SRCBatchSizeParamName><SRCBatchIndexParamName></SRCBatchIndexParamName></parameters>',1,'Jan 11 2024  9:05:49:000AM',4601,'Jun  5 2024  8:38:41:807AM',-1)
INSERT INTO CIS_MAPPING_BLOCK (OwnerID,TaskID,BlockNumber,Type,Expression,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LastModifiedByType)VALUES(985,325,1,1,'<parameters><inputparameters><parameters><parameter name="DummyField" paramtype="String" value="!!date1!!" displayvalue="!!date1!!" valuetype="1" trackchange="0"></parameter></parameters></inputparameters><outputparameters></outputparameters><mappingBlocks><mappingBlock><blockName></blockName><mappingConditions></mappingConditions><mappingFields><mappingField targetField="ResponseCode" targetType="System.String" sourceExpression="F819" sourceType="" sourceValue="ResponseCode"></mappingField><mappingField targetField="ResponseStatus" targetType="System.String" sourceExpression="F820" sourceType="" sourceValue="ResponseStatus"></mappingField></mappingFields></mappingBlock></mappingBlocks><MaxApiThreads></MaxApiThreads><resumeFlow>false</resumeFlow><fireAndForget>false</fireAndForget><edsActionType>2</edsActionType></parameters>',1,'Feb 13 2024  4:49:08:000AM',4601,'Jun  5 2024  8:38:41:730AM',-1)
INSERT INTO CIS_MAPPING_BLOCK (OwnerID,TaskID,BlockNumber,Type,Expression,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LastModifiedByType)VALUES(985,326,1,1,'<parameters><inputparameters><parameters><parameter name="uploadfileFolderPath" paramtype="String" value="/mnt/maybank_bapclient/outbox" displayvalue="/mnt/maybank_bapclient/outbox" valuetype="1" trackchange="0"></parameter><parameter name="downloadFolderPath" paramtype="String" value="/mnt/maybank_bapclient/inbox" displayvalue="/mnt/maybank_bapclient/inbox" valuetype="1" trackchange="0"></parameter></parameters></inputparameters><outputparameters></outputparameters><mappingBlocks><mappingBlock><blockName></blockName><mappingConditions></mappingConditions><mappingFields><mappingField targetField="RESPONSE" targetType="System.String" sourceExpression="F825" sourceType="" sourceValue="Result"></mappingField></mappingFields></mappingBlock></mappingBlocks><MaxApiThreads>1</MaxApiThreads><resumeFlow>false</resumeFlow><fireAndForget>false</fireAndForget><edsActionType>2</edsActionType></parameters>',1,'Feb 13 2024  4:01:26:000PM',4601,'Jun  5 2024  8:38:41:750AM',-1)
INSERT INTO CIS_MAPPING_BLOCK (OwnerID,TaskID,BlockNumber,Type,Expression,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LastModifiedByType)VALUES(985,327,1,1,'<parameters><sourcePath>/mnt/maybank_bapclient/inbox</sourcePath><targetPath>/mnt/maybank_bapclient/archive</targetPath><isFolder>true</isFolder><deleteSourceFile>false</deleteSourceFile><protocol>none</protocol><serverIP></serverIP><userID></userID><password>s5UK28ZXHxs=</password><fileName>undefined</fileName><privateKeyFilePath></privateKeyFilePath><passPhrase></passPhrase><isFileNameSpecified>false</isFileNameSpecified><FileFilterType>0</FileFilterType><advFilter>0</advFilter><portNumber></portNumber><searchPattern></searchPattern><key>s5UK28ZXHxs=</key><keySize></keySize><paddingMode></paddingMode><cipherMode></cipherMode></parameters>',1,'Feb 14 2024  5:41:17:000AM',4601,'Jun  5 2024  8:38:41:787AM',-1)
INSERT INTO CIS_MAPPING_BLOCK (OwnerID,TaskID,BlockNumber,Type,Expression,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LastModifiedByType)VALUES(985,329,1,1,'<parameters><sourcePath>/mnt/maybank_bapclient/outbox</sourcePath><targetPath>/mnt/maybank_bapclient/archive_outbox</targetPath><isFolder>true</isFolder><deleteSourceFile>false</deleteSourceFile><protocol>none</protocol><serverIP></serverIP><userID></userID><password>s5UK28ZXHxs=</password><fileName></fileName><privateKeyFilePath></privateKeyFilePath><passPhrase></passPhrase><isFileNameSpecified>false</isFileNameSpecified><FileFilterType>0</FileFilterType><advFilter>0</advFilter><portNumber></portNumber><searchPattern></searchPattern><key>s5UK28ZXHxs=</key><keySize></keySize><paddingMode></paddingMode><cipherMode></cipherMode></parameters>',1,'Feb 14 2024  2:14:29:000PM',4601,'Jun  5 2024  8:38:41:770AM',-1)
INSERT INTO CIS_MAPPING_BLOCK (OwnerID,TaskID,BlockNumber,Type,Expression,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LastModifiedByType)VALUES(985,331,1,1,'<parameters><isasynchcall>false</isasynchcall><hasoutputprams>false</hasoutputprams><MaxApiThreads>1</MaxApiThreads><inputParameters></inputParameters><tgtInputParams></tgtInputParams><SRCBatchSize></SRCBatchSize><SRCBatchSizeParamName></SRCBatchSizeParamName><SRCBatchIndexParamName></SRCBatchIndexParamName></parameters>',1,'Mar  6 2024  2:05:42:630AM',4601,'Jun  5 2024  8:38:41:760AM',-1)
INSERT INTO CIS_MAPPING_BLOCK (OwnerID,TaskID,BlockNumber,Type,Expression,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,LastModifiedByType)VALUES(985,2363,1,1,'<parameters><inputparameters><parameters><parameter name="DummyField" paramtype="String" value="!!date1!!" displayvalue="!!date1!!" valuetype="0" trackchange="0"></parameter></parameters></inputparameters><outputparameters></outputparameters><mappingBlocks><mappingBlock><blockName></blockName><mappingConditions></mappingConditions><mappingFields><mappingField targetField="ResponseCode" targetType="System.String" sourceExpression="F6142" sourceType="" sourceValue="ResponseCode"></mappingField><mappingField targetField="ResponseStatus" targetType="System.String" sourceExpression="F6143" sourceType="" sourceValue="ResponseStatus"></mappingField></mappingFields></mappingBlock></mappingBlocks><MaxApiThreads></MaxApiThreads><resumeFlow>false</resumeFlow><fireAndForget>false</fireAndForget><edsActionType>2</edsActionType></parameters>',4601,'Jun  5 2024  7:43:02:127AM',4601,'Jun  5 2024  8:38:41:740AM',-1)

--------------------------------------------------------------------------------------------

-- SP's

CREATE   OR ALTER     PROCEDURE [DBO].[MPI_BAP_NIFS_IDENTITY_RECORDS] (@OWNERID INT)            
AS            
/*            
  CREATED BY: ALI ASGAR BAJI; CREATED ON:11-01-2024;            
  DETAILS: INSERT BAP RELATED RECORD ON THE LANDING TABLE FOR FILE GENERATION;            
  EXEC [MPI_BAP_NIFS_IDENTITY_RECORDS] 985;            
*/            
BEGIN                                                
  /* DECLARING VARIABLES FOR THE SP */            
  DECLARE @JOBID        INT,            
          @TASKID       INT,            
          @CURRENTDATE  DATETIME = GETDATE(),            
          @LASTRUNON    DATETIME,            
          @BATCHNUMBER  INT,            
          @SUCCESSCOUNT INT;            
---------------------------- FETCH JOB ID OF THIS TASK -------------------------------------------------------------------            
SELECT @JOBID = JOBID, @LASTRUNON = LASTRUNON FROM CIS_JOB (NOLOCK) C WHERE  C.OWNERID = @OWNERID AND C.JOBNAME = N'MPI – BAP NIFS DATA PROCESSING';            
---------------------------- FETCH TASK ID OF THIS TASK ------------------------------------------------------------------            
SELECT @TASKID = TASKID FROM CIS_TASK (NOLOCK) T WHERE T.OWNERID = @OWNERID AND T.JOBID = @JOBID AND T.TASKNAME = N'Task 1: Identify the new Records';            
---------------------------- FETCH CURRENT JOB EXECUTION BATCH NUMBER-----------------------------------------------------                                                
SELECT @BATCHNUMBER = DBO.CIS_GET_BATCH_NUMBER (@OWNERID, @JOBID);            
                    
--------------------------------------------------------------------------------------------------------------------------                                    
  DELETE FROM MPI_BAP_NIFS_APPLICATION_DATA WHERE IS_NO_MATCH IN (1,2); -- IS NO MATCH AND HAS HIT RECORD        
  DELETE FROM MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA WHERE IS_NO_MATCH IN (1,2); -- IS NO MATCH AND HAS HIT RECORD        
                            
  /* NAME CHECK INSERTION */                          
  INSERT INTO MPI_BAP_NIFS_APPLICATION_DATA                              
  (                              
    APPLICATIONID,            
 RECORDID, FIRSTNAME, MIDDLENAME, LASTNAME,             
 DOB, TANNUMBER, SPOUCENAME, ADDRESS, BANKCODE,            
 INSERTEDON, BATCHNUMBER            
  )            
  SELECT                               
    N'F-' + CONVERT(NVARCHAR(12), AP.APPLICATIONID) + N'-' + RIGHT ( CONCAT( N'0000', ROW_NUMBER() OVER (PARTITION BY AP.APPLICATIONID ORDER BY AP.APPLICATIONID)) , 4),            
    AP.APPLICATIONID, AP.FIRSTNAME, AP.MIDDLENAME, AP.LASTNAME,            
    DATEADD(MI,480,AP3.APL_EX3_34), N'', N'', N'', N'MPI',            
    @CURRENTDATE, @BATCHNUMBER                              
  FROM APPLICATION AP            
  INNER JOIN APL_EX1 AP1 ON AP.OWNERID = AP1.OWNERID AND AP.APPLICATIONID = AP1.APL_EX1_ID            
  INNER JOIN APL_EX2 AP2 ON AP.OWNERID = AP2.OWNERID AND AP.APPLICATIONID = AP2.APL_EX2_ID            
  INNER JOIN APL_EX3 AP3 ON AP.OWNERID = AP3.OWNERID AND AP.APPLICATIONID = AP3.APL_EX3_ID            
  WHERE AP.OWNERID = 985            
   --  AND AP.CREATEDON >= (@LASTRUNON - 1)            
  AND ISNULL(AP2.APL_EX2_5, 1) = 1 /*Application - BAP NIFS Check Flag - BAP CHECK FLAG ON APPLICATION*/            
  AND AP.APPLICATIONID NOT IN (SELECT RECORDID FROM MPI_BAP_NIFS_APPLICATION_DATA)            
               
  UNION            
             
  SELECT                               
    N'M-' + CONVERT(NVARCHAR(12), AP.APPLICATIONID) + N'-' + RIGHT ( CONCAT( N'0000', ROW_NUMBER() OVER (PARTITION BY AP.APPLICATIONID ORDER BY AP.APPLICATIONID)) , 4),            
    AP.APPLICATIONID, AP.FIRSTNAME, AP1.APL_EX1_56, AP.MIDDLENAME,            
 DATEADD(mi,480,AP3.APL_EX3_34), N'', N'', N'', N'MPI',            
    @CURRENTDATE, @BATCHNUMBER                            
  FROM APPLICATION AP            
  INNER JOIN APL_EX1 AP1 ON AP.OWNERID = AP1.OWNERID AND AP.APPLICATIONID = AP1.APL_EX1_ID           
  INNER JOIN APL_EX2 AP2 ON AP.OWNERID = AP2.OWNERID AND AP.APPLICATIONID = AP2.APL_EX2_ID            
  INNER JOIN APL_EX3 AP3 ON AP.OWNERID = AP3.OWNERID AND AP.APPLICATIONID = AP3.APL_EX3_ID            
  WHERE AP.OWNERID = 985       
  --  AND AP.CREATEDON >= (@LASTRUNON - 1)            
 AND AP1.APL_EX1_56 IS NOT NULL /*APL - MAIDEN Name Field*/              
 AND ISNULL(AP2.APL_EX2_5, 1) = 1 /*Application - BAP NIFS Check Flag - BAP CHECK FLAG ON APPLICATION*/         
 AND AP.APPLICATIONID NOT IN (SELECT RECORDID FROM MPI_BAP_NIFS_APPLICATION_DATA)            
            
          
          
  INSERT INTO MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA                              
  (                              
    APPLICATIONID,RECORDID, BUSINESSNAME, ADDRESS, SECNO,             
 TANNUMBER, BANKCODE,            
 INSERTEDON, BATCHNUMBER            
  )            
  SELECT                               
    N'B-' + CONVERT(NVARCHAR(12), AP.APPLICATIONID) + N'-' + RIGHT ( CONCAT( N'0000', ROW_NUMBER() OVER (PARTITION BY AP.APPLICATIONID ORDER BY AP.APPLICATIONID)) , 4),            
    AP.APPLICATIONID, Apl_ex3_48,  RTRIM(LTRIM(CONCAT(Apl_ex3_79 ,' ',   /*Block Number*/                
     Apl_ex3_82 ,' ',     /*LOT Number*/              
     Apl_ex3_80 ,' ',       /*Phase Number*/              
     Apl_ex3_81 ,' ',     /*Unit Number*/                
     Apl_ex3_83,' ',              
     Apl_ex3_84    /*StreetName */  ))),          
  Apl_ex4_2,          
  '',          
    N'MPI',            
    @CURRENTDATE, @BATCHNUMBER                            
  FROM APPLICATION AP            
  INNER JOIN APL_EX1 AP1 ON AP.OWNERID = AP1.OWNERID AND AP.APPLICATIONID = AP1.APL_EX1_ID            
  INNER JOIN APL_EX2 AP2 ON AP.OWNERID = AP2.OWNERID AND AP.APPLICATIONID = AP2.APL_EX2_ID            
  INNER JOIN APL_EX3 AP3 ON AP.OWNERID = AP3.OWNERID AND AP.APPLICATIONID = AP3.APL_EX3_ID           
  INNER JOIN APL_EX4 AP4 ON AP.OWNERID = AP4.OWNERID AND AP.APPLICATIONID = AP4.APL_EX4_ID           
  WHERE AP.OWNERID = 985            
   -- AND AP.CREATEDON >= (@LASTRUNON - 1)       
 and Apl_ex3_48 IS NOT NULL      
 AND ISNULL(AP2.APL_EX2_5, 1) = 1 /*Application - BAP NIFS Check Flag - BAP CHECK FLAG ON APPLICATION*/            
 AND AP.APPLICATIONID NOT IN (SELECT RECORDID FROM MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA)            
          
          
          
-------------- FETCH VALID RECORDS COUNT ---------------                                                                            
  SET @SUCCESSCOUNT = @@ROWCOUNT;            
            
-------------- UPDATE INVALID/VALID RECORDS COUNT IN CIS_LOG TABLE FOR EASY VISIBILITY ON UI ---------------                                                
  UPDATE C            
    SET  C.FAILURECOUNT = 0,            
         C.SUCCESSCOUNT = @SUCCESSCOUNT            
  FROM CIS_LOG C            
    WHERE C.OWNERID = @OWNERID            
    AND   C.BATCHNUMBER = @BATCHNUMBER            
    AND   C.SOURCETYPEID = 3            
    AND   C.SOURCEID = @TASKID;            
            
END
GO 
-----------------------------------------------------------------

        
CREATE   OR ALTER    PROCEDURE [dbo].[MPI_BAP_NIFS_MAP_APPLICATION] (@OWNERID INT)                                                      
AS        
/*                                                      
  CREATED BY: ALI ASGAR BAJI; CREATED ON:11-01-2024 ;        
  DETAILS: Update the BAP Record On Application, Response from the file;        
  EXEC MPI_BAP_NIFS_MAP_APPLICATION 985;        
*/        
BEGIN                                                      
  /* DECLARING VARIABLES FOR THE SP */        
  DECLARE @JOBID        INT,        
          @TASKID       INT,        
          @CURRENTDATE  DATETIME = GETDATE(),        
          @LASTRUNON    DATETIME,        
          @BATCHNUMBER  INT,        
    @FAILURECOUNT INT,        
          @SUCCESSCOUNT INT;                                    
---------------------------- FETCH JOB ID OF THIS TASK -------------------------------------------------------------------        
SELECT @JOBID = JOBID FROM   CIS_JOB (NOLOCK) C WHERE  C.OWNERID = @OWNERID AND C.JOBNAME = N'MPI – BAP NIFS DATA PROCESSING';        
---------------------------- FETCH TASK ID OF THIS TASK ------------------------------------------------------------------        
SELECT @TASKID = TASKID FROM CIS_TASK (NOLOCK) T WHERE T.OWNERID = @OWNERID AND T.JOBID = @JOBID AND T.TASKNAME = N'Task 7: Map the Response File Information to Application';        
---------------------------- FETCH CURRENT JOB EXECUTION BATCH NUMBER-----------------------------------------------------        
SELECT @BATCHNUMBER = DBO.CIS_GET_BATCH_NUMBER (@OWNERID, @JOBID);        
-------------------------------------------------------------------------------                          
SELECT @LASTRUNON = LASTRUNON FROM CIS_JOB WHERE OWNERID = 985 AND JOBID = 89;        
--DELETE FROM MPI_BAP_NIFS_RESPONSE_FILE_DATA WHERE RECKEY = '"8116"'        
-------------------------------------------------------------------------------                                          
        
  ------------------------------------- MARK SENT RECORDS --------------------------                      
  --UPDATE MPI_BAP_NIFS_APPLICATION_DATA SET IS_SENT = 1 WHERE IS_SENT = 0 AND APPLICATIONID IN (SELECT TOP 92 APPLICATIONID FROM MPI_BAP_NIFS_APPLICATION_DATA);        
  --UPDATE MPI_BAP_NIFS_APPLICATION_DATA SET IS_SENT = 0 WHERE IS_SENT = 1 AND IS_NO_MATCH = 0 AND DATEDIFF(MINUTE, INSERTEDON , @CURRENTDATE) < 20                    
        
  SELECT  RECKEY + ','    
  + SOURCE + ','    
  + REPLACE (NAME,',','*')     
  + ','+ REPLACE (BIRTH,',','*')     
  + ','+ REPLACE (ADDRESS,',','*')    
  + ','+ REPLACE (SPOUSE,',','*')    
  + ','+ REPLACE (SEX,',','*')    
  + ','+ REPLACE (TIN,',','*')    
  + ','+ REPLACE (SSS,',','*')     
  + ','+ REPLACE (CIVILSTAT,',','*')     
  + ','+ REPLACE (BUSINESS,',','*')     
  + ','+ REPLACE (BUSADDRS,',','*')     
  + ','+ REPLACE (BDT,',','*')     
  + ','+ REPLACE (BDTDATE,',','*')     
  + ','+ REPLACE (SEC,',','*')    
  + ','+ REPLACE (SECDATE,',','*')    
  + ','+ REPLACE (REPORTED,',','*') + ','    
  + REPLACE (BANK,',','*')     
  + ','+ REPLACE (BRANCH,',','*')     
  + ','+ REPLACE (REMARKS,',','*')     
  + ','+ REPLACE (NEGDATE,',','*')    
  + ','+ REPLACE (CLOSEDATE,',','*')     
  + ','+ REPLACE (TYPE,',','*')     
  + ','+ REPLACE (JOINT,',','*')     
  + ','+ REPLACE (LOAN_SALA,',','*')    
  +','+ REPLACE (AMT_LIMIT,',','*')     
  + ','+ REPLACE (SECU_CASE,',','*')     
  + ','+ REPLACE (CARDBAL,',','*')    
  + ','+ REPLACE (EXT_PLAINT,',','*')     
  + ','+ REPLACE (CARD_DATE,',','*')     
  + ','+ REPLACE (IND1,',','*')    
  + ','+ REPLACE (IND2,',','*')    
  + ','+ REPLACE (INCDATE,',','*') AS DATA        
  INTO #TEMP                            
  FROM MPI_BAP_NIFS_RESPONSE_FILE_DATA;        
                           
  UPDATE #TEMP SET DATA = REPLACE (DATA,'/  /','""') -- EMPTY DATE MASSAGE        
  UPDATE #TEMP SET DATA = REPLACE (DATA,'","','?') --QUOTES MASSAGE                            
  UPDATE #TEMP SET DATA = REPLACE (DATA,',"','?') --QUOTES MASSAGE                            
  UPDATE #TEMP SET DATA = REPLACE (DATA,'",','?') --QUOTES MASSAGE           
  UPDATE #TEMP SET DATA = REPLACE (DATA,'"','') --QUOTES MASSAGE                     
  UPDATE #TEMP SET DATA = REPLACE (DATA,'&',' and ') -- REPALCE & WITH AND               
  UPDATE #TEMP SET DATA = REPLACE (DATA,'*',',')              
  --UPDATE #TEMP SET DATA = STUFF( DATA , LEN( DATA ) - 49 , 50 , REPLACE( SUBSTRING ( DATA , LEN( DATA ) - 49 , 50 ), ',' , '?' ))        
                          
  SELECT        
    xmlname.value('/Names[1]/name[1]','nvarchar(256)') AS RECKEY,        
 xmlname.value('/Names[1]/name[2]','nvarchar(256)') as SOURCE,        
 xmlname.value('/Names[1]/name[3]','nvarchar(256)') as NAME,        
 xmlname.value('/Names[1]/name[4]','nvarchar(256)') as BIRTH,        
 xmlname.value('/Names[1]/name[5]','nvarchar(256)') as ADDRESS,        
 xmlname.value('/Names[1]/name[6]','nvarchar(256)') as SPOUSE,        
 xmlname.value('/Names[1]/name[7]','nvarchar(256)') as SEX,        
 xmlname.value('/Names[1]/name[8]','nvarchar(256)') as TIN,        
 xmlname.value('/Names[1]/name[9]','nvarchar(256)') as SSS,        
 xmlname.value('/Names[1]/name[10]','nvarchar(256)') as CIVILSTAT,        
 xmlname.value('/Names[1]/name[11]','nvarchar(256)') as BUSINESS,        
 xmlname.value('/Names[1]/name[12]','nvarchar(256)') as BUSADDRS,        
 xmlname.value('/Names[1]/name[13]','nvarchar(256)') as BDT,        
 xmlname.value('/Names[1]/name[14]','nvarchar(256)') as BDTDATE,        
 xmlname.value('/Names[1]/name[15]','nvarchar(256)') as SEC,        
 xmlname.value('/Names[1]/name[16]','nvarchar(256)') as SECDATE,        
 xmlname.value('/Names[1]/name[17]','nvarchar(256)') as REPORTED,        
 xmlname.value('/Names[1]/name[18]','nvarchar(256)') as BANK,        
 xmlname.value('/Names[1]/name[19]','nvarchar(256)') as BRANCH,        
 xmlname.value('/Names[1]/name[20]','nvarchar(256)') as REMARKS,        
 xmlname.value('/Names[1]/name[21]','nvarchar(256)') as NEGDATE,        
 xmlname.value('/Names[1]/name[22]','nvarchar(256)') as CLOSEDATE,        
 xmlname.value('/Names[1]/name[23]','nvarchar(256)') as TYPE,        
 xmlname.value('/Names[1]/name[24]','nvarchar(256)') as JOINT,        
 xmlname.value('/Names[1]/name[25]','nvarchar(256)') as LOAN_SALA,        
 xmlname.value('/Names[1]/name[26]','nvarchar(256)') as AMT_LIMIT,        
 xmlname.value('/Names[1]/name[27]','nvarchar(256)') as SECU_CASE,        
 xmlname.value('/Names[1]/name[28]','nvarchar(256)') as CARDBAL,        
 xmlname.value('/Names[1]/name[29]','nvarchar(256)') as EXT_PLAINT,        
 xmlname.value('/Names[1]/name[30]','nvarchar(256)') as CARD_DATE,        
 xmlname.value('/Names[1]/name[31]','nvarchar(256)') as IND1,        
 xmlname.value('/Names[1]/name[32]','nvarchar(256)') as IND2,        
 xmlname.value('/Names[1]/name[33]','nvarchar(256)') as INCDATE,        
 0 AS APPLICATIONID,
 '' REC_TYPE_IND 
  INTO #BAPTEMP                            
  FROM (SELECT CONVERT(XML,'<Names><name>'+ REPLACE(DATA,'?', '</name><name>') + '</name></Names>') AS xmlname FROM #TEMP) AS J        
                 
  UPDATE #BAPTEMP        
    SET CLOSEDATE = CASE WHEN LEN(NEGDATE) > 10 THEN SUBSTRING(NEGDATE,11,21) ELSE NULL END,        
     NEGDATE = CASE WHEN LEN(NEGDATE) > 10 THEN SUBSTRING(NEGDATE,1,10) ELSE NULL END,        
  APPLICATIONID = SUBSTRING( RECKEY, CHARINDEX('-', RECKEY) + 1, CHARINDEX('-0', RECKEY) - CHARINDEX('-', RECKEY) - 1)  ,
  REC_TYPE_IND=   SUBSTRING( RECKEY, CHARINDEX('-', RECKEY) -1, 1)    
  ,BIRTH = CASE WHEN BIRTH = '11/11/1111' THEN '' ELSE BIRTH END; -- BAP SENT 11/11/1111 AS BIRTHDATE , WITH CONFIRMATION OF SIR GILBERT MAKING THIS EMPTY AS MEANWHILE GILBERT CHECKS WITH BAP        
          
  /*Insert Data to Processing Table - MPI_BAP_NIFS_CHECK_LT; This table will render data on custom form*/        
  INSERT INTO MPI_BAP_NIFS_CHECK_LT ( APPLICATIONID, BATCHNO, INSERTEDON, INSERTEDBY,        
    SOURCE, NAME, ADDRESS, DATEOFBIRTH, SEX, CIVILSTATUS,         
 TIN, SSS_GSIS, BUSINESSNAME, BUSINESSADDRESS, REPORTED,        
 ADVERSEDATE, ADVERSETYPE, LOANTYPE, SECURITY, SECURITYAMOUNT,        
 JOINTACC, BANKNAME, BRANCHNAME, REMARKS, DATEREPORTED, ACCOUNTOPENDATE, ACCOUNTCLOSEDATE, JOINTACCNAME,        
 DATEINCORPORATION, JOINSIGNATORY, CARDNO, CARDBALANCE, CRLIMIT, CARDCANCELATIONDATE, CARDEXTENSION,REC_TYPE_IND )                            
  SELECT         
    APPLICATIONID, @BATCHNUMBER, @CURRENTDATE, 1        
 ,SOURCE --SOURCE        
    ,NAME --NAME                            
    ,ADDRESS --ADDRESS                            
    ,CASE WHEN ISNULL(BIRTH,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( BIRTH AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy') END --DATEOFBIRTH                           
    ,CASE WHEN ISNULL(SEX,' ') = ' ' THEN NULL ELSE SEX END -- SEX                            
  ,CIVILSTAT -- CIVILSTATUS                            
    ,TIN --TIN                            
    ,SSS --SSS_GSIS                            
    ,BUSINESS --BUSINESSNAME                            
    ,BUSADDRS --BUSINESSADDRESS                
    ,CASE WHEN ISNULL(REPORTED,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( REPORTED AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END --REPORTED                     
    ,CASE WHEN ISNULL(negdate,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( negdate AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END  --ADVERSEDATE                
    ,TYPE  --ADVERSETYPE                
    ,LOAN_SALA  --LOANTYPE        
    ,SECU_CASE  --SECURITY                
    ,TRY_CONVERT( DECIMAL ( 30 , 2 ), AMT_LIMIT )--CONVERT (DECIMAL(38,2), REPLACE(AMT_LIMIT,',',''))  --SECURITYAMOUNT                
    ,JOINT  --JOINTACC                
    ,BANK  --BANKNAME                
    ,BRANCH  --BRANCHNAME                
    ,REMARKS  --REMARKS                
    ,CASE WHEN ISNULL(REPORTED,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( REPORTED AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END  --DATEREPORTED                
    ,CASE WHEN ISNULL(negdate,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( negdate AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END--ACCOUNTOPENDATE                
    ,CASE WHEN ISNULL(CLOSEDATE,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( CLOSEDATE AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END--ACCOUNTCLOSEDATE                      
    ,JOINT--JOINTACCNAME                
    ,CASE WHEN ISNULL(INCDATE,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( INCDATE AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END--DATEINCORPORATION                
    ,JOINT--JOINSIGNATORY                
    ,CARD_DATE --END--CARDNO               
    ,TRY_CONVERT( DECIMAL ( 30 , 2 ), CARDBAL )--CONVERT (DECIMAL(38,2), REPLACE(CARDBAL,',',''))--CARDBALANCE                
    ,TRY_CONVERT( DECIMAL ( 30 , 2 ), AMT_LIMIT )--CONVERT (DECIMAL(38,2), REPLACE(AMT_LIMIT,',',''))--CRLIMIT                
    ,CASE WHEN ISNULL(negdate,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( negdate AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END--CARDCANCELATIONDATE                
    ,EXT_PLAINT--CARDEXTENSION 
	,REC_TYPE_IND
  FROM #BAPTEMP WHERE ISNULL(RECKEY, N'') != N''            
        
  SELECT @SUCCESSCOUNT = COUNT(DISTINCT(RECKEY)) FROM #BAPTEMP;                            
        
  ------------------------------------------------- INSERT INTO LOGTABLE ------------------------------------------------                            
  INSERT INTO MPI_BAP_NIFS_RESPONSE_FILE_LOG( RECKEY, SOURCE, NAME, BIRTH, ADDRESS, SPOUSE, SEX, TIN, SSS,        
    CIVILSTAT, BUSINESS, BUSADDRS, BDT, BDTDATE, SEC, SECDATE, REPORTED, BANK, BRANCH,        
 REMARKS, NEGDATE, CLOSEDATE, TYPE, JOINT, LOAN_SALA, AMT_LIMIT, SECU_CASE, CARDBAL,        
 EXT_PLAINT, CARD_DATE, IND1, IND2, INCDATE, LOGDATE, APPLICATIONID, BATCHNUMBER )                                
  SELECT RECKEY, SOURCE, NAME, BIRTH, ADDRESS, SPOUSE, SEX, TIN, SSS,        
    CIVILSTAT, BUSINESS, BUSADDRS, BDT, BDTDATE, SEC, SECDATE, REPORTED, BANK, BRANCH,        
 REMARKS, NEGDATE, CLOSEDATE, TYPE, JOINT, LOAN_SALA, AMT_LIMIT, SECU_CASE, CARDBAL,        
 EXT_PLAINT, CARD_DATE, IND1, IND2, INCDATE, @CURRENTDATE, APPLICATIONID, @BATCHNUMBER        
  FROM #BAPTEMP;        
                                               
  ------------------------ UPDATE APPLICANT AND COBORROWER RECORDS -----------------             
  UPDATE MPI_BAP_NIFS_APPLICATION_DATA SET IS_NO_MATCH = 2 /*HIT*/ WHERE RECORDID IN (SELECT APPLICATIONID FROM #BAPTEMP );      
  UPDATE MPI_BAP_NIFS_APPLICATION_DATA SET IS_NO_MATCH = 1 /*NO MATCH*/ WHERE IS_NO_MATCH = 0 AND DATEDIFF(MINUTE, INSERTEDON , @CURRENTDATE) >= 20;      
      
  UPDATE MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA SET IS_NO_MATCH = 2 /*HIT*/ WHERE RECORDID IN (SELECT APPLICATIONID FROM #BAPTEMP );      
  UPDATE MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA SET IS_NO_MATCH = 1 /*NO MATCH*/ WHERE IS_NO_MATCH = 0 AND DATEDIFF(MINUTE, INSERTEDON , @CURRENTDATE) >= 20;      
    
                          
  UPDATE A2        
     SET A2.APL_EX2_5 = 5 -- NO MATCH                          
  FROM APL_EX2 A2         
  WHERE A2.APL_EX2_ID IN (SELECT RECORDID FROM MPI_BAP_NIFS_APPLICATION_DATA WHERE IS_NO_MATCH = 1);;     
   UPDATE A2        
     SET A2.APL_EX2_5 = 5 -- NO MATCH                          
  FROM APL_EX2 A2         
  WHERE A2.APL_EX2_ID IN (SELECT RECORDID FROM MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA WHERE IS_NO_MATCH = 1);;     
             
  UPDATE A2        
     SET A2.APL_EX2_5 = 5 -- NO MATCH ; "NON" MEANS NO MATCH ON BAP                       
  FROM APL_EX2 A2         
  INNER JOIN #BAPTEMP T ON A2.OWNERID = 985 AND A2.APL_EX2_ID = APPLICATIONID        
  WHERE T.SOURCE = N'NON'      
      
        
  UPDATE A2      
     SET A2.APL_EX2_5 = 2 -- HIT      
  FROM APL_EX2 A2      
  INNER JOIN MPI_BAP_NIFS_APPLICATION_DATA B ON A2.OWNERID = 985 AND RECORDID = APL_EX2_ID      
  WHERE IS_NO_MATCH = 2 /*HIT*/     
      
       
  UPDATE A2      
     SET A2.APL_EX2_5 = 2 -- HIT      
  FROM APL_EX2 A2      
  INNER JOIN MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA B ON A2.OWNERID = 985 AND RECORDID = APL_EX2_ID      
  WHERE IS_NO_MATCH = 2 /*HIT*/     
                          
-------------- UPDATE INVALID/VALID RECORDS COUNT IN CIS_LOG TABLE FOR EASY VISIBILITY ON UI ---------------                                                      
  UPDATE C        
    SET  C.FAILURECOUNT = 0,        
         C.SUCCESSCOUNT = @SUCCESSCOUNT        
  FROM CIS_LOG C        
    WHERE C.OWNERID = @OWNERID        
    AND   C.BATCHNUMBER = @BATCHNUMBER        
    AND   C.SOURCETYPEID = 3        
    AND   C.SOURCEID = @TASKID;                                                      
        
END 
GO 
--------------------------------
GO

CREATE OR ALTER PROCEDURE [dbo].[MPI_BAP_NIFS_DATA_ARCHIVE] (@OWNERID INT)                                
AS /*                                
CREATED BY: ALI ASGAR BAJI; CREATED ON:24-01-2024;
DETAILS: Archival table logic for BAP;
EXEC MPI_BAP_NIFS_DATA_ARCHIVE 985;
*/                                
BEGIN                                
  /* DECLARING VARIABLES FOR THE SP */
  DECLARE @JOBID        INT,
          @TASKID       INT,
          @CURRENTDATE  DATETIME = GETDATE(),
          @LASTRUNON    DATETIME,
          @BATCHNUMBER  INT,
          @SUCCESSCOUNT INT;                
---------------------------- FETCH JOB ID OF THIS TASK -------------------------------------------------------------------                                
SELECT @JOBID = JOBID FROM   CIS_JOB (NOLOCK) C WHERE  C.OWNERID = @OWNERID AND C.JOBNAME = N'MPI – BAP NIFS DATA PROCESSING';                                
---------------------------- FETCH TASK ID OF THIS TASK ------------------------------------------------------------------                            
SELECT @TASKID = TASKID FROM CIS_TASK (NOLOCK) T WHERE T.OWNERID = @OWNERID AND T.JOBID = @JOBID AND T.TASKNAME = N'Task 8: Archive BAP NIFS Data in Archival Table';                                
---------------------------- FETCH CURRENT JOB EXECUTION BATCH NUMBER-----------------------------------------------------                                
SELECT @BATCHNUMBER = DBO.CIS_GET_BATCH_NUMBER (@OWNERID, @JOBID);                                
--------------------------------------------------------------------------------------------------------------------------                    
      
  TRUNCATE TABLE MPI_BAP_NIFS_RESPONSE_FILE_DATA;

-------------- UPDATE INVALID/VALID RECORDS COUNT IN CIS_LOG TABLE FOR EASY VISIBILITY ON UI ---------------                                    
  UPDATE C
    SET  C.FAILURECOUNT = 0,
         C.SUCCESSCOUNT = 1
  FROM CIS_LOG C
    WHERE C.OWNERID = @OWNERID
    AND   C.BATCHNUMBER = @BATCHNUMBER
    AND   C.SOURCETYPEID = 3
    AND   C.SOURCEID = @TASKID;

END
GO 
------------------------------------------
GO 
CREATE OR ALTER PROC MPI_BAP_CREATE_FILE (@OWNERID INT)  
AS  
BEGIN  
SELECT CAST( FORMAT (getdate(), 'ddMMyyyyHHmmss') AS NVARCHAR (100)) as date1  
END
-----------------------------------
GO 
CREATE OR ALTER PROC MPI_BAP_VALIDATE_API_RESPONSE (@OWNERID INT) AS
/*
  CREATED BY: Shahbaz Shaikh; CREATED ON:11-01-2024;
  DETAILS: Validate the BAP API Response whether success OR failure; On Failure, throw the error to break the job;
  EXEC MPI_BAP_NIFS_IDENTITY_RECORDS 985;
*/
BEGIN
  /* DECLARING VARIABLES FOR THE SP */
  DECLARE @JOBID        INT,
          @TASKID       INT,
          @CURRENTDATE  DATETIME = GETDATE(),
          @LASTRUNON    DATETIME,
          @BATCHNUMBER  INT,
          @SUCCESSCOUNT INT,
		  @APIRESPONSE  NVARCHAR(MAX) = N'';
---------------------------- FETCH JOB ID OF THIS TASK -------------------------------------------------------------------
SELECT @JOBID = JOBID FROM   CIS_JOB (NOLOCK) C WHERE  C.OWNERID = @OWNERID AND C.JOBNAME = N'MPI – BAP NIFS DATA PROCESSING';
---------------------------- FETCH TASK ID OF THIS TASK ------------------------------------------------------------------
SELECT @TASKID = TASKID FROM CIS_TASK (NOLOCK) T WHERE T.OWNERID = @OWNERID AND T.JOBID = @JOBID AND T.TASKNAME = N'Check MPI API Response Status';
---------------------------- FETCH CURRENT JOB EXECUTION BATCH NUMBER-----------------------------------------------------                                    
SELECT @BATCHNUMBER = DBO.CIS_GET_BATCH_NUMBER (@OWNERID, @JOBID);
SELECT @LASTRUNON = LASTRUNON FROM CIS_JOB WHERE OWNERID = 985 AND JOBID = @JOBID;

  SELECT TOP 1 
     @APIRESPONSE = REPLACE(REPLACE(RESPONSE, N'<root>', N''), N'</root>', N'')
  FROM MPI_BAP_RESPONSE_LT
  WHERE LOGGEDON > @LASTRUNON
  ORDER BY MAPPING_ID DESC;

  IF(@APIRESPONSE LIKE '%"Exception"%') BEGIN
    SET @SUCCESSCOUNT = 0;

	THROW 99003, @APIRESPONSE, 1;
  END ELSE BEGIN
    SET @SUCCESSCOUNT = 1;
  END;

  UPDATE C
    SET  C.FAILURECOUNT = 0,
         C.SUCCESSCOUNT = @SUCCESSCOUNT
  FROM CIS_LOG C
    WHERE C.OWNERID = @OWNERID
    AND   C.BATCHNUMBER = @BATCHNUMBER
    AND   C.SOURCETYPEID = 3
    AND   C.SOURCEID = @TASKID;

END
GO 
-----------------------------------------------------------
GO
CREATE OR ALTER PROC MPI_BAP_CREATE_FILE (@OWNERID INT)  
AS  
BEGIN  
SELECT CAST( FORMAT (getdate(), 'ddMMyyyyHHmmss') AS NVARCHAR (100)) as date1  
END

------------------------
GO 
        
CREATE   OR ALTER    PROCEDURE [dbo].[MPI_BAP_NIFS_MAP_APPLICATION] (@OWNERID INT)                                                      
AS        
/*                                                      
  CREATED BY: ALI ASGAR BAJI; CREATED ON:11-01-2024 ;        
  DETAILS: Update the BAP Record On Application, Response from the file;        
  EXEC MPI_BAP_NIFS_MAP_APPLICATION 985;        
*/        
BEGIN                                                      
  /* DECLARING VARIABLES FOR THE SP */        
  DECLARE @JOBID        INT,        
          @TASKID       INT,        
          @CURRENTDATE  DATETIME = GETDATE(),        
          @LASTRUNON    DATETIME,        
          @BATCHNUMBER  INT,        
    @FAILURECOUNT INT,        
          @SUCCESSCOUNT INT;                                    
---------------------------- FETCH JOB ID OF THIS TASK -------------------------------------------------------------------        
SELECT @JOBID = JOBID FROM   CIS_JOB (NOLOCK) C WHERE  C.OWNERID = @OWNERID AND C.JOBNAME = N'MPI – BAP NIFS DATA PROCESSING';        
---------------------------- FETCH TASK ID OF THIS TASK ------------------------------------------------------------------        
SELECT @TASKID = TASKID FROM CIS_TASK (NOLOCK) T WHERE T.OWNERID = @OWNERID AND T.JOBID = @JOBID AND T.TASKNAME = N'Task 7: Map the Response File Information to Application';        
---------------------------- FETCH CURRENT JOB EXECUTION BATCH NUMBER-----------------------------------------------------        
SELECT @BATCHNUMBER = DBO.CIS_GET_BATCH_NUMBER (@OWNERID, @JOBID);        
-------------------------------------------------------------------------------                          
SELECT @LASTRUNON = LASTRUNON FROM CIS_JOB WHERE OWNERID = 985 AND JOBID = 89;        
--DELETE FROM MPI_BAP_NIFS_RESPONSE_FILE_DATA WHERE RECKEY = '"8116"'        
-------------------------------------------------------------------------------                                          
        
  ------------------------------------- MARK SENT RECORDS --------------------------                      
  --UPDATE MPI_BAP_NIFS_APPLICATION_DATA SET IS_SENT = 1 WHERE IS_SENT = 0 AND APPLICATIONID IN (SELECT TOP 92 APPLICATIONID FROM MPI_BAP_NIFS_APPLICATION_DATA);        
  --UPDATE MPI_BAP_NIFS_APPLICATION_DATA SET IS_SENT = 0 WHERE IS_SENT = 1 AND IS_NO_MATCH = 0 AND DATEDIFF(MINUTE, INSERTEDON , @CURRENTDATE) < 20                    
        
  SELECT  RECKEY + ','    
  + SOURCE + ','    
  + REPLACE (NAME,',','*')     
  + ','+ REPLACE (BIRTH,',','*')     
  + ','+ REPLACE (ADDRESS,',','*')    
  + ','+ REPLACE (SPOUSE,',','*')    
  + ','+ REPLACE (SEX,',','*')    
  + ','+ REPLACE (TIN,',','*')    
  + ','+ REPLACE (SSS,',','*')     
  + ','+ REPLACE (CIVILSTAT,',','*')     
  + ','+ REPLACE (BUSINESS,',','*')     
  + ','+ REPLACE (BUSADDRS,',','*')     
  + ','+ REPLACE (BDT,',','*')     
  + ','+ REPLACE (BDTDATE,',','*')     
  + ',*'+ REPLACE (SEC,',','*')    
  + ',*'+ REPLACE (SECDATE,',','*')    
  + ',*'+ REPLACE (REPORTED,',','*') 
   + ','+ REPLACE (BANK,',','*')     
  + ','+ REPLACE (BRANCH,',','*')     
  + ','+ REPLACE (REMARKS,',','*')     
  + ','+ REPLACE (NEGDATE,',','*')    
  + ','+ REPLACE (CLOSEDATE,',','*')     
  + ','+ REPLACE (TYPE,',','*')     
  + ','+ REPLACE (JOINT,',','*')     
  + ','+ REPLACE (LOAN_SALA,',','*')    
  +','+ REPLACE (AMT_LIMIT,',','*')     
  + ','+ REPLACE (SECU_CASE,',','*')     
  + ','+ REPLACE (CARDBAL,',','*')    
  + ','+ REPLACE (EXT_PLAINT,',','*')     
  + ','+ REPLACE (CARD_DATE,',','*')     
  + ','+ REPLACE (IND1,',','*')    
  + ','+ REPLACE (IND2,',','*')    
  + ','+ REPLACE (INCDATE,',','*') AS DATA        
  INTO #TEMP                            
  FROM MPI_BAP_NIFS_RESPONSE_FILE_DATA;        
                           
  UPDATE #TEMP SET DATA = REPLACE (DATA,'/  /','""') -- EMPTY DATE MASSAGE        
  UPDATE #TEMP SET DATA = REPLACE (DATA,'","','?') --QUOTES MASSAGE                            
  UPDATE #TEMP SET DATA = REPLACE (DATA,',"','?') --QUOTES MASSAGE                            
  UPDATE #TEMP SET DATA = REPLACE (DATA,'",','?') --QUOTES MASSAGE           
  UPDATE #TEMP SET DATA = REPLACE (DATA,'"','') --QUOTES MASSAGE                     
  UPDATE #TEMP SET DATA = REPLACE (DATA,'&',' and ') -- REPALCE & WITH AND   
   UPDATE #TEMP SET DATA = REPLACE (DATA,',*','?') 
  UPDATE #TEMP SET DATA = REPLACE (DATA,'*',',')  
   --UPDATE #TEMP SET DATA = REPLACE (DATA,',','?')  
  UPDATE #TEMP SET DATA = STUFF( DATA , LEN( DATA ) - 49 , 50 , REPLACE( SUBSTRING ( DATA , LEN( DATA ) - 49 , 50 ), ',' , '?' ))        
                          
  SELECT        
    xmlname.value('/Names[1]/name[1]','nvarchar(256)') AS RECKEY,        
 xmlname.value('/Names[1]/name[2]','nvarchar(256)') as SOURCE,        
 xmlname.value('/Names[1]/name[3]','nvarchar(256)') as NAME,        
 xmlname.value('/Names[1]/name[4]','nvarchar(256)') as BIRTH,        
 xmlname.value('/Names[1]/name[5]','nvarchar(256)') as ADDRESS,        
 xmlname.value('/Names[1]/name[6]','nvarchar(256)') as SPOUSE,        
 xmlname.value('/Names[1]/name[7]','nvarchar(256)') as SEX,        
 xmlname.value('/Names[1]/name[8]','nvarchar(256)') as TIN,        
 xmlname.value('/Names[1]/name[9]','nvarchar(256)') as SSS,        
 xmlname.value('/Names[1]/name[10]','nvarchar(256)') as CIVILSTAT,        
 xmlname.value('/Names[1]/name[11]','nvarchar(256)') as BUSINESS,        
 xmlname.value('/Names[1]/name[12]','nvarchar(256)') as BUSADDRS,        
 xmlname.value('/Names[1]/name[13]','nvarchar(256)') as BDT,        
 xmlname.value('/Names[1]/name[14]','nvarchar(256)') as BDTDATE,        
 xmlname.value('/Names[1]/name[15]','nvarchar(256)') as SEC,        
 xmlname.value('/Names[1]/name[16]','nvarchar(256)') as SECDATE,        
 xmlname.value('/Names[1]/name[17]','nvarchar(256)') as REPORTED,        
 xmlname.value('/Names[1]/name[18]','nvarchar(256)') as BANK,        
 xmlname.value('/Names[1]/name[19]','nvarchar(256)') as BRANCH,        
 xmlname.value('/Names[1]/name[20]','nvarchar(256)') as REMARKS,        
 xmlname.value('/Names[1]/name[21]','nvarchar(256)') as NEGDATE,        
 xmlname.value('/Names[1]/name[22]','nvarchar(256)') as CLOSEDATE,        
 xmlname.value('/Names[1]/name[23]','nvarchar(256)') as TYPE,        
 xmlname.value('/Names[1]/name[24]','nvarchar(256)') as JOINT,        
 xmlname.value('/Names[1]/name[25]','nvarchar(256)') as LOAN_SALA,        
 xmlname.value('/Names[1]/name[26]','nvarchar(256)') as AMT_LIMIT,        
 xmlname.value('/Names[1]/name[27]','nvarchar(256)') as SECU_CASE,        
 xmlname.value('/Names[1]/name[28]','nvarchar(256)') as CARDBAL,        
 xmlname.value('/Names[1]/name[29]','nvarchar(256)') as EXT_PLAINT,        
 xmlname.value('/Names[1]/name[30]','nvarchar(256)') as CARD_DATE,        
 xmlname.value('/Names[1]/name[31]','nvarchar(256)') as IND1,        
 xmlname.value('/Names[1]/name[32]','nvarchar(256)') as IND2,        
 xmlname.value('/Names[1]/name[33]','nvarchar(256)') as INCDATE,        
 0 AS APPLICATIONID,
 '' REC_TYPE_IND 
  INTO #BAPTEMP                            
  FROM (SELECT CONVERT(XML,'<Names><name>'+ REPLACE(DATA,'?', '</name><name>') + '</name></Names>') AS xmlname FROM #TEMP) AS J        
                 
  UPDATE #BAPTEMP        
    SET CLOSEDATE = CASE WHEN LEN(NEGDATE) > 10 THEN SUBSTRING(NEGDATE,11,21) ELSE NULL END,        
     NEGDATE = CASE WHEN LEN(NEGDATE) > 10 THEN SUBSTRING(NEGDATE,1,10) ELSE NULL END,        
  APPLICATIONID = SUBSTRING( RECKEY, CHARINDEX('-', RECKEY) + 1, CHARINDEX('-0', RECKEY) - CHARINDEX('-', RECKEY) - 1)  ,
  REC_TYPE_IND=   SUBSTRING( RECKEY, CHARINDEX('-', RECKEY) -1, 1)    
  ,BIRTH = CASE WHEN BIRTH = '11/11/1111' THEN '' ELSE BIRTH END; -- BAP SENT 11/11/1111 AS BIRTHDATE , WITH CONFIRMATION OF SIR GILBERT MAKING THIS EMPTY AS MEANWHILE GILBERT CHECKS WITH BAP        
          
  /*Insert Data to Processing Table - MPI_BAP_NIFS_CHECK_LT; This table will render data on custom form*/        
  INSERT INTO MPI_BAP_NIFS_CHECK_LT ( APPLICATIONID, BATCHNO, INSERTEDON, INSERTEDBY,        
    SOURCE, NAME, ADDRESS, DATEOFBIRTH, SEX, CIVILSTATUS,         
 TIN, SSS_GSIS, BUSINESSNAME, BUSINESSADDRESS, REPORTED,        
 ADVERSEDATE, ADVERSETYPE, LOANTYPE, SECURITY, SECURITYAMOUNT,        
 JOINTACC, BANKNAME, BRANCHNAME, REMARKS, DATEREPORTED, ACCOUNTOPENDATE, ACCOUNTCLOSEDATE, JOINTACCNAME,        
 DATEINCORPORATION, JOINSIGNATORY, CARDNO, CARDBALANCE, CRLIMIT, CARDCANCELATIONDATE, CARDEXTENSION,REC_TYPE_IND )                            
  SELECT         
    APPLICATIONID, @BATCHNUMBER, @CURRENTDATE, 1        
 ,SOURCE --SOURCE        
    ,NAME --NAME                            
    ,ADDRESS --ADDRESS                            
    ,CASE WHEN ISNULL(BIRTH,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( BIRTH AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy') END --DATEOFBIRTH                           
    ,CASE WHEN ISNULL(SEX,' ') = ' ' THEN NULL ELSE SEX END -- SEX                            
  ,CIVILSTAT -- CIVILSTATUS                            
    ,TIN --TIN                            
    ,SSS --SSS_GSIS                            
    ,BUSINESS --BUSINESSNAME                            
    ,BUSADDRS --BUSINESSADDRESS                
    ,CASE WHEN ISNULL(REPORTED,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( REPORTED AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END --REPORTED                     
    ,CASE WHEN ISNULL(negdate,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( negdate AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END  --ADVERSEDATE                
    ,TYPE  --ADVERSETYPE                
    ,LOAN_SALA  --LOANTYPE        
    ,SECU_CASE  --SECURITY                
    ,TRY_CONVERT( DECIMAL ( 30 , 2 ), AMT_LIMIT )--CONVERT (DECIMAL(38,2), REPLACE(AMT_LIMIT,',',''))  --SECURITYAMOUNT                
    ,JOINT  --JOINTACC                
    ,BANK  --BANKNAME                
    ,BRANCH  --BRANCHNAME                
    ,REMARKS  --REMARKS                
    ,CASE WHEN ISNULL(REPORTED,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( REPORTED AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END  --DATEREPORTED                
    ,CASE WHEN ISNULL(negdate,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( negdate AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END--ACCOUNTOPENDATE                
    ,CASE WHEN ISNULL(CLOSEDATE,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( CLOSEDATE AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END--ACCOUNTCLOSEDATE                      
    ,JOINT--JOINTACCNAME                
    ,CASE WHEN ISNULL(INCDATE,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( INCDATE AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END--DATEINCORPORATION                
    ,JOINT--JOINSIGNATORY                
    ,CARD_DATE --END--CARDNO               
    ,TRY_CONVERT( DECIMAL ( 30 , 2 ), CARDBAL )--CONVERT (DECIMAL(38,2), REPLACE(CARDBAL,',',''))--CARDBALANCE                
    ,TRY_CONVERT( DECIMAL ( 30 , 2 ), AMT_LIMIT )--CONVERT (DECIMAL(38,2), REPLACE(AMT_LIMIT,',',''))--CRLIMIT                
    ,CASE WHEN ISNULL(negdate,'')='' THEN NULL ELSE FORMAT(CONVERT(date, PARSE( negdate AS datetime USING 'en-US' ), 101), 'MM/dd/yyyy')END--CARDCANCELATIONDATE                
    ,EXT_PLAINT--CARDEXTENSION 
	,REC_TYPE_IND
  FROM #BAPTEMP WHERE ISNULL(RECKEY, N'') != N''            
        
  SELECT @SUCCESSCOUNT = COUNT(DISTINCT(RECKEY)) FROM #BAPTEMP;                            
        
  ------------------------------------------------- INSERT INTO LOGTABLE ------------------------------------------------                            
  INSERT INTO MPI_BAP_NIFS_RESPONSE_FILE_LOG( RECKEY, SOURCE, NAME, BIRTH, ADDRESS, SPOUSE, SEX, TIN, SSS,        
    CIVILSTAT, BUSINESS, BUSADDRS, BDT, BDTDATE, SEC, SECDATE, REPORTED, BANK, BRANCH,        
 REMARKS, NEGDATE, CLOSEDATE, TYPE, JOINT, LOAN_SALA, AMT_LIMIT, SECU_CASE, CARDBAL,        
 EXT_PLAINT, CARD_DATE, IND1, IND2, INCDATE, LOGDATE, APPLICATIONID, BATCHNUMBER )                                
  SELECT RECKEY, SOURCE, NAME, BIRTH, ADDRESS, SPOUSE, SEX, TIN, SSS,        
    CIVILSTAT, BUSINESS, BUSADDRS, BDT, BDTDATE, SEC, SECDATE, REPORTED, BANK, BRANCH,        
 REMARKS, NEGDATE, CLOSEDATE, TYPE, JOINT, LOAN_SALA, AMT_LIMIT, SECU_CASE, CARDBAL,        
 EXT_PLAINT, CARD_DATE, IND1, IND2, INCDATE, @CURRENTDATE, APPLICATIONID, @BATCHNUMBER        
  FROM #BAPTEMP;        
                                               
  ------------------------ UPDATE APPLICANT AND COBORROWER RECORDS -----------------             
  UPDATE MPI_BAP_NIFS_APPLICATION_DATA SET IS_NO_MATCH = 2 /*HIT*/ WHERE RECORDID IN (SELECT APPLICATIONID FROM #BAPTEMP );      
  UPDATE MPI_BAP_NIFS_APPLICATION_DATA SET IS_NO_MATCH = 1 /*NO MATCH*/ WHERE IS_NO_MATCH = 0 AND DATEDIFF(MINUTE, INSERTEDON , @CURRENTDATE) >= 20;      
      
  UPDATE MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA SET IS_NO_MATCH = 2 /*HIT*/ WHERE RECORDID IN (SELECT APPLICATIONID FROM #BAPTEMP );      
  UPDATE MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA SET IS_NO_MATCH = 1 /*NO MATCH*/ WHERE IS_NO_MATCH = 0 AND DATEDIFF(MINUTE, INSERTEDON , @CURRENTDATE) >= 20;      
    
                          
  UPDATE A2        
     SET A2.APL_EX2_5 = 5 -- NO MATCH                          
  FROM APL_EX2 A2         
  WHERE A2.APL_EX2_ID IN (SELECT RECORDID FROM MPI_BAP_NIFS_APPLICATION_DATA WHERE IS_NO_MATCH = 1);;     
   UPDATE A2        
     SET A2.APL_EX2_5 = 5 -- NO MATCH                          
  FROM APL_EX2 A2         
  WHERE A2.APL_EX2_ID IN (SELECT RECORDID FROM MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA WHERE IS_NO_MATCH = 1);;     
             
  UPDATE A2        
     SET A2.APL_EX2_5 = 5 -- NO MATCH ; "NON" MEANS NO MATCH ON BAP                       
  FROM APL_EX2 A2         
  INNER JOIN #BAPTEMP T ON A2.OWNERID = 985 AND A2.APL_EX2_ID = APPLICATIONID        
  WHERE T.SOURCE = N'NON'      
      
        
  UPDATE A2      
     SET A2.APL_EX2_5 = 2 -- HIT      
  FROM APL_EX2 A2      
  INNER JOIN MPI_BAP_NIFS_APPLICATION_DATA B ON A2.OWNERID = 985 AND RECORDID = APL_EX2_ID      
  WHERE IS_NO_MATCH = 2 /*HIT*/     
      
       
  UPDATE A2      
     SET A2.APL_EX2_5 = 2 -- HIT      
  FROM APL_EX2 A2      
  INNER JOIN MPI_BAP_NIFS_APPLICATION_BUSINESS_DATA B ON A2.OWNERID = 985 AND RECORDID = APL_EX2_ID      
  WHERE IS_NO_MATCH = 2 /*HIT*/     
                          
-------------- UPDATE INVALID/VALID RECORDS COUNT IN CIS_LOG TABLE FOR EASY VISIBILITY ON UI ---------------                                                      
  UPDATE C        
    SET  C.FAILURECOUNT = 0,        
         C.SUCCESSCOUNT = @SUCCESSCOUNT        
  FROM CIS_LOG C        
    WHERE C.OWNERID = @OWNERID        
    AND   C.BATCHNUMBER = @BATCHNUMBER        
    AND   C.SOURCETYPEID = 3        
    AND   C.SOURCEID = @TASKID;                                                      
        
END
GO 







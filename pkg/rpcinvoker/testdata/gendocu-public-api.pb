
?
gendocu/common/types.protogendocu.common*?
ProgrammingLanguage
GO 

TYPESCRIPT

PYTHON
NODE_JS
PHP
JAVA
CPP

CSHARP
DART

KOTLIN	
OBJECTIVE_C

RUBY
GRPCURL
	REST_CURL

JAVASCRIPT"
UNKNOWN_PROGRAMMING_LANGUAGES?*J
SDKProvider
GENDOCU_GITEA 
	PROTOFILE
UNKNOWN_SDK_PROVIDER?bproto3
?
0gendocu/rpc_invoker/v1/rpc_invoker_service.protogendocu.rpc_invoker.v1"?
InvokeMethodRequest

service_id (	R	serviceId
	method_id (	RmethodId 
environment (	Renvironment
body (	Rbody8
headers (2.gendocu.rpc_invoker.v1.HeaderRheaders
build_id (	RbuildId"2
Header
name (	Rname
value (	Rvalue"?
InvokeMethodResponse
response (	Rresponse#
response_code (RresponseCode)
response_message (	RresponseMessage.
request_debug_token (	RrequestDebugToken2w

RpcInvokeri
InvokeMethod+.gendocu.rpc_invoker.v1.InvokeMethodRequest,.gendocu.rpc_invoker.v1.InvokeMethodResponsebproto3
?
,gendocu/sdk_generator/v3/sdk_generator.protogendocu.sdk_generator.v3gendocu/common/types.proto google/protobuf/descriptor.proto"K
Version
major (Rmajor
minor (Rminor
patch (	Rpatch"?
APIDescriptionGeneratorModel;
version (2!.gendocu.sdk_generator.v3.VersionRversion 
description (	Rdescription=
authentication_description (	RauthenticationDescription]
methods (2C.gendocu.sdk_generator.v3.APIDescriptionGeneratorModel.MethodsEntryRmethods`
services (2D.gendocu.sdk_generator.v3.APIDescriptionGeneratorModel.ServicesEntryRservicesW
types (2A.gendocu.sdk_generator.v3.APIDescriptionGeneratorModel.TypesEntryRtypesg
MethodsEntry
key (	RkeyA
value (2+.gendocu.sdk_generator.v3.MethodDescriptionRvalue:8i
ServicesEntry
key (	RkeyB
value (2,.gendocu.sdk_generator.v3.ServiceDescriptionRvalue:8c

TypesEntry
key (	Rkey?
value (2).gendocu.sdk_generator.v3.TypeDescriptionRvalue:8"?
MethodDescription
	method_id (	RmethodId

service_id (	R	serviceId
name (	Rname 
description (	Rdescription*
source_proto_file (	RsourceProtoFile

in_type_id (	RinTypeId
out_type_id (	R	outTypeIdH
include_info (2%.gendocu.sdk_generator.v3.IncludeInfoRincludeInfo!
in_streaming	 (RinStreaming#
out_streaming
 (RoutStreaming"?
IncludeInfo>
sdk_provider (2.gendocu.common.SDKProviderRsdkProvider
	proto_pkg (	RprotoPkg$
go_import_path (	RgoImportPath
go_pkg (	RgoPkg$
ts_import_path (	RtsImportPath
java_pkg (	RjavaPkg

csharp_pkg (	R	csharpPkg"?
ServiceDescription

service_id (	R	serviceId

short_name (	R	shortName
	full_name (	RfullName 
description (	Rdescription*
source_proto_file (	RsourceProtoFileH
include_info (2%.gendocu.sdk_generator.v3.IncludeInfoRincludeInfo"?
TypeDescription
type_id (	RtypeId

short_name (	R	shortName
	full_name	 (	RfullName*
source_proto_file (	RsourceProtoFileH
include_info (2%.gendocu.sdk_generator.v3.IncludeInfoRincludeInfoB
fields (2*.gendocu.sdk_generator.v3.FieldDescriptionRfields 
description (	Rdescription
is_map_type (R	isMapTypeT
enum_description (2).gendocu.sdk_generator.v3.EnumDescriptionRenumDescriptionE
pb_descriptor
 (2 .google.protobuf.DescriptorProtoRpbDescriptor

subtype_of (	R	subtypeOf=
examples (2!.gendocu.sdk_generator.v3.ExampleRexamples"=
Example
default (Rdefault
encoded (	Rencoded"?
EnumDescriptionM
values (25.gendocu.sdk_generator.v3.EnumDescription.ValuesEntryRvalues9
ValuesEntry
key (	Rkey
value (Rvalue:8"?
FieldDescription
name (	Rname
type_id (	RtypeId 
description (	Rdescription
repeated (Rrepeated
required (Rrequired
optional (Roptional
one_of (	RoneOfbproto3
?

3gendocu/sdk_generator/v3/authentication_model.protogendocu.sdk_generator.v3"e
AuthenticationDescriptionH
methods (2..gendocu.sdk_generator.v3.AuthenticationMethodRmethods"?
AuthenticationMethod
id (	Rid
title (	Rtitle 
description (	Rdescriptionc
call_authentication (22.gendocu.sdk_generator.v3.CallAuthenticationMethodRcallAuthenticationl
channel_authentication	 (25.gendocu.sdk_generator.v3.ChannelAuthenticationMethodRchannelAuthenticationJJJJ"j
ChannelAuthenticationMethodA
no_auth (2&.gendocu.sdk_generator.v3.NoAuthSchemeH RnoAuthB
scheme"?
CallAuthenticationMethodA
no_auth (2&.gendocu.sdk_generator.v3.NoAuthSchemeH RnoAuthJ
token_scheme (2%.gendocu.sdk_generator.v3.TokenSchemeH RtokenSchemeB
scheme"?
TokenScheme#
example_value (	RexampleValueD
grpc (20.gendocu.sdk_generator.v3.TokenScheme.gRPCSchemeRgrpcM
grpcweb (23.gendocu.sdk_generator.v3.TokenScheme.gRPCWebSchemeRgrpcwebD
rest (20.gendocu.sdk_generator.v3.TokenScheme.RESTSchemeRrestC

gRPCScheme
meta (	Rmeta!
value_prefix (	RvaluePrefixJ
gRPCWebScheme
header (	Rheader!
value_prefix (	RvaluePrefixG

RESTScheme
header (	Rheader!
value_prefix (	RvaluePrefix"'
NoAuthScheme
no_auth (RnoAuthbproto3
?'
6gendocu/sdk_generator/v3/api_description_service.protogendocu.sdk_generator.v3gendocu/common/types.proto,gendocu/sdk_generator/v3/sdk_generator.proto3gendocu/sdk_generator/v3/authentication_model.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto"~
EnterPasswordRequestJ
selector (2..gendocu.sdk_generator.v3.BuildSelectorRequestRselector
password (	Rpassword"6
EnterPasswordResponse

session_id (	R	sessionId"?
GenerateCodeSampleRequest
build_id (	RbuildId
methods (	Rmethods>
sdk_provider (2.gendocu.common.SDKProviderRsdkProviderN
programming_lang (2#.gendocu.common.ProgrammingLanguageRprogrammingLang1
selected_environment (	RselectedEnvironment8
authentication_method_id (	RauthenticationMethodId1
authentication_token	 (	RauthenticationToken"?
GenerateCodeSampleResponse
code (	Rcoded

highlights (2D.gendocu.sdk_generator.v3.GenerateCodeSampleResponse.HighlightsEntryR
highlights?
method_id_to_rich_highlight (2Q.gendocu.sdk_generator.v3.GenerateCodeSampleResponse.MethodIdToRichHighlightEntryRmethodIdToRichHighlightz
compilation_errors (2K.gendocu.sdk_generator.v3.GenerateCodeSampleResponse.CompilationErrorsEntryRcompilationErrorsN
programming_lang (2#.gendocu.common.ProgrammingLanguageRprogrammingLang
code_output (	R
codeOutput=
HighlightsEntry
key (Rkey
value (Rvalue:8k
MethodIdToRichHighlightEntry
key (	Rkey5
value (2.gendocu.sdk_generator.v3.LinesRvalue:8D
CompilationErrorsEntry
key (Rkey
value (	Rvalue:8"
Lines
line (Rline"?
 GenerateInputCodeSnippetsRequest
build_id (	RbuildId>
sdk_provider (2.gendocu.common.SDKProviderRsdkProviderN
programming_lang (2#.gendocu.common.ProgrammingLanguageRprogrammingLang8
authentication_method_id (	RauthenticationMethodId1
selected_environment (	RselectedEnvironment"?
!GenerateInputCodeSnippetsResponse?
method_id_to_code_snippet (2V.gendocu.sdk_generator.v3.GenerateInputCodeSnippetsResponse.MethodIdToCodeSnippetEntryRmethodIdToCodeSnippetN
programming_lang (2#.gendocu.common.ProgrammingLanguageRprogrammingLang?
method_id_to_code_output (2U.gendocu.sdk_generator.v3.GenerateInputCodeSnippetsResponse.MethodIdToCodeOutputEntryRmethodIdToCodeOutputH
MethodIdToCodeSnippetEntry
key (	Rkey
value (	Rvalue:8G
MethodIdToCodeOutputEntry
key (	Rkey
value (	Rvalue:8"?
BuildSelectorRequest
build_id (	H RbuildIdQ
org_and_name (2-.gendocu.sdk_generator.v3.BuildWithOrgAndNameH R
orgAndNameB
filter"T
BuildWithOrgAndName
api_name (	RapiName"
organization (	Rorganization"?
Build
build_id (	RbuildId"
organization (	Rorganization
api_name (	RapiNameJ
data (26.gendocu.sdk_generator.v3.APIDescriptionGeneratorModelRdataT
sdk_provisioning (2).gendocu.sdk_generator.v3.SDKProvisioningRsdkProvisioningr
authentication_description (23.gendocu.sdk_generator.v3.AuthenticationDescriptionRauthenticationDescription9
envs (2%.gendocu.sdk_generator.v3.EnvironmentRenvs/
default_environment	 (	RdefaultEnvironment/
grpc_repo_source_url
 (	RgrpcRepoSourceUrl$
try_it_enabled (RtryItEnabled

project_id (	R	projectId

sdk_branch (	R	sdkBranch
logo_url( (	RlogoUrlJJ"?
Environment
id (	Ridc
service_grpc_url (29.gendocu.sdk_generator.v3.Environment.ServiceGrpcUrlEntryRserviceGrpcUrll
service_webgrpc_url (2<.gendocu.sdk_generator.v3.Environment.ServiceWebgrpcUrlEntryRserviceWebgrpcUrlA
ServiceGrpcUrlEntry
key (	Rkey
value (	Rvalue:8D
ServiceWebgrpcUrlEntry
key (	Rkey
value (	Rvalue:8"?
SDKProvisioning
	fetch_url (	RfetchUrl
hash (	Rhash.
date (2.google.protobuf.TimestampRdate-
sdk_repo_commit_sha (	RsdkRepoCommitSha*
source_commit_sha (	RsourceCommitSha'
repository_name (	RrepositoryNamel
provisioning_data (2?.gendocu.sdk_generator.v3.SDKProvisioning.ProvisioningDataEntryRprovisioningDatao
ProvisioningDataEntry
key (Rkey@
value (2*.gendocu.sdk_generator.v3.ProvisioningInfoRvalue:8"?
ProvisioningInfo%
repository_url (	RrepositoryUrl
error (	Rerror6
code_snippets_supported (RcodeSnippetsSupported2?
SdkGenerator?
GenerateInputCodeSnippets:.gendocu.sdk_generator.v3.GenerateInputCodeSnippetsRequest;.gendocu.sdk_generator.v3.GenerateInputCodeSnippetsResponse
GenerateCodeSample3.gendocu.sdk_generator.v3.GenerateCodeSampleRequest4.gendocu.sdk_generator.v3.GenerateCodeSampleResponse[
GetBuild..gendocu.sdk_generator.v3.BuildSelectorRequest.gendocu.sdk_generator.v3.Buildp
EnterPassword..gendocu.sdk_generator.v3.EnterPasswordRequest/.gendocu.sdk_generator.v3.EnterPasswordResponseBbZ`git.gendocu.com/ZwgNzRgkZeWNscQDUPC2A7Kh2PB3/GendocuApis3.git/sdk/go/gendocu/sdk_generator/v3;v3bproto3
?
google/api/field_behavior.proto
google.api google/protobuf/descriptor.proto*?
FieldBehavior
FIELD_BEHAVIOR_UNSPECIFIED 
OPTIONAL
REQUIRED
OUTPUT_ONLY

INPUT_ONLY
	IMMUTABLE
UNORDERED_LIST
NON_EMPTY_DEFAULT:`
field_behavior.google.protobuf.FieldOptions? (2.google.api.FieldBehaviorRfieldBehaviorBp
com.google.apiBFieldBehaviorProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations?GAPIbproto3
?
google/api/resource.proto
google.api google/protobuf/descriptor.proto"?
ResourceDescriptor
type (	Rtype
pattern (	Rpattern

name_field (	R	nameField@
history (2&.google.api.ResourceDescriptor.HistoryRhistory
plural (	Rplural
singular (	Rsingular:
style
 (2$.google.api.ResourceDescriptor.StyleRstyle"[
History
HISTORY_UNSPECIFIED 
ORIGINALLY_SINGLE_PATTERN
FUTURE_MULTI_PATTERN"8
Style
STYLE_UNSPECIFIED 
DECLARATIVE_FRIENDLY"F
ResourceReference
type (	Rtype

child_type (	R	childType:l
resource_reference.google.protobuf.FieldOptions? (2.google.api.ResourceReferenceRresourceReference:n
resource_definition.google.protobuf.FileOptions? (2.google.api.ResourceDescriptorRresourceDefinition:\
resource.google.protobuf.MessageOptions? (2.google.api.ResourceDescriptorRresourceBn
com.google.apiBResourceProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations??GAPIbproto3
?
google/api/http.proto
google.api"?
HttpRule
selector (	Rselector
get (	H Rget
put (	H Rput
post (	H Rpost
delete (	H Rdelete
patch (	H Rpatch7
custom (2.google.api.CustomHttpPatternH Rcustom
body (	Rbody#
response_body (	RresponseBodyE
additional_bindings (2.google.api.HttpRuleRadditionalBindingsB	
pattern";
CustomHttpPattern
kind (	Rkind
path (	RpathBj
com.google.apiB	HttpProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations??GAPIbproto3
?
google/api/annotations.proto
google.apigoogle/api/http.proto google/protobuf/descriptor.proto:K
http.google.protobuf.MethodOptions?ʼ" (2.google.api.HttpRuleRhttpBn
com.google.apiBAnnotationsProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations?GAPIbproto3
?
google/api/client.proto
google.api google/protobuf/descriptor.proto:J
method_signature.google.protobuf.MethodOptions? (	RmethodSignature:C
default_host.google.protobuf.ServiceOptions? (	RdefaultHost:C
oauth_scopes.google.protobuf.ServiceOptions? (	RoauthScopesBi
com.google.apiBClientProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations?GAPIbproto3
?
#google/longrunning/operations.protogoogle.longrunninggoogle/api/annotations.protogoogle/api/client.proto google/protobuf/descriptor.proto"Y
OperationInfo#
response_type (	RresponseType#
metadata_type (	RmetadataType:i
operation_info.google.protobuf.MethodOptions? (2!.google.longrunning.OperationInfoRoperationInfoB?
com.google.longrunningBOperationsProtoPZ=google.golang.org/genproto/googleapis/longrunning;longrunning??Google.LongRunning?Google\LongRunningbproto3
?
google/api/routing.proto
google.api google/protobuf/descriptor.proto"Z
RoutingRuleK
routing_parameters (2.google.api.RoutingParameterRroutingParameters"M
RoutingParameter
field (	Rfield#
path_template (	RpathTemplate:T
routing.google.protobuf.MethodOptions?ʼ" (2.google.api.RoutingRuleRroutingBj
com.google.apiBRoutingProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations?GAPIbproto3
?
google/api/visibility.proto
google.api google/protobuf/descriptor.proto"N
VisibilityRule
selector (	Rselector 
restriction (	Rrestriction:d
enum_visibility.google.protobuf.EnumOptions?ʼ" (2.google.api.VisibilityRuleRenumVisibility:k
value_visibility!.google.protobuf.EnumValueOptions?ʼ" (2.google.api.VisibilityRuleRvalueVisibility:g
field_visibility.google.protobuf.FieldOptions?ʼ" (2.google.api.VisibilityRuleRfieldVisibility:m
message_visibility.google.protobuf.MessageOptions?ʼ" (2.google.api.VisibilityRuleRmessageVisibility:j
method_visibility.google.protobuf.MethodOptions?ʼ" (2.google.api.VisibilityRuleRmethodVisibility:e
api_visibility.google.protobuf.ServiceOptions?ʼ" (2.google.api.VisibilityRuleRapiVisibilityBn
com.google.apiBVisibilityProtoPZ?google.golang.org/genproto/googleapis/api/visibility;visibility??GAPIbproto3
?
&google/cloud/extended_operations.protogoogle.cloud google/protobuf/descriptor.proto*b
OperationResponseMapping
	UNDEFINED 
NAME

STATUS

ERROR_CODE
ERROR_MESSAGE:o
operation_field.google.protobuf.FieldOptions? (2&.google.cloud.OperationResponseMappingRoperationField:V
operation_request_field.google.protobuf.FieldOptions? (	RoperationRequestField:X
operation_response_field.google.protobuf.FieldOptions? (	RoperationResponseField:L
operation_service.google.protobuf.MethodOptions?	 (	RoperationService:Y
operation_polling_method.google.protobuf.MethodOptions?	 (RoperationPollingMethodBy
com.google.cloudBExtendedOperationsProtoPZCgoogle.golang.org/genproto/googleapis/cloud/extendedops;extendedops?GAPIbproto3
?8
,protoc-gen-openapiv2/options/openapiv2.proto)grpc.gateway.protoc_gen_openapiv2.optionsgoogle/protobuf/struct.proto"?
Swagger
swagger (	RswaggerC
info (2/.grpc.gateway.protoc_gen_openapiv2.options.InfoRinfo
host (	Rhost
	base_path (	RbasePathK
schemes (21.grpc.gateway.protoc_gen_openapiv2.options.SchemeRschemes
consumes (	Rconsumes
produces (	Rproduces_
	responses
 (2A.grpc.gateway.protoc_gen_openapiv2.options.Swagger.ResponsesEntryR	responsesq
security_definitions (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityDefinitionsRsecurityDefinitionsZ
security (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirementRsecuritye
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocsb

extensions (2B.grpc.gateway.protoc_gen_openapiv2.options.Swagger.ExtensionsEntryR
extensionsq
ResponsesEntry
key (	RkeyI
value (23.grpc.gateway.protoc_gen_openapiv2.options.ResponseRvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8J	J	
J"?
	Operation
tags (	Rtags
summary (	Rsummary 
description (	Rdescriptione
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocs!
operation_id (	RoperationId
consumes (	Rconsumes
produces (	Rproducesa
	responses	 (2C.grpc.gateway.protoc_gen_openapiv2.options.Operation.ResponsesEntryR	responsesK
schemes
 (21.grpc.gateway.protoc_gen_openapiv2.options.SchemeRschemes

deprecated (R
deprecatedZ
security (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirementRsecurityd

extensions (2D.grpc.gateway.protoc_gen_openapiv2.options.Operation.ExtensionsEntryR
extensionsq
ResponsesEntry
key (	RkeyI
value (23.grpc.gateway.protoc_gen_openapiv2.options.ResponseRvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8J	"?
Header 
description (	Rdescription
type (	Rtype
format (	Rformat
default (	Rdefault
pattern (	RpatternJJJJ	J	
J
JJJJJJJ"?
Response 
description (	RdescriptionI
schema (21.grpc.gateway.protoc_gen_openapiv2.options.SchemaRschemaZ
headers (2@.grpc.gateway.protoc_gen_openapiv2.options.Response.HeadersEntryRheaders]
examples (2A.grpc.gateway.protoc_gen_openapiv2.options.Response.ExamplesEntryRexamplesc

extensions (2C.grpc.gateway.protoc_gen_openapiv2.options.Response.ExtensionsEntryR
extensionsm
HeadersEntry
key (	RkeyG
value (21.grpc.gateway.protoc_gen_openapiv2.options.HeaderRvalue:8;
ExamplesEntry
key (	Rkey
value (	Rvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"?
Info
title (	Rtitle 
description (	Rdescription(
terms_of_service (	RtermsOfServiceL
contact (22.grpc.gateway.protoc_gen_openapiv2.options.ContactRcontactL
license (22.grpc.gateway.protoc_gen_openapiv2.options.LicenseRlicense
version (	Rversion_

extensions (2?.grpc.gateway.protoc_gen_openapiv2.options.Info.ExtensionsEntryR
extensionsU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"E
Contact
name (	Rname
url (	Rurl
email (	Remail"/
License
name (	Rname
url (	Rurl"K
ExternalDocumentation 
description (	Rdescription
url (	Rurl"?
SchemaV
json_schema (25.grpc.gateway.protoc_gen_openapiv2.options.JSONSchemaR
jsonSchema$
discriminator (	Rdiscriminator
	read_only (RreadOnlye
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocs
example (	RexampleJ"?


JSONSchema
ref (	Rref
title (	Rtitle 
description (	Rdescription
default (	Rdefault
	read_only (RreadOnly
example	 (	Rexample
multiple_of
 (R
multipleOf
maximum (Rmaximum+
exclusive_maximum (RexclusiveMaximum
minimum (Rminimum+
exclusive_minimum (RexclusiveMinimum

max_length (R	maxLength

min_length (R	minLength
pattern (	Rpattern
	max_items (RmaxItems
	min_items (RminItems!
unique_items (RuniqueItems%
max_properties (RmaxProperties%
min_properties (RminProperties
required (	Rrequired
array" (	Rarray_
type# (2K.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.JSONSchemaSimpleTypesRtype
format$ (	Rformat
enum. (	Renumz
field_configuration? (2H.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.FieldConfigurationRfieldConfiguratione

extensions0 (2E.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.ExtensionsEntryR
extensions<
FieldConfiguration&
path_param_name/ (	RpathParamNameU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"w
JSONSchemaSimpleTypes
UNKNOWN 	
ARRAY
BOOLEAN
INTEGER
NULL

NUMBER

OBJECT

STRINGJJJJJJJJJJ"J%*J*+J+."?
Tag 
description (	Rdescriptione
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocsJ"?
SecurityDefinitionsh
security (2L.grpc.gateway.protoc_gen_openapiv2.options.SecurityDefinitions.SecurityEntryRsecurityv
SecurityEntry
key (	RkeyO
value (29.grpc.gateway.protoc_gen_openapiv2.options.SecuritySchemeRvalue:8"?
SecuritySchemeR
type (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.TypeRtype 
description (	Rdescription
name (	RnameL
in (2<.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.InRinR
flow (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.FlowRflow+
authorization_url (	RauthorizationUrl
	token_url (	RtokenUrlI
scopes (21.grpc.gateway.protoc_gen_openapiv2.options.ScopesRscopesi

extensions	 (2I.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.ExtensionsEntryR
extensionsU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"K
Type
TYPE_INVALID 

TYPE_BASIC
TYPE_API_KEY
TYPE_OAUTH2"1
In

IN_INVALID 
IN_QUERY
	IN_HEADER"j
Flow
FLOW_INVALID 
FLOW_IMPLICIT
FLOW_PASSWORD
FLOW_APPLICATION
FLOW_ACCESS_CODE"?
SecurityRequirement?
security_requirement (2W.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement.SecurityRequirementEntryRsecurityRequirement0
SecurityRequirementValue
scope (	Rscope?
SecurityRequirementEntry
key (	Rkeym
value (2W.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement.SecurityRequirementValueRvalue:8"?
ScopesR
scope (2<.grpc.gateway.protoc_gen_openapiv2.options.Scopes.ScopeEntryRscope8

ScopeEntry
key (	Rkey
value (	Rvalue:8*;
Scheme
UNKNOWN 
HTTP	
HTTPS
WS
WSSBHZFgithub.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/optionsbproto3
?
.protoc-gen-openapiv2/options/annotations.proto)grpc.gateway.protoc_gen_openapiv2.options google/protobuf/descriptor.proto,protoc-gen-openapiv2/options/openapiv2.proto:~
openapiv2_swagger.google.protobuf.FileOptions? (22.grpc.gateway.protoc_gen_openapiv2.options.SwaggerRopenapiv2Swagger:?
openapiv2_operation.google.protobuf.MethodOptions? (24.grpc.gateway.protoc_gen_openapiv2.options.OperationRopenapiv2Operation:~
openapiv2_schema.google.protobuf.MessageOptions? (21.grpc.gateway.protoc_gen_openapiv2.options.SchemaRopenapiv2Schema:u
openapiv2_tag.google.protobuf.ServiceOptions? (2..grpc.gateway.protoc_gen_openapiv2.options.TagRopenapiv2Tag:~
openapiv2_field.google.protobuf.FieldOptions? (25.grpc.gateway.protoc_gen_openapiv2.options.JSONSchemaRopenapiv2FieldBHZFgithub.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/optionsbproto3
?.
 google/protobuf/descriptor.protogoogle.protobuf"?
DescriptorProto
name (	Rname;
field (2%.google.protobuf.FieldDescriptorProtoRfieldC
	extension (2%.google.protobuf.FieldDescriptorProtoR	extensionA
nested_type (2 .google.protobuf.DescriptorProtoR
nestedTypeA
	enum_type (2$.google.protobuf.EnumDescriptorProtoRenumTypeX
extension_range (2/.google.protobuf.DescriptorProto.ExtensionRangeRextensionRangeD

oneof_decl (2%.google.protobuf.OneofDescriptorProtoR	oneofDecl9
options (2.google.protobuf.MessageOptionsRoptionsU
reserved_range	 (2..google.protobuf.DescriptorProto.ReservedRangeRreservedRange#
reserved_name
 (	RreservedNamez
ExtensionRange
start (Rstart
end (Rend@
options (2&.google.protobuf.ExtensionRangeOptionsRoptions7
ReservedRange
start (Rstart
end (Rend"|
ExtensionRangeOptionsX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
FieldDescriptorProto
name (	Rname
number (RnumberA
label (2+.google.protobuf.FieldDescriptorProto.LabelRlabel>
type (2*.google.protobuf.FieldDescriptorProto.TypeRtype
	type_name (	RtypeName
extendee (	Rextendee#
default_value (	RdefaultValue
oneof_index	 (R
oneofIndex
	json_name
 (	RjsonName7
options (2.google.protobuf.FieldOptionsRoptions'
proto3_optional (Rproto3Optional"?
Type
TYPE_DOUBLE

TYPE_FLOAT

TYPE_INT64
TYPE_UINT64

TYPE_INT32
TYPE_FIXED64
TYPE_FIXED32
	TYPE_BOOL
TYPE_STRING	

TYPE_GROUP

TYPE_MESSAGE

TYPE_BYTES
TYPE_UINT32
	TYPE_ENUM
TYPE_SFIXED32
TYPE_SFIXED64
TYPE_SINT32
TYPE_SINT64"C
Label
LABEL_OPTIONAL
LABEL_REQUIRED
LABEL_REPEATED"c
OneofDescriptorProto
name (	Rname7
options (2.google.protobuf.OneofOptionsRoptions"?
EnumDescriptorProto
name (	Rname?
value (2).google.protobuf.EnumValueDescriptorProtoRvalue6
options (2.google.protobuf.EnumOptionsRoptions]
reserved_range (26.google.protobuf.EnumDescriptorProto.EnumReservedRangeRreservedRange#
reserved_name (	RreservedName;
EnumReservedRange
start (Rstart
end (Rend"?
EnumValueDescriptorProto
name (	Rname
number (Rnumber;
options (2!.google.protobuf.EnumValueOptionsRoptions"?	
FileOptions!
java_package (	RjavaPackage0
java_outer_classname (	RjavaOuterClassname5
java_multiple_files
 (:falseRjavaMultipleFilesD
java_generate_equals_and_hash (BRjavaGenerateEqualsAndHash:
java_string_check_utf8 (:falseRjavaStringCheckUtf8S
optimize_for	 (2).google.protobuf.FileOptions.OptimizeMode:SPEEDRoptimizeFor

go_package (	R	goPackage5
cc_generic_services (:falseRccGenericServices9
java_generic_services (:falseRjavaGenericServices5
py_generic_services (:falseRpyGenericServices7
php_generic_services* (:falseRphpGenericServices%

deprecated (:falseR
deprecated.
cc_enable_arenas (:trueRccEnableArenas*
objc_class_prefix$ (	RobjcClassPrefix)
csharp_namespace% (	RcsharpNamespace!
swift_prefix' (	RswiftPrefix(
php_class_prefix( (	RphpClassPrefix#
php_namespace) (	RphpNamespace4
php_metadata_namespace, (	RphpMetadataNamespace!
ruby_package- (	RrubyPackageX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption":
OptimizeMode	
SPEED
	CODE_SIZE
LITE_RUNTIME*	?????J&'"?
MessageOptions<
message_set_wire_format (:falseRmessageSetWireFormatL
no_standard_descriptor_accessor (:falseRnoStandardDescriptorAccessor%

deprecated (:falseR
deprecated
	map_entry (RmapEntryX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????J	J	
"?
FieldOptionsA
ctype (2#.google.protobuf.FieldOptions.CType:STRINGRctype
packed (RpackedG
jstype (2$.google.protobuf.FieldOptions.JSType:	JS_NORMALRjstype
lazy (:falseRlazy%

deprecated (:falseR
deprecated
weak
 (:falseRweakX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"/
CType

STRING 
CORD
STRING_PIECE"5
JSType
	JS_NORMAL 
	JS_STRING
	JS_NUMBER*	?????J"s
OneofOptionsX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
EnumOptions
allow_alias (R
allowAlias%

deprecated (:falseR
deprecatedX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????J"?
EnumValueOptions%

deprecated (:falseR
deprecatedX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
ServiceOptions%

deprecated! (:falseR
deprecatedX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
MethodOptions%

deprecated! (:falseR
deprecatedq
idempotency_level" (2/.google.protobuf.MethodOptions.IdempotencyLevel:IDEMPOTENCY_UNKNOWNRidempotencyLevelX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"P
IdempotencyLevel
IDEMPOTENCY_UNKNOWN 
NO_SIDE_EFFECTS

IDEMPOTENT*	?????"?
UninterpretedOptionA
name (2-.google.protobuf.UninterpretedOption.NamePartRname)
identifier_value (	RidentifierValue,
positive_int_value (RpositiveIntValue,
negative_int_value (RnegativeIntValue!
double_value (RdoubleValue!
string_value (RstringValue'
aggregate_value (	RaggregateValueJ
NamePart
	name_part (	RnamePart!
is_extension (RisExtensionB?
com.google.protobufBDescriptorProtosHZ>github.com/golang/protobuf/protoc-gen-go/descriptor;descriptor??GPB?Google.Protobuf.Reflection
?
google/protobuf/struct.protogoogle.protobuf"?
Struct;
fields (2#.google.protobuf.Struct.FieldsEntryRfieldsQ
FieldsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"?
Value;

null_value (2.google.protobuf.NullValueH R	nullValue#
number_value (H RnumberValue#
string_value (	H RstringValue

bool_value (H R	boolValue<
struct_value (2.google.protobuf.StructH RstructValue;

list_value (2.google.protobuf.ListValueH R	listValueB
kind";
	ListValue.
values (2.google.protobuf.ValueRvalues*
	NullValue

NULL_VALUE B?
com.google.protobufBStructProtoPZ1github.com/golang/protobuf/ptypes/struct;structpb??GPB?Google.Protobuf.WellKnownTypesbproto3
?
google/protobuf/timestamp.protogoogle.protobuf";
	Timestamp
seconds (Rseconds
nanos (RnanosB~
com.google.protobufBTimestampProtoPZ+github.com/golang/protobuf/ptypes/timestamp??GPB?Google.Protobuf.WellKnownTypesbproto3
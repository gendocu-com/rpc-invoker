
?
service.protogendocu.example.library_appgoogle/protobuf/empty.protogoogle/api/annotations.proto"M
DeleteBookRequest
isbn (	H Risbn
title (	H RtitleB

selector"K
ListBookResponse7
books (2!.gendocu.example.library_app.BookRbooks"m
Book
isbn (	Risbn
title (	Rtitle;
author (2#.gendocu.example.library_app.AuthorRauthor"D
Author

first_name (	R	firstName
	last_name (	RlastName2?
BookServiceb
	ListBooks.google.protobuf.Empty-.gendocu.example.library_app.ListBookResponse"????/booksu

DeleteBook..gendocu.example.library_app.DeleteBookRequest!.gendocu.example.library_app.Book"????*/book/{isbn}d

CreateBook!.gendocu.example.library_app.Book!.gendocu.example.library_app.Book"????
:*"/bookbproto3
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
?
#google/longrunning/operations.protogoogle.longrunninggoogle/api/annotations.protogoogle/api/client.protogoogle/protobuf/empty.proto google/protobuf/descriptor.proto"Y
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
?
 google/protobuf/descriptor.protogoogle.protobuf"?	
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
	JS_NUMBER*	?????J"?
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
?
google/protobuf/empty.protogoogle.protobuf"
EmptyBv
com.google.protobufB
EmptyProtoPZ'github.com/golang/protobuf/ptypes/empty??GPB?Google.Protobuf.WellKnownTypesbproto3
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
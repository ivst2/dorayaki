-module(dorayaki_avp_mapper).
  
-export([num_to_name/1]).
-export([name_to_num/1]).
-export([num_to_type/1]).

-include("lib.hrl").


num_to_name(Num) ->
io:format("Got Num: ~w~n", [Num]), 
AVP_list = [
{85, 	'Acct-Interim-Interval'},
{483, 	'Accounting-Realtime-Required'},
{50, 	'Acct-Multi-Session-Id'},
{485,	'Accounting-Record-Number'},
{480, 	'Accounting-Record-Type'},
{44,	'Accounting-Session-Id'},
{287,	'Accounting-Sub-Session-Id'},
{259,	'Acct-Application-Id'},
{258,	'Auth-Application-Id'},
{274,	'Auth-Request-Type'},
{291,	'Authorization-Lifetime'},
{276,	'Auth-Grace-Period'},
{277,	'Auth-Session-State'},
{285,	'Re-Auth-Request-Type'},
{25,	'Class'},
{293,	'Destination-Host'},
{283,	'Destination-Realm'},
{273,	'Disconnect-Cause'},
{300,	'E2E-Sequence'},
{281,	'Error-Message'},
{294,	'Error-Reporting-Host'},
{55,	'Event-Timestamp'},
{297,	'Experimental-Result'},
{298,	'Experimental-Result-Code'},
{279,	'Failed-AVP'},
{267,	'Firmware-Revision'},
{257,	'Host-IP-Address'},
{299,	'Inband-Security-Id'},
{272,	'Multi-Round-Time-Out'},
{264,	'Origin-Host'},
{296,	'Origin-Realm'},
{278,	'Origin-State-Id'},
{269,	'Product-Name'},
{280,	'Proxy-Host'},
{284,	'Proxy-Info'},
{33,	'Proxy-State'},
{292,	'Redirect-Host'},
{261,	'Redirect-Host-Usage'},
{262,	'Redirect-Max-Cache-Time'},
{268,	'Result-Code'},
{282,	'Route-Record'},
{263,	'Session-Id'},
{27,	'Session-Timeout'},
{270,	'Session-Binding'},
{271,	'Session-Server-Failover'},
{265,	'Supported-Vendor-Id'},
{295,	'Termination-Cause'},
{1,		'User-Name'},
{266,	'Vendor-Id'},
{260,	'Vendor-Specific-Application-Id'},
{443,	'Subscription-Id'},
{415,	'CC-Request-Number'},
{416,	'CC-Request-Type'},
{431,	'Granted-Service-Unit'},
{432,	'Rating-Group'},
{439, 	'Service-Identifier'},
{869,	'Volume-Quota-Threshold'},
{448,	'Validity-Time'},
{456,	'Multiple-Services-Credit-Control'}],
 	D = dict:from_list(AVP_list),
 	V = dict:find(Num, D),
 	V.


name_to_num(Name) ->
io:format("Got Name: ~w~n", [Name]),
% Define AVP and Message types
AVP_list = [
{'Acct-Interim-Interval',               85},
{'Accounting-Realtime-Required',  483},
{'Acct-Multi-Session-Id',   50},
{'Accounting-Record-Number',   485},
{'Accounting-Record-Type',  480},
{'Accounting-Session-Id',   44},
{'Accounting-Sub-Session-Id',  287},
{'Acct-Application-Id',  259},
{'Auth-Application-Id',  258},
{'Auth-Request-Type', 274},
{'Authorization-Lifetime',  291},
{'Auth-Grace-Period', 276},
{'Auth-Session-State',   277},
{'Re-Auth-Request-Type', 285},
{'Class', 25},
{'Destination-Host',  293},
{'Destination-Realm', 283},
{'Disconnect-Cause',  273},
{'E2E-Sequence',   300},
{'Error-Message',  281},
{'Error-Reporting-Host', 294},
{'Event-Timestamp',   55},
{'Experimental-Result',  297},
{'Experimental-Result-Code',   298},
{'Failed-AVP',  279},
{'Firmware-Revision', 267},
{'Host-IP-Address',   257},
{'Inband-Security-Id',   299},
{'Multi-Round-Time-Out', 272},
{'Origin-Host', 264},
{'Origin-Realm',   296},
{'Origin-State-Id',   278},
{'Product-Name',   269},
{'Proxy-Host',  280},
{'Proxy-Info',  284},
{'Proxy-State', 33},
{'Redirect-Host',  292},
{'Redirect-Host-Usage',  261},
{'Redirect-Max-Cache-Time', 262},
{'Result-Code', 268},
{'Route-Record',   282},
{'Session-Id',  263},
{'Session-Timeout',   27},
{'Session-Binding',   270},
{'Session-Server-Failover', 271},
{'Supported-Vendor-Id',  265},
{'Termination-Cause', 295},
{'User-Name',   1},
{'Vendor-Id',   266},
{'Vendor-Specific-Application-Id',   260},
{'Subscription-Id', 		443},
{'CC-Request-Number',		415},
{'CC-Request-Type',		416},
{'Granted-Service-Unit',		431},
{'Rating-Group',		432},
{'Service-Identifier',		439},
{'Volume-Quota-Threshold',		869},
{'Validity-Time',		448},
{'Multiple-Services-Credit-Control', 456}],

	D = dict:from_list(AVP_list),
	V = dict:find(Name, D),
	V.

num_to_type(Num) ->
io:format("Got Num: ~w~n", [Num]),
AVP_TYPE = [
{1, ?UTF8String},
{3, ?Grouped},
{25, ?OctetString},
{27, ?Unsigned32},
{33, ?OctetString},
{44, ?OctetString},
{50, ?UTF8String},
{55, ?Time},
{85, ?Unsigned32},
{257, ?Address},
{258, ?Unsigned32},
{259, ?Unsigned32},
{260, ?Grouped},
{261, ?Enumerated},
{262, ?Unsigned32},
{263, ?UTF8String},
{264, ?DiamIdent},
{265, ?Unsigned32},
{266, ?Unsigned32},
{267, ?Unsigned32},
{268, ?Unsigned32},
{269, ?UTF8String},
{270, ?Unsigned32},
{271, ?Enumerated},
{272, ?Unsigned32},
{273, ?Enumerated},
{274, ?Enumerated},
{276, ?Unsigned32},
{277, ?Enumerated},
{278, ?Unsigned32},
{279, ?Grouped},
{280, ?DiamIdent},
{281, ?UTF8String},
{282, ?DiamIdent},
{283, ?DiamIdent},
{284, ?Grouped},
{285, ?Enumerated},
{287, ?Unsigned64},
{291, ?Unsigned32},
{292, ?DiamURI},
{293, ?DiamIdent},
{294, ?DiamIdent},
{295, ?Enumerated},
{296, ?DiamIdent},
{297, ?Grouped},
{298, ?Unsigned32},
{299, ?Unsigned32},
{480, ?Enumerated},
{483, ?Enumerated},
{485, ?Unsigned32}],
	
	D = dict:from_list(AVP_TYPE),
	V = dict:find(Num, D),
	io:format("V is ~p~n", [V]),
	V.

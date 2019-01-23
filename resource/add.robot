*** Keywords ***

Add new city
	[Arguments]	${name}  ${state}  ${country}  ${map}
	${ss}=  Get Session
	&{payload}=  Create Dictionary  name=${name}  state=${state}  country=${country}  map=${map}
	${resp}=  Post Request  ss  ${city_url}  json=${payload}
	Should Be Equal As Strings  ${resp.status_code}  201
	${jsondata}=  To Json  ${resp.content}	
	${cityref}=    Get Value From Json  ${jsondata}  $.._links.city.href
	[Return]  ${cityref}[0]


Add new hotel
	[Arguments]	${name}  ${address}  ${zip}  ${cityid}
	${ss}=  Get Session
	&{payload}=  Create Dictionary  name=${name}  address=${address}  zip=${zip}  city=${cityid}
	${resp}=  Post Request  ss  ${hotel_url}  json=${payload}
	Log To Console  ${resp.content}


Get Session
	${session}=  Create Session  ss  ${base_url}
	[Return]  ${session}

*** Settings ***
Documentation    Sample API Test
Library     REST

*** Variables ***

${url}          http://23.96.20.19/cph
${auth}         ew0KICAiYWxnIjogIkhTMjU2Ig0KfQ.ew0KICAiSUQiOiAiZm9yZF8xIiwNCiAgImlzcyI6ICJNaWNyb24iLA0KICAiZXhwIjogMzMyNTY1NDc3NjAwNiwNCiAgImlhdCI6IDE1NTkwNDc2MzEsDQogICJvcGVyYXRpb25zIjogWw0KICAgIHsNCiAgICAgICJvcGVyYXRpb24iOiAiR2V0IE5vbmNlIiwNCiAgICAgICJvcGVyYXRpb25FeHAiOiAzMzI1NjU0Nzc2MDA2DQogICAgfSwNCiAgICB7DQogICAgICAib3BlcmF0aW9uIjogIlZlcmlmeSBSZXF1ZXN0IFVJRCIsDQogICAgICAib3BlcmF0aW9uRXhwIjogMzMyNTY1NDc3NjAwNg0KICAgIH0sDQogICAgew0KICAgICAgIm9wZXJhdGlvbiI6ICJQcm92aXNpb25fQ1JUTSIsDQogICAgICAib3BlcmF0aW9uRXhwIjogMzMyNTY1NDc3NjAwNg0KICAgIH0sDQoJICAgIHsNCiAgICAgICJvcGVyYXRpb24iOiAiUmVwbGFjZV9TUksiLA0KICAgICAgIm9wZXJhdGlvbkV4cCI6IDMzMjU2NTQ3NzYwMDYNCiAgICB9LA0KCSAgICB7DQogICAgICAib3BlcmF0aW9uIjogIkRlcHJvdmlzaW9uIiwNCiAgICAgICJvcGVyYXRpb25FeHAiOiAzMzI1NjU0Nzc2MDA2DQogICAgfSwNCgkgICAgew0KICAgICAgIm9wZXJhdGlvbiI6ICJSZWdpc3RlclJXIiwNCiAgICAgICJvcGVyYXRpb25FeHAiOiAzMzI1NjU0Nzc2MDA2DQogICAgfSwNCgkgICAgew0KICAgICAgIm9wZXJhdGlvbiI6ICJHZXQga2V5IGJ5IFVJRCIsDQogICAgICAib3BlcmF0aW9uRXhwIjogMzMyNTY1NDc3NjAwNg0KICAgIH0sDQoJew0KICAgICAgIm9wZXJhdGlvbiI6ICJHZXQga2V5cyBieSBCYXRjaCBJRCIsDQogICAgICAib3BlcmF0aW9uRXhwIjogMzMyNTY1NDc3NjAwNg0KICAgIH0NCgkNCiAgXQ0KfQ.pU4_oz1HJg62SZYTpBLmSDaPGvevqYHXm2nUlSg4iPY
${accept}       application/vnd.kmsgateway.rambus.v1+json
${content}      application/json
${url_post}     http://23.96.20.19/das/Micron/Naxos/devices


*** Test Cases ***
Get Nonce
    [Tags]    DEBUG
    Check NONCE

Check Naxos Devices

    Check device details

*** Keywords ***

Check NONCE

    ${header}       create dictionary       Authorization=Bearer ${auth}        Accept=${accept}        Content-Type=${content}
#    Create Session          test    ${url}      headers=${header}
    ${output}       get      ${url}/nonce/      headers=${header}
    Log         ${output}


Check device details
    ${accept1}   set variable  application/vnd.kms.rambus.v1+json
    ${input_data}       input    ${CURDIR}/payload.json
    ${header}       create dictionary     Accept=${accept1}        Content-Type=${content}
    ${output}       POST	${url_post} 	body=${input_data}      headers=${header}
    Log         ${output}
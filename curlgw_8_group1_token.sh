#!/bin/bash
TOKEN_GROUP=$(curl https://raw.githubusercontent.com/istio/istio/release-1.5/security/tools/jwt/samples/groups-scope.jwt -s) && echo $TOKEN_GROUP | cut -d '.' -f2 - | base64 -d -
echo ""
echo "CURL FROM sleep" 
echo "curl http://httpbin.foo:8000/headers -s -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkRIRmJwb0lVcXJZOHQyenBBMnFYZkNtcjVWTzVaRXI0UnpIVV8tZW52dlEiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjM1MzczOTExMDQsImdyb3VwcyI6WyJncm91cDEiLCJncm91cDIiXSwiaWF0IjoxNTM3MzkxMTA0LCJpc3MiOiJ0ZXN0aW5nQHNlY3VyZS5pc3Rpby5pbyIsInNjb3BlIjpbInNjb3BlMSIsInNjb3BlMiJdLCJzdWIiOiJ0ZXN0aW5nQHNlY3VyZS5pc3Rpby5pbyJ9.EdJnEZSH6X8hcyEii7c8H5lnhgjB5dwo07M5oheC8Xz8mOllyg--AHCFWHybM48reunF--oGaG6IXVngCEpVF0_P5DwsUoBgpPmK1JOaKN6_pe9sh0ZwTtdgK_RP01PuI7kUdbOTlkuUi2AO-qUyOm7Art2POzo36DLQlUXv8Ad7NBOqfQaKjE9ndaPWT7aexUsBHxmgiGbz1SyLH879f7uHYPbPKlpHU6P9S-DaKnGLaEchnoKnov7ajhrEhGXAQRukhDPKUHO9L30oPIr5IJllEQfHYtt6IZvlNUGeLUcif3wpry1R5tBXRicx2sXMQ7LyuDremDbcNy_iE76Upg""
kubectl exec $(kubectl get pod -l app=sleep -n foo -o jsonpath={.items..metadata.name}) -c sleep -n foo -- curl "http://httpbin.foo:8000/headers" -s -o /dev/null -H "Authorization: Bearer $TOKEN_GROUP" -w "%{http_code}\n"

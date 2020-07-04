#!/bin/bash


# External ip : a90eadce4b5d04fd080bd6dd7441783b-799888800.us-west-2.elb.amazonaws.com

host01=$1
port=$2
email=$3
pass=$4
 
if [[ -z "$1" ]]; then host01="a90eadce4b5d04fd080bd6dd7441783b-799888800.us-west-2.elb.amazonaws.com"; fi
if [[ -z "$2" ]]; then port="80";  fi  
if [[ -z "$3" ]]; then email="slim@g.com";  fi 
if [[ -z "$4" ]]; then pass="12345";  fi  

hopo=$host01:$port

#cmd01
curl $hopo; echo ""

#cmd02
export TOKEN=`curl -d '{"email":"'$email'","password":"'$pass'"}' -H "Content-Type: application/json" -X POST $hopo/auth  | jq -r '.token'`
echo $TOKEN
echo ""

#cmd03
curl -X GET $hopo/contents -H "Authorization: Bearer ${TOKEN}" | jq .


#
# docker build --tag jwt-api-test .
# docker run --rm  --name jat01  --env-file env_file -p 8000:8080 jwt-api-test
# slimed@slixPC:~$ kubectl get svc simple-jwt-api -o wide
#NAME           TYPE         CLUSTER-IP     EXTERNAL-IP                                                            PORT(S)      AGE SELECTOR
#simple-jwt-api LoadBalancer 10.100.160.183 a90eadce4b5d04fd080bd6dd7441783b-799888800.us-west-2.elb.amazonaws.com 80:31530/TCP 25h app=simple-jwt-api



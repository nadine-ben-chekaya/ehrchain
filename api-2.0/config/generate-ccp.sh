#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    local PP1=$(one_line_pem $6)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        -e "s#\${PEERPEM1}#$PP1#" \
        -e "s#\${P0PORT1}#$7#" \
        ./ccp-template.json
}

ORG="hospital1"
P0PORT=7051
CAPORT=7054
P0PORT1=8051
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/hospital1.healthnet.com/peers/peer0.hospital1.healthnet.com/msp/tlscacerts/tlsca.hospital1.healthnet.com-cert.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/hospital1.healthnet.com/peers/peer1.hospital1.healthnet.com/msp/tlscacerts/tlsca.hospital1.healthnet.com-cert.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/hospital1.healthnet.com/msp/tlscacerts/tlsca.hospital1.healthnet.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-hospital1.json


ORG="hospital2"
P0PORT=9051
CAPORT=8054
P0PORT1=10051
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/hospital2.healthnet.com/peers/peer0.hospital2.healthnet.com/msp/tlscacerts/tlsca.hospital2.healthnet.com-cert.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/hospital2.healthnet.com/peers/peer1.hospital2.healthnet.com/msp/tlscacerts/tlsca.hospital2.healthnet.com-cert.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/hospital2.healthnet.com/msp/tlscacerts/tlsca.hospital2.healthnet.com-cert.pem


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-hospital2.json

ORG="patients"
P0PORT=11051
CAPORT=9054
P0PORT1=12051
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/patients.healthnet.com/peers/peer0.patients.healthnet.com/msp/tlscacerts/tlsca.patients.healthnet.com-cert.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/patients.healthnet.com/peers/peer1.patients.healthnet.com/msp/tlscacerts/tlsca.patients.healthnet.com-cert.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/patients.healthnet.com/msp/tlscacerts/tlsca.patients.healthnet.com-cert.pem


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-patients.json
export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/healthnet.com/orderers/orderer.healthnet.com/msp/tlscacerts/tlsca.healthnet.com-cert.pem
export PEER0_HOSPITAL1_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/hospital1.healthnet.com/peers/peer0.hospital1.healthnet.com/tls/ca.crt
export PEER0_HOSPITAL2_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/hospital2.healthnet.com/peers/peer0.hospital2.healthnet.com/tls/ca.crt
export PEER0_PATIENTS_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/patients.healthnet.com/peers/peer0.patients.healthnet.com/tls/ca.crt
export PEER0_LABORATORY_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/laboratory.healthnet.com/peers/peer0.laboratory.healthnet.com/tls/ca.crt
export PEER0_INSURANCE_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/insurance.healthnet.com/peers/peer0.insurance.healthnet.com/tls/ca.crt
export FABRIC_CFG_PATH=${PWD}/artifacts/channel/config/

export CHANNEL_NAME=myehrchannel

setGlobalsForOrderer(){
    export CORE_PEER_LOCALMSPID="OrdererMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/healthnet.com/orderers/orderer.healthnet.com/msp/tlscacerts/tlsca.healthnet.com-cert.pem
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/healthnet.com/users/Admin@healthnet.com/msp
    
}

setGlobalsForPeer0Hospital1(){
    export CORE_PEER_LOCALMSPID="Hospital1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_HOSPITAL1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/hospital1.healthnet.com/users/Admin@hospital1.healthnet.com/msp
    export CORE_PEER_ADDRESS=localhost:7051
}

setGlobalsForPeer1Hospital1(){
    export CORE_PEER_LOCALMSPID="Hospital1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_HOSPITAL1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/hospital1.healthnet.com/users/Admin@hospital1.healthnet.com/msp
    export CORE_PEER_ADDRESS=localhost:8051
    
}

setGlobalsForPeer0Hospital2(){
    export CORE_PEER_LOCALMSPID="Hospital2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_HOSPITAL2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/hospital2.healthnet.com/users/Admin@hospital2.healthnet.com/msp
    export CORE_PEER_ADDRESS=localhost:9051
    
}

setGlobalsForPeer1Hospital2(){
    export CORE_PEER_LOCALMSPID="Hospital2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_HOSPITAL2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/hospital2.healthnet.com/users/Admin@hospital2.healthnet.com/msp
    export CORE_PEER_ADDRESS=localhost:10051
    
}

setGlobalsForPeer0Patients(){
    export CORE_PEER_LOCALMSPID="PatientsMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PATIENTS_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/patients.healthnet.com/users/Admin@patients.healthnet.com/msp
    export CORE_PEER_ADDRESS=localhost:11051
}

setGlobalsForPeer1Patients(){
    export CORE_PEER_LOCALMSPID="PatientsMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PATIENTS_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/patients.healthnet.com/users/Admin@patients.healthnet.com/msp
    export CORE_PEER_ADDRESS=localhost:12051
    
}

setGlobalsForPeer0Laboratory(){
    export CORE_PEER_LOCALMSPID="LaboratoryMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_LABORATORY_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/laboratory.healthnet.com/users/Admin@laboratory.healthnet.com/msp
    export CORE_PEER_ADDRESS=localhost:13051
    
}

setGlobalsForPeer1Laboratory(){
    export CORE_PEER_LOCALMSPID="LaboratoryMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_LABORATORY_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/laboratory.healthnet.com/users/Admin@laboratory.healthnet.com/msp
    export CORE_PEER_ADDRESS=localhost:14051
    
}

setGlobalsForPeer0Insurance(){
    export CORE_PEER_LOCALMSPID="InsuranceMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_INSURANCE_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/insurance.healthnet.com/users/Admin@insurance.healthnet.com/msp
    export CORE_PEER_ADDRESS=localhost:15051
    
}

setGlobalsForPeer1Insurance(){
    export CORE_PEER_LOCALMSPID="InsuranceMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_INSURANCE_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/insurance.healthnet.com/users/Admin@insurance.healthnet.com/msp
    export CORE_PEER_ADDRESS=localhost:16051
    
}

createChannel(){
    rm -rf ./channel-artifacts/*
    setGlobalsForPeer0Hospital1
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME \
    --ordererTLSHostnameOverride orderer.healthnet.com \
    -f ./artifacts/channel/${CHANNEL_NAME}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

removeOldCrypto(){
    rm -rf ./api-1.4/crypto/*
    rm -rf ./api-1.4/fabric-client-kv-org1/*
    rm -rf ./api-2.0/org1-wallet/*
    rm -rf ./api-2.0/org2-wallet/*
}


joinChannel(){
    export FABRIC_CFG_PATH=${PWD}/artifacts/channel/config/
    setGlobalsForPeer0Hospital1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1Hospital1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer0Hospital2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1Hospital2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0Patients
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1Patients
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0Laboratory
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1Laboratory
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0Insurance
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1Insurance
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
}

updateAnchorPeers(){
    setGlobalsForPeer0Hospital1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.healthnet.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0Hospital2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.healthnet.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0Patients
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.healthnet.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0Laboratory
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.healthnet.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0Insurance
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.healthnet.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

}

networkDown(){

    #supprimer tous les conteneurs arrêtés et toutes les images non utilisées
    docker system prune -a
    # stop then remove all the containers
    docker stop $(docker ps -a -q)
    docker rm -f $(docker ps -qa)
    #remove all the Docker images 
    docker rmi -f $(docker images -aq)
    #suppression de volumes en suspens
    docker volume prune

    rm -rf ./channel-artifacts/*
    rm -rf ./artifacts/channel/crypto-config
    rm -rf ./artifacts/channel/genesis.block
    rm -rf ./artifacts/channel/Hospital1MSPanchors.tx
    rm -rf ./artifacts/channel/Hospital2MSPanchors.tx
    rm -rf ./artifacts/channel/InsuranceMSPanchors.tx
    rm -rf ./artifacts/channel/LaboratoryMSPanchors.tx 
    rm -rf ./artifacts/channel/PatientsMSPanchors.tx
    rm -rf ./artifacts/channel/ehrchainchannel.tx
    rm -rf ./artifacts/src/github.com/patients/go/vendor
    rm -rf ./artifacts/src/github.com/patients/go/go.sum
    rm -rf ./patients.tar.gz

}

#removeOldCrypto
#docker exec -it peer0.hospital1.healthnet.com sh

createChannel
joinChannel
updateAnchorPeers
# networkDown

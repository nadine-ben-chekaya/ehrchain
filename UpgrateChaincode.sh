export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/healthnet.com/orderers/orderer.healthnet.com/msp/tlscacerts/tlsca.healthnet.com-cert.pem
export PEER0_HOSPITAL1_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/hospital1.healthnet.com/peers/peer0.hospital1.healthnet.com/tls/ca.crt
export PEER0_HOSPITAL2_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/hospital2.healthnet.com/peers/peer0.hospital2.healthnet.com/tls/ca.crt
export PEER0_PATIENTS_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/patients.healthnet.com/peers/peer0.patients.healthnet.com/tls/ca.crt
export PEER0_LABORATORY_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/laboratory.healthnet.com/peers/peer0.laboratory.healthnet.com/tls/ca.crt
export PEER0_INSURANCE_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/insurance.healthnet.com/peers/peer0.insurance.healthnet.com/tls/ca.crt
export FABRIC_CFG_PATH=/home/nadineben/fabric/myhealthapp/artifacts/channel/config

export CHANNEL_NAME=mychannel

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

presetup(){
    echo Vendoring Go dependencies ...
    pushd ./artifacts/src/github.com/patients/go
    GO111MODULE=on go mod vendor
    popd
    echo Finished vendoring Go dependencies
    # echo Vendoring Go dependencies ...
    # pushd ./artifacts/src/github.com/fabcar/go
    # GO111MODULE=on go mod vendor
    # popd
    # echo Finished vendoring Go dependencies
}
#presetup

# CHANNEL_NAME="mychannel"
# CC_RUNTIME_LANGUAGE="golang"
# VERSION="1"
# CC_SRC_PATH="./artifacts/src/github.com/fabcar/go/"
# CC_NAME="fabcar"
CHANNEL_NAME="mychannel"
CC_RUNTIME_LANGUAGE="golang"
VERSION="2"
CC_SRC_PATH="./artifacts/src/github.com/patients/go"
CC_NAME="patients"

packageChaincode(){
    rm -rf ${CC_NAME}.tar.gz
    setGlobalsForPeer0Hospital1
    peer lifecycle chaincode package ${CC_NAME}.tar.gz --path ${CC_SRC_PATH} --lang ${CC_RUNTIME_LANGUAGE} --label ${CC_NAME}_${VERSION}
    echo "===================== Chaincode is packaged on peer0.hospital1 ===================== "
}
#packageChaincode
installChaincode(){
    
    setGlobalsForPeer0Hospital1
    echo "pass"
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.hospital1 ===================== "
    
    setGlobalsForPeer1Hospital1
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer1.hospital1 ===================== "
    
    setGlobalsForPeer0Hospital2
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.hospital2 ===================== "
    
    setGlobalsForPeer1Hospital2
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer1.hospital2 ===================== "

    setGlobalsForPeer0Patients
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.patients ===================== "
    
    setGlobalsForPeer1Patients
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer1.patients ===================== "

    setGlobalsForPeer0Laboratory
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.laboratory ===================== "
    
    setGlobalsForPeer1Laboratory
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer1.laboratory ===================== "

    setGlobalsForPeer0Insurance
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.insurance ===================== "
    
    setGlobalsForPeer1Insurance
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer1.insurance ===================== "
}
#installChaincode

queryInstalled(){
    setGlobalsForPeer0Hospital1
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.hospital1 on channel ===================== "
}
#queryInstalled

approveForMyHopital1(){
    setGlobalsForPeer0Hospital1

    peer lifecycle chaincode approveformyorg -o localhost:7050  \
    --ordererTLSHostnameOverride orderer.healthnet.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --init-required --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from hopital 1 ===================== "
    
}
#approveForMyHopital1
# --signature-policy "OR ('Org1MSP.member')"
# --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_ORG1_CA --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA
# --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles $PEER0_ORG1_CA --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles $PEER0_ORG2_CA
#--channel-config-policy Channel/Application/Admins
# --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer')"


checkCommitReadyness(){
    setGlobalsForPeer0Hospital1

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json --init-required

    echo "===================== checking commit readyness from hospital 1 ===================== "
}
#checkCommitReadyness
approveForMyHopital2(){
    setGlobalsForPeer0Hospital2

    peer lifecycle chaincode approveformyorg -o localhost:7050 \
    --ordererTLSHostnameOverride orderer.healthnet.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --init-required \
    --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from hospital 2 ===================== "
}
#approveForMyHopital2

#3adi b nafs l org na3emlou l check 5ater juste bch yraja3 l approvals orgs
checkCommitReadyness(){
    
    setGlobalsForPeer0Hospital1

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_HOSPITAL1_CA \
    --name ${CC_NAME} --version ${VERSION} \
    --sequence ${VERSION} --output json --init-required

    echo "===================== checking commit readyness from hospital 1 ===================== "
}
#checkCommitReadyness

approveForMyPatients(){
    setGlobalsForPeer0Patients

    peer lifecycle chaincode approveformyorg -o localhost:7050 \
    --ordererTLSHostnameOverride orderer.healthnet.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --init-required \
    --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from Patients ===================== "
}
#approveForMyPatients

#3adi b nafs l org na3emlou l check 5ater juste bch yraja3 l approvals orgs
checkCommitReadyness(){
    
    setGlobalsForPeer0Hospital1

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_HOSPITAL1_CA \
    --name ${CC_NAME} --version ${VERSION} \
    --sequence ${VERSION} --output json --init-required

    echo "===================== checking commit readyness from patients ===================== "
}
#checkCommitReadyness

approveForMyLaboratory(){
    setGlobalsForPeer0Laboratory

    peer lifecycle chaincode approveformyorg -o localhost:7050 \
    --ordererTLSHostnameOverride orderer.healthnet.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --init-required \
    --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from laboratoy ===================== "
}
#approveForMyLaboratory

#3adi b nafs l org na3emlou l check 5ater juste bch yraja3 l approvals orgs
checkCommitReadyness(){
    
    setGlobalsForPeer0Hospital1

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_HOSPITAL1_CA \
    --name ${CC_NAME} --version ${VERSION} \
    --sequence ${VERSION} --output json --init-required

    echo "===================== checking commit readyness from laboratory ===================== "
}
#checkCommitReadyness

approveForMyInsurance(){
    setGlobalsForPeer0Insurance
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
    --ordererTLSHostnameOverride orderer.healthnet.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --init-required \
    --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from insurance ===================== "
}
#approveForMyInsurance

#3adi b nafs l org na3emlou l check 5ater juste bch yraja3 l approvals orgs
checkCommitReadyness(){
    
    setGlobalsForPeer0Hospital1

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_HOSPITAL1_CA \
    --name ${CC_NAME} --version ${VERSION} \
    --sequence ${VERSION} --output json --init-required

    echo "===================== checking commit readyness from insurance ===================== "
}
#checkCommitReadyness

commitChaincodeDefination(){
    setGlobalsForPeer0Hospital1

    peer lifecycle chaincode commit -o localhost:7050 \
    --ordererTLSHostnameOverride orderer.healthnet.com \
    --tls $CORE_PEER_TLS_ENABLED  --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_HOSPITAL1_CA \
    --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_HOSPITAL2_CA \
    --peerAddresses localhost:11051 --tlsRootCertFiles $PEER0_PATIENTS_CA \
    --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_LABORATORY_CA \
    --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_INSURANCE_CA \
    --version ${VERSION} --sequence ${VERSION} \
    --init-required
   
   echo "===================== Chaincode Defination commited on peer0-hospial1 and peer0-hospital2 ===================== "
}
#commitChaincodeDefination

queryCommitted(){
    setGlobalsForPeer0Hospital1

    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME --name ${CC_NAME}

    
}
#queryCommitted

chaincodeInvokeInit(){
    setGlobalsForPeer0Hospital1
    export FABRIC_CFG_PATH=/home/nadineben/fabric/myhealthapp/artifacts/channel/config
    # peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.healthnet.com \
    # --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C $CHANNEL_NAME -n ${CC_NAME} \
    # --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_HOSPITAL1_CA \
    # --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_HOSPITAL2_CA \
    # --peerAddresses localhost:11051 --tlsRootCertFiles $PEER0_PATIENTS_CA \
    # --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_LABORATORY_CA \
    # --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_INSURANCE_CA \
    # --isInit -c '{"function":"","Args":[]}'

    peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.healthnet.com \
    --tls --cafile $ORDERER_CA -C $CHANNEL_NAME -n ${CC_NAME} \
    --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_HOSPITAL1_CA \
    --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_HOSPITAL2_CA \
    --peerAddresses localhost:11051 --tlsRootCertFiles $PEER0_PATIENTS_CA \
    --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_LABORATORY_CA \
    --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_INSURANCE_CA \
    --isInit -c '{"function":"InitLedger","Args":[]}'
    #--isInit -c '{"Args":[]}'
    #--isInit -c '{"function":"InitLedger","Args":[]}'
    #--isInit -c '{"function":"InitLedger","Args":[]}'
    
}
#chaincodeInvokeInit

chaincodeInvoke(){
    # setGlobalsForPeer0Org1

    # Initialize Ledger
    # peer chaincode invoke -o localhost:7050 \
    # --ordererTLSHostnameOverride orderer.example.com \
    # --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C $CHANNEL_NAME -n ${CC_NAME} \
    # --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_ORG1_CA \
    # --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA  \
    # -c '{"function":"initLedger","Args":[]}'
    
    setGlobalsForPeer0Hospital1

    ## Create Car
    # peer chaincode invoke -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com \
    #     --tls $CORE_PEER_TLS_ENABLED \
    #     --cafile $ORDERER_CA \
    #     -C $CHANNEL_NAME -n ${CC_NAME}  \
    #     --peerAddresses localhost:7051 \
    #     --tlsRootCertFiles $PEER0_ORG1_CA \
    #     --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA $PEER_CONN_PARMS  \
    #     -c '{"function": "CreateCar","Args":["Car-ABCDEEE", "Audi", "R8", "Red", "Pavan"]}'
    
    ## Change car owner
    peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.healthnet.com \
        --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA \
        -C $CHANNEL_NAME -n ${CC_NAME}  \
        --peerAddresses localhost:7051 \
        --tlsRootCertFiles $PEER0_HOSPITAL1_CA \
        --peerAddresses localhost:9051 \
        --tlsRootCertFiles $PEER0_HOSPITAL2_CA \
        --peerAddresses localhost:11051 \
        --tlsRootCertFiles $PEER0_PATIENTS_CA \
        --peerAddresses localhost:13051 \
        --tlsRootCertFiles $PEER0_LABORATORY_CA \
        --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_INSURANCE_CA $PEER_CONN_PARMS  \
        -c '{"function": "TransferAge","Args":["patient2", "14"]}'
        #-c '{"function": "initLedger","Args":[]}'
        #-c '{"function": "TransferPatient","Args":["patient2", "sousse, sahloul"]}'
}

chaincodeQuery(){
    setGlobalsForPeer0Hospital1

    # Query all Cars
    peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"Args":["GetAllPatients"]}'

    # Query by Car id
    #peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"function": "queryCar","Args":["CAR0"]}'

    # Query all Cars
    # peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"Args":["queryAllCars"]}'

    # # Query by Car id
    # peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"Args":["queryCar", "Car-ABCDEEE"]}'
}

#  presetup
#   packageChaincode
# installChaincode
# queryInstalled
# approveForMyHopital1
# checkCommitReadyness
# approveForMyHopital2
# checkCommitReadyness
# approveForMyPatients
# checkCommitReadyness
#  approveForMyLaboratory
#  checkCommitReadyness
# approveForMyInsurance
# checkCommitReadyness
# commitChaincodeDefination
# queryCommitted
 chaincodeInvokeInit
# chaincodeInvoke
#  chaincodeQuery
 
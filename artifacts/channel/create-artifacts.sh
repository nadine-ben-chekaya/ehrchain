chmod -R 0755 ./crypto-config
# Delete existing artifacts
rm -rf ./crypto-config
rm genesis.block mychannel.tx
rm -rf ../../channel-artifacts/*

#Generate Crypto artifactes for organizations
cryptogen generate --config=./crypto-config.yaml --output=./crypto-config/

# System channel
SYS_CHANNEL="sys-channel"

# channel name defaults to "mychannel"
CHANNEL_NAME="myehrchannel"

echo $CHANNEL_NAME

# Generate System Genesis block
configtxgen -profile OrdererGenesis -configPath . -channelID $SYS_CHANNEL  -outputBlock ./genesis.block


# Generate channel configuration block
configtxgen -profile BasicChannel -configPath . -outputCreateChannelTx ./myehrchannel.tx -channelID $CHANNEL_NAME

echo "#######    Generating anchor peer update for Org1MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Hospital1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Hospital1MSP

echo "#######    Generating anchor peer update for Org2MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Hospital2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Hospital2MSP

echo "#######    Generating anchor peer update for PatientsMSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./PatientsMSPanchors.tx -channelID $CHANNEL_NAME -asOrg PatientsMSP

echo "#######    Generating anchor peer update for LaboratoryMSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./LaboratoryMSPanchors.tx -channelID $CHANNEL_NAME -asOrg LaboratoryMSP

echo "#######    Generating anchor peer update for InsuranceMSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./InsuranceMSPanchors.tx -channelID $CHANNEL_NAME -asOrg InsuranceMSP
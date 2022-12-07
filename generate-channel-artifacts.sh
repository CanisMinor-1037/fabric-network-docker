export APP_CHANNEL=mychannel
# 生成创世区块
configtxgen -configPath ./config \
-profile TwoOrgsOrdererGenesis \
-channelID fabric-channel \
-outputBlock ./channel-artifacts/orderer.genesis.block

# tree
echo "生成创世区块"
tree ./channel-artifacts

# 生成通道文件 
configtxgen -configPath ./config \
-profile TwoOrgsChannel \
-channelID $APP_CHANNEL \
-outputCreateChannelTx ./channel-artifacts/$APP_CHANNEL.tx

# tree
echo "生成通道文件"
tree ./channel-artifacts

# 生成锚节点配置更新文件
configtxgen -configPath ./config \
-profile TwoOrgsChannel \
-channelID $APP_CHANNEL \
-asOrg Org1MSP \
-outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx

configtxgen -configPath ./config \
-profile TwoOrgsChannel \
-channelID $APP_CHANNEL \
-asOrg Org2MSP \
-outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx

# tree
echo "生成锚节点配置更新文件"
tree ./channel-artifacts
# Ubuntu Go 环境配置脚本

# --------------------------
# Home 文件夹位置，需要自定义配置
serviceDir=/path/to/home/folder
# GOPATH 对应文件夹，需要自定义配置
goDir=/path/to/go/folder

# 下载 Go 安装包，目前版本 1.7
# 下载地址 https://golang.org/dl/
echo "[INFO] Download Golang binaries (1/4)"
wget https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz
# 删除老版本
if [ -d "/usr/local/go" ]; then
    echo "[INFO] Remove old version"
    sudo rm -rf /usr/local/go
fi
# 解压
echo "[INFO] Extract files (2/4)"
sudo tar -C /usr/local -xzf go1.7.1.linux-amd64.tar.gz
# 更新 PATH 变量，这里支持的是 bash
echo "[INFO] Setting PATH and GOPATH (3/4)"
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
mkdir -p goDir
# 添加 GOPATH 变量
echo "export GOPATH="$goDir >> ~/.bashrc
source ~/.bashrc
go version
echo "GOPATH="$GOPATH 
# 清理工作，把所有的安装包保存到 software 文件夹中
echo "[INFO] Clean up all the mess"
cd $serviceDir
mkdir $serviceDir/software
mv *.gz $serviceDir/software
echo "[INFO] Done(4/4)"
echo "All Done. You can now continue your work."
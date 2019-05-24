pod "ddapi"

1. 先去开一个repo，这个repo就是我们私有Pod源仓库
2. pod repo add [私有Pod源仓库名字](ddrepo) [私有Pod源的repo地址](https://github.com/d2ios/ddrepo.git)
3. 创立一个文件夹，例如Project。把我们的主工程文件夹放到Project下：~/doule/MainProject
4. 在~/Project下clone快速配置私有源的脚本repo：git clone https://github.com/doudou1016/privatepod.git
5. 将PrivatePod的template文件夹下Podfile中source 'https://github.com/d2ios/ddrepo.git'改成第一步里面你自己的私有Pod源仓库的repo地址
6. 将PrivatePod的template文件夹下upload.sh中PrivatePods改成第二步里面你自己的私有Pod源仓库的名字
7. ./config.sh

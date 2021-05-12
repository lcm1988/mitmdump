# mitmdump
定制版本的mitmdump-docker脚本

构建docker镜像：docker build -t mocker .
生成容器：docker run -v mitm脚本所在文件夹路径:/mock -p 8080:8080 mocker

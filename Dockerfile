FROM ubuntu:latest
RUN touch test
ENTRYPOINT ["ls"]
CMD ["--help"]

#RUN apt-get update && apt-get install -y \
#    curl \
#    cvs \
#    nginx
#CMD ["/bin/bash"]

#>>圧縮フォルダ(tar)を利用する場合はADDが適当
#ADD compressed.tar /

#>>基本はCOPYでOK
#RUN mkdir /new_dir
#COPY something /new_dir/

#>>ENTRYPOINTは上書き出来ないコマンドを組み込む際に使う。そのため、CMDの部分はコマンドの引数として使う。
#ENTRYPOINT ["ls"]
#CMD ["--help"]
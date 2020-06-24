FROM ubuntu:latest
ENV num1 value
ENV num2=value
ENV num3="v a l u e" num4=v\ a\ l\ u\ e
ENV num5 v a l u e

#>> RUNはDockerFileのレイヤー部分。RUN毎にレイヤーが追加される。
#   dockerimageのサイズを小さくするため、&&を使ってワンライナーで書くのが基本
#   CMDはレイヤーを作らない

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

#>>ENVは環境変数を設定
#  通常の環境変数同様に使用可能
#  echo $num1　など
#ENV num1 value
#ENV num2=value
#ENV num3="v a l u e" num4=v\ a\ l\ u\ e
#ENV num5 v a l u e
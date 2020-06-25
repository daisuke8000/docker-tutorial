FROM ubuntu:latest
RUN mkdir created_in_Dockerfile

#<RUN>
#>> RUNはDockerFileのレイヤー部分。RUN毎にレイヤーが追加される。
#   dockerimageのサイズを小さくするため、&&を使ってワンライナーで書くのが基本
#   CMDはレイヤーを作らない
#<CMD>
#>> 原則、DockerFileの最後に記述
#   生成するコンテナのデフォルトのコマンドとなる
#   ["ls","-l"] => 一番左がコマンド、続くのは引数
#   特にやりたいことがなければ["/bin/bash"]が一般的
#------------------------------------------
#FROM ubuntu:latest
#RUN apt-get update && apt-get install -y \
#    curl \
#    cvs \
#    nginx
#CMD ["ls","-l"]
#------------------------------------------

#<COPY>
#>> build contextの中で指定したファイルをコンテナにコピーすることが出来る
#   以下は予め,somethingというファイルを作っておくこと。
#------------------------------------------
#FROM ubuntu:latest
#RUN mkdir /new_dir
#COPY something /new_dir/
#CMD ["/bin/bash"]
#------------------------------------------

#<ADD>
#>> COPYと似た内容では有るが、圧縮フォルダ(tar)を利用する場合はADDが適当
#   以下は予め,圧縮フォルダ(tar)を作っておくこと。
#   圧縮フォルダ作り方　=> tar -cvf compressed.tar xxxxxxx/
#------------------------------------------
#FROM ubuntu:latest
#ADD compressed.tar /
#CMD ["/bin/bash"]
#------------------------------------------

#<ENTRYPOINT>
#>> ENTRYPOINTは上書き出来ないコマンドを組み込む際に使う。そのため、CMDの部分はENTRYPOINTの引数として使う。
#------------------------------------------
#FROM ubuntu:latest
#RUN touch test
#ENTRYPOINT ["ls"]
#CMD ["--help"]
#------------------------------------------

#<ENV>
#>> ENVは環境変数を設定
#   通常の環境変数同様に使用可能
#   echo $num1　など
#------------------------------------------
#FROM ubuntu:latest
#ENV num1 value
#ENV num2=value
#ENV num3="v a l u e" num4=v\ a\ l\ u\ e
#ENV num5 v a l u e
#CMD ["/bin/bash"]
#------------------------------------------

#<WORKDIR>
#>> WORKDIRを使うことでそれ以降のDockerInstructionをそこを起点に行う。
#   なお、指定するディレクトリが無い場合は自動で生成される。
#   WORKDIRは原則絶対パスを使うこと
#------------------------------------------
#FROM ubuntu:latest
#WORKDIR /sample
#RUN touch sample_file
#CMD ["/bin/bash"]
#------------------------------------------

#<<docker -v option>>
#>> "-v"オプションを使用することでhostファイルシステムをコンテナにマウントする
#   "-v <host_mount>:<docker_mount>" の形にする。
#   host側にファイルシステムを置く理由として、コンテナにファイルを作成するとコンテナ自体が大きくなる
#   コンテナは誰かに渡したり、共有するものであるためその使い方はあまり望ましくない。そのため、実行環境として利用するのが従来の使い方
#   ******の箇所にはファイルパスを記述。その後に「:」 で区切り、マウントするフォルダを記述(今回はnew_dir)
#   マウントするフォルダは作成していなくても、docker run時に記述すれば作成される
#------------------------------------------
#FROM ubuntu:latest
#RUN mkdir new_dir
#>> docker run -it -v ******:/new_dir "build時のid" bash
#>> docker run -it -v ******:/hogehoge_dir "build時のid" bash(マウントするフォルダは事前になくても大丈夫)
#
#------------------------------------------

#<<docker -u option>>
#>> "-u"オプションを使用することでユーザーIDとグループIDを指定してコンテナをrunする
#   "-u $(id -u):$(id -g)"を記述
#   "id -u" => ユーザーID確認（501とか）
#   "id -g" => グループID確認（20とか）
#   これらのコマンドで指定することでコンテナにroot以外の権限で入ることが出来る。
#　　このため、以下のdocker run時のコンテナに生成されたファイルの権限は以下になる。
#   created_in_Dockerfile => root
#   created_in_run => 501
#------------------------------------------
#FROM ubuntu:latest
#RUN mkdir created_in_Dockerfile
#>> docker run -it -u $(id -u):$(id -g) -v ******:/created_in_run dd131421f856 bash
#------------------------------------------

#<<docker -p option>>
#>> "-p"オプションを使用することでホストのポートをコンテナのポートにつなげる
#   "-p <host_port>:<container_port>"の形にする
#   host_portは特に指定こそしない（1234とかでもOK）
#------------------------------------------
#>> docker run -it -p 8888:8888 --rm jupyter/datascience-notebook bash
#------------------------------------------

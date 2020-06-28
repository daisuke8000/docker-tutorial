FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    vim
WORKDIR /opt
RUN wget https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh && \
    sh Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -f Anaconda3-2019.10-Linux-x86_64.sh

ENV PATH /opt/anaconda3/bin:$PATH
RUN pip install --upgrade pip
WORKDIR /
CMD ["jupyter","lab","--ip=0.0.0.0","--allow-root","--LabApp.token=''"]


#<<パスの確認>>
# "/opt"で"python"を入力してもパスが通っていないため、パスを通す作業を実行する
# 初期状態のパスを確認"echo $PATH" => /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin (パスが通っていない)
# まずは"/opt/anaconda3/bin/"まで移動、"python"を入力 => 反応無し
# "/opt/anaconda3/bin/python"で実行 => 実行確認
#
#<<パスを通す>>
# "export PATH=コマンドが実行出来たところの絶対パス:$PATH"を入力するので以下のようにする。
# "export PATH=/opt/anaconda3/bin:$PATH"
# "echo $PATH"で確認 => /opt/anaconda3/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin (パスが通ってる)
# "/opt"で"python"を入力 => 実行確認

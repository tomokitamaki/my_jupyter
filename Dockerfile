# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# https://hub.docker.com/r/jupyter/base-notebook/tags?page=1&ordering=last_updated
ARG BASE_CONTAINER=jupyter/datascience-notebook:lab-4.0.7
FROM $BASE_CONTAINER

USER root

RUN apt update && apt upgrade -y && apt install -yq mecab mecab-ipadic-utf8 libmecab-dev fonts-ipafont
RUN ln -s /etc/mecab /usr/local/etc/mecabrc

# いつもの良く使うモジュールをインストール
RUN pip install pandas matplotlib seaborn japanize-matplotlib requests jupyterlab_code_formatter black isort wordcloud nltk librosa imbalanced-learn toml moviepy jupyterlab "ipywidgets>=7.5" plotly mecab-python3 pandas-profiling pandera

# どうもどっからかiPythonとjediが上手く動かなくなったみたいでバージョンを固定しないと補完が効かなくなる。
# RUN pip install jedi==0.17.2

# RUN jupyter serverextension enable --py jupyterlab

# markdownの見出しを目次にしてくれる便利なやつ https://github.com/jupyterlab/jupyterlab-toc
# RUN jupyter labextension install @jupyterlab/toc

# 文法をチェックしてくれる便利なやつ https://github.com/mlshapiro/jupyterlab-flake8
# RUN jupyter labextension install jupyterlab-flake8

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

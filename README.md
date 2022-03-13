# my_jupyter

```shell
sudo docker image build --name mylab .  
sudo docker run -d --restart=always -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -v /home/ubuntu/jupyter-notebook-dir/:/home/jovyan/work mylab
```

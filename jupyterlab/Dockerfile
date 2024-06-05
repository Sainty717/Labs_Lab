#
# JupyterLab installation on Ubuntu, with Python and R kernels
#
FROM ubuntu:latest

ENV JL_DATA /var/jupyterlab/data
ENV JL_PORT 8888
RUN /bin/bash
RUN cd
# Install Python
RUN apt-get update
RUN apt-get upgrade -y
RUN apt install python-is-python3 python3-pip cmake -y
RUN pip3 install --upgrade pip --break-system-packages

# Install Python 3 and Jupyter 3
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip --break-system-packages
RUN pip3 install -U ipython[all] jupyter --break-system-packages

# Install JupyterLab
RUN pip3 install jupyterlab --break-system-packages

# Install R and IRKernel
#ENV CRANKEY 51716619E084DAB9
#RUN apt-get install -y dirmngr
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ${CRANKEY}

#RUN gpg –keyserver keyserver.ubuntu.com –recv-key ${CRANKEY} &&\
#    gpg -a –export ${CRANKEY} | sudo apt-key add –
#RUN echo "deb http://cran.ms.unimelb.edu.au/bin/linux/ubuntu artful/" |\
#    tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev libssl-dev
RUN apt-get install -y --allow-unauthenticated r-base
COPY requirements.txt requirements.txt
COPY .profile /root/.profile
# Install Folium and Plotly
RUN apt-get -y install pandoc
RUN pip3 install folium plotly pandas matplotlib bokeh numpy scipy shapely cmake --break-system-packages
RUN pip install -r requirements.txt --break-system-packages
# Create the Jupyter configuration file
RUN export  SHELL=/bin/bash
RUN jupyter notebook --generate-config
# Expose Jupyter port and start Jupyter
EXPOSE ${JL_PORT}
COPY ./startup.sh /tmp/
RUN mkdir -p ${JL_DATA} && chmod a+x /tmp/startup.sh
RUN chsh -s /bin/bash
CMD /tmp/startup.sh

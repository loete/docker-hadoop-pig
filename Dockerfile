# base image
FROM stfnltnr/hadoop:3.2.0
# Pig Version
ARG PIG_VERSION=0.17.0 
# env vars
ENV PIG_HOME=/opt/pig \
    PIG_CLASSPATH=/opt/hadoop/etc/hadoop
# install pig
RUN wget http://mirror.klaus-uwe.me/apache/pig/pig-$PIG_VERSION/pig-$PIG_VERSION.tar.gz && \
    tar -xzf pig-$PIG_VERSION.tar.gz && \
    mv pig-$PIG_VERSION $PIG_HOME && \
    rm -rf ${PIG_HOME}/docs && \
    #echo "PATH=$JAVA_HOME/bin:$PIG_HOME/bin:$PATH" >> ~/.bashrc && \
    rm -rf pig-$PIG_VERSION.tar.gz /var/lib/apt/lists/* /tmp/* /var/tmp/*
# update PATH
RUN echo "PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$PIG_HOME/bin:$PATH" >> ~/.bashrc
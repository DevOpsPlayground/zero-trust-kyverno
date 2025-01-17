FROM ghcr.io/devopsplayground/base-container:latest

# Installing kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    chmod +x kubectl
    mkdir -p ~/.local/bin
    mv ./kubectl ~/.local/bin/kubectl

# install helm
RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null
    apt-get install apt-transport-https --yes
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
    apt-get update
    apt-get install helm

# create kube config folder
RUN mkdir /root/.kube
    echo "" > /root/.kube/config

# Clone Playground repo
RUN cd /root/workdir && \
    git clone https://github.com/DevOpsPlayground/zero-trust-kyverno

# ~/.bashrc update
RUN echo 'alias aws_creds="env | grep AWS"' >> ~/.bashrc && \
    echo 'alias workdir="cd ~/workdir/zero-trust-kyverno"' >> ~/.bashrc 

# Utiliser Ubuntu Noble comme base
FROM ubuntu:noble

# Eviter les prompts interactifs
ENV DEBIAN_FRONTEND=noninteractive

# Mettre à jour et installer les outils nécessaires
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    wget \
    iputils-ping \
    net-tools \
    iproute2 \
    iptables \
    ebtables \
    sudo \
    systemd \
    vim \
    bash-completion && \
    apt-get clean
    

# Ajouter le dépôt Kubernetes
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /" > /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubelet kubeadm kubectl && \
    apt-mark hold kubelet kubeadm kubectl

# Désactiver le swap
RUN sed -i '/ swap / s/^/#/' /etc/fstab || true

# Télécharger et installer containerd proprement
RUN wget https://github.com/containerd/containerd/releases/download/v2.0.0/containerd-2.0.0-linux-amd64.tar.gz && \
    mkdir -p /tmp/containerd && \
    tar -C /tmp/containerd -xzf containerd-2.0.0-linux-amd64.tar.gz && \
    cp /tmp/containerd/bin/* /usr/local/bin/ && \
    rm -rf /tmp/containerd containerd-2.0.0-linux-amd64.tar.gz

# Télécharger et installer runc
RUN wget https://github.com/opencontainers/runc/releases/download/v1.2.6/runc.amd64 && \
    install -m 755 runc.amd64 /usr/local/sbin/runc && \
    rm runc.amd64

# Télécharger et installer les plugins CNI
RUN wget https://github.com/containernetworking/plugins/releases/download/v1.7.1/cni-plugins-linux-amd64-v1.7.1.tgz && \
    mkdir -p /opt/cni/bin && \
    tar -C /opt/cni/bin -xzf cni-plugins-linux-amd64-v1.7.1.tgz && \
    rm cni-plugins-linux-amd64-v1.7.1.tgz

# Configurer containerd
RUN mkdir -p /etc/containerd && \
    containerd config default > /etc/containerd/config.toml && \
    sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml

# Préparer le dossier kube pour root
RUN mkdir -p /root/.kube

# Commande par défaut
CMD ["/bin/bash"]

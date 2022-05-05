FROM fedora:latest

RUN dnf -y install \
        curl git openssl \
        postgresql postgresql-devel \
        python3 python3-pip \
        python3-devel sqlite tar \
        neofetch wget xz zip \
        pv jq \
        && dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        && dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
        && dnf -y install \
        chromium chromedriver ffmpeg aria2 \
        figlet gcc gcc-c++ gzip megatools \
        && curl https://raw.githubusercontent.com/SkyLab-Devs/CosmicUserbot/starfire/requirements.txt -o requirements.txt \
        && pip3 install -U pip setuptools wheel \
        && pip3 install --no-cache-dir -r requirements.txt \
        && rm requirements.txt \
        && curl -sL https://git.io/file-transfer | sh \
        && mv transfer /usr/local/bin/

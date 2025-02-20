FROM --platform=linux/arm64 debian:bookworm-backports

RUN apt-get update && \
    apt-get full-upgrade --no-install-recommends -y \
        curl build-essential crossbuild-essential-arm64 git equivs \
        debhelper devscripts dh-exec dh-sequence-dkms lintian libc6

RUN export keyring="$(mktemp)" && \
    export version="$(curl -L https://github.com/radxa-pkg/radxa-archive-keyring/releases/latest/download/VERSION)" && \
    curl -L --output "$keyring" "https://github.com/radxa-pkg/radxa-archive-keyring/releases/latest/download/radxa-archive-keyring_${version}_all.deb" && \
    dpkg -i "$keyring" && \
    rm -f "$keyring" && \
    echo "deb [signed-by=/usr/share/keyrings/radxa-archive-keyring.gpg] https://radxa-repo.github.io/rk3588-bookworm-test/ rk3588-bookworm-test main" | tee /etc/apt/sources.list.d/80-radxa-rk3588.list && \
    echo "deb [signed-by=/usr/share/keyrings/radxa-archive-keyring.gpg] https://radxa-repo.github.io/bookworm-test/ bookworm-test main" | tee /etc/apt/sources.list.d/70-radxa.list && \    
    apt-get update && \
    apt-get full-upgrade --no-install-recommends -y \
        pkgconf autoconf automake glslang-dev \
        ladspa-sdk libasound2-dev libarchive-dev libbluray-dev \
        libbs2b-dev libcaca-dev libcdio-paranoia-dev \
        libdisplay-info-dev libdrm-dev libdav1d-dev \
        libdvdnav-dev libegl1-mesa-dev libepoxy-dev \
        libfontconfig-dev libfreetype6-dev libfribidi-dev \
        libgl1-mesa-dev libgbm-dev libgnutls28-dev \
        libharfbuzz-dev libjack-jackd2-dev libjpeg-dev \
        libbrotli-dev liblcms2-dev liblua5.2-dev \
        libmodplug-dev libmp3lame-dev libopenal-dev \
        libopus-dev libopencore-amrnb-dev libopencore-amrwb-dev \
        libpipewire-0.3-dev libpulse-dev librga-dev librga2 \
        librockchip-mpp-dev librtmp-dev librubberband-dev \
        libsdl2-dev libsixel-dev libssh-dev libsoxr-dev \
        libspeex-dev libtool libuchardet-dev \
        libv4l-dev libva-dev libvdpau-dev libvorbis-dev \
        libvo-amrwbenc-dev libunwind-dev libvpx-dev \
        libvulkan-dev libwayland-dev libx264-dev \
        libx11-dev libxext-dev libxkbcommon-dev \
        libxpresent-dev libxrandr-dev libxss-dev \
        libxv-dev libxvidcore-dev linux-libc-dev \
        meson/bookworm-backports nasm ninja-build pkg-config python3 \
        python3-docutils wayland-protocols x11proto-core-dev \
        zlib1g-dev && \
    adduser --gecos runner --disabled-password runner && \
    rm -rf /var/lib/apt/lists/*

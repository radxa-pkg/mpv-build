FROM --platform=linux/arm64 debian:bookworm-backports

RUN apt-get update && \
    apt-get full-upgrade --no-install-recommends -y \
        curl build-essential crossbuild-essential-arm64 git equivs \
        debhelper devscripts dh-exec dh-sequence-dkms lintian libc6:arm64 && \
    export keyring="$(mktemp)" && \
    export version="$(curl -L https://github.com/radxa-pkg/radxa-archive-keyring/releases/latest/download/VERSION)" && \
    curl -L --output "$keyring" "https://github.com/radxa-pkg/radxa-archive-keyring/releases/latest/download/radxa-archive-keyring_${version}_all.deb" && \
    dpkg -i "$keyring" && \
    rm -f "$keyring" && \
    echo "deb [signed-by=/usr/share/keyrings/radxa-archive-keyring.gpg] https://radxa-repo.github.io/rk3588-bookworm-test/ rk3588-bookworm-test main" | tee /etc/apt/sources.list.d/80-radxa-rk3588.list && \
    echo "deb [signed-by=/usr/share/keyrings/radxa-archive-keyring.gpg] https://radxa-repo.github.io/bookworm-test/ bookworm-test main" | tee /etc/apt/sources.list.d/70-radxa.list && \    
    apt-get update && \
    apt-get full-upgrade --no-install-recommends -y \
        pkgconf:arm64 autoconf:arm64 automake:arm64 glslang-dev:arm64 \
        ladspa-sdk:arm64 libasound2-dev:arm64 libarchive-dev:arm64 libbluray-dev:arm64 \
        libbs2b-dev:arm64 libcaca-dev:arm64 libcdio-paranoia-dev:arm64 \
        libdisplay-info-dev:arm64 libdrm-dev:arm64 libdav1d-dev:arm64 \
        libdvdnav-dev:arm64 libegl1-mesa-dev:arm64 libepoxy-dev:arm64 \
        libfontconfig-dev:arm64 libfreetype6-dev:arm64 libfribidi-dev:arm64 \
        libgl1-mesa-dev:arm64 libgbm-dev:arm64 libgnutls28-dev:arm64 \
        libharfbuzz-dev:arm64 libjack-jackd2-dev libjpeg-dev:arm64 \
        libbrotli-dev:arm64 liblcms2-dev:arm64 liblua5.2-dev:arm64 \
        libmodplug-dev:arm64 libmp3lame-dev:arm64 libopenal-dev:arm64 \
        libopus-dev:arm64 libopencore-amrnb-dev:arm64 libopencore-amrwb-dev:arm64 \
        libpipewire-0.3-dev:arm64 libpulse-dev:arm64 librga-dev:arm64 librga2:arm64 \
        librockchip-mpp-dev:arm64 librtmp-dev:arm64 librubberband-dev:arm64 \
        libsdl2-dev:arm64 libsixel-dev:arm64 libssh-dev:arm64 libsoxr-dev:arm64 \
        libspeex-dev:arm64 libtool:arm64 libuchardet-dev:arm64 \
        libv4l-dev:arm64 libva-dev:arm64 libvdpau-dev:arm64 libvorbis-dev:arm64 \
        libvo-amrwbenc-dev:arm64 libunwind-dev:arm64 libvpx-dev:arm64 \
        libvulkan-dev:arm64 libwayland-dev:arm64 libx264-dev:arm64 \
        libx11-dev:arm64 libxext-dev:arm64 libxkbcommon-dev:arm64 \
        libxpresent-dev:arm64 libxrandr-dev:arm64 libxss-dev:arm64 \
        libxv-dev:arm64 libxvidcore-dev:arm64 linux-libc-dev:arm64 \
        meson/bookworm-backports nasm:arm64 ninja-build:arm64 pkg-config:arm64 python3:arm64 \
        python3-docutils wayland-protocols:arm64 x11proto-core-dev \
        zlib1g-dev:arm64 && \
    adduser --gecos runner --disabled-password runner && \
    rm -rf /var/lib/apt/lists/*

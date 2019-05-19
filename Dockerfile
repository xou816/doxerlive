FROM alpine:latest

ENV TLURL="http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"

RUN apk add perl wget freetype fontconfig gnupg

RUN mkdir -p /usr/local/texlive
WORKDIR /usr/local/texlive
RUN wget $TLURL && tar -xzf install-tl-unx.tar.gz && rm install-tl-unx.tar.gz
COPY texlive.profile texlive.profile
RUN TEXLIVE_INSTALL_ENV_NOCHECK=true TEXLIVE_INSTALL_NO_WELCOME=true ./install-tl-*/install-tl -v -profile=texlive.profile && \
	rm -r ./install-tl-* texlive.profile install-tl.log

WORKDIR /usr/local/texlive/bin/x86_64-linuxmusl
RUN ./tlmgr update --list || ./tlmgr option repository ctan
RUN ./tlmgr install latex-bin luatex xetex

COPY pkgs.txt /tmp/pkgs.txt
RUN ./tlmgr install $(cat /tmp/pkgs.txt | tr '\n' ' ')

RUN ./tlmgr path add
WORKDIR /
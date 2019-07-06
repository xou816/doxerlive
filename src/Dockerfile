FROM alpine:3.9

ENV TLURL="http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"
ENV TEXLIVE_INSTALL_ENV_NOCHECK=true
ENV TEXLIVE_INSTALL_NO_WELCOME=true

RUN apk add perl wget freetype fontconfig gnupg libgcc make su-exec xz
RUN mkdir -p /usr/local/texlive

WORKDIR /usr/local/texlive
COPY texlive.profile texlive.profile
RUN wget $TLURL && tar -xzf install-tl-unx.tar.gz && \
	./install-tl-*/install-tl -v -profile=texlive.profile && \
	rm -r ./install-tl-* texlive.profile install-tl.log

WORKDIR /usr/local/texlive/bin/x86_64-linuxmusl
RUN ./tlmgr update --self && \
	./tlmgr option repository ctan && \
	./tlmgr install tex latexmk ifluatex ifxetex latex-bin luatex xetex && \
	./tlmgr path add

COPY utils/tlinstall /usr/local/bin/tlinstall
RUN chmod +x /usr/local/bin/tlinstall

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /var/doxerlive
VOLUME /var/doxerlive

WORKDIR /var/doxerlive
ENTRYPOINT ["/entrypoint.sh"]
CMD ["make"]

FROM alpine:3.9

ENV TLURL="http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"
ENV TEXLIVE_INSTALL_ENV_NOCHECK=true
ENV TEXLIVE_INSTALL_NO_WELCOME=true

# Dependencies
# libgcc still needed for some dependencies (which ones exactly?)
RUN apk add perl wget freetype fontconfig gnupg libgcc make su-exec xz

# Install texlive
RUN mkdir -p /usr/local/texlive
WORKDIR /usr/local/texlive
COPY texlive.profile texlive.profile
RUN wget $TLURL && tar -xzf install-tl-unx.tar.gz && \
	./install-tl-*/install-tl -v -profile=texlive.profile && \
	rm -r ./install-tl-* texlive.profile install-tl.log

# Fix path and install latexmk
ENV PATH=$PATH:/usr/local/texlive/bin/x86_64-linuxmusl
RUN	tlmgr option repository ctan && \
	tlmgr install latexmk

# Fonts setup
COPY 09-texlive-fonts.conf /etc/fonts/conf.d/09-texlive-fonts.conf
RUN chmod a+w /var/cache/fontconfig

# Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /var/doxerlive
VOLUME /var/doxerlive

WORKDIR /var/doxerlive
ENTRYPOINT ["/entrypoint.sh"]
CMD ["make"]

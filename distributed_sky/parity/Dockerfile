FROM parity/parity
ARG ETH_PASSWORD
RUN mkdir /chain-data/
RUN mkdir /keys-store/
VOLUME /chain-data/
VOLUME /keys-store/
RUN bash -c 'echo "$ETH_PASSWORD" > /unlock_password.txt'
EXPOSE 8546

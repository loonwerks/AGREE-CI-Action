# Container image that runs your code
FROM debian:bookworm-slim

# Copies script for construction of AGREE tool into the container
COPY make_agree.sh /make_agree.sh

# Run the make agree script to download and install AGREE
RUN make_agree.sh


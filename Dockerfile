FROM ubuntu
MAINTAINER Tom Fagerland

# This Dockerfile will NOT WORK without a volume mapped to /work.
# Please use start.sh or at least read it, understand ut, and then copy it
# in your own environment BEFORE filing a bug

VOLUME /work
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git gcc gcc-avr avr-libc make -y
RUN git clone https://github.com/kairyu/tmk_keyboard_custom.git /tmk
RUN git clone https://github.com/kairyu/tmk_core_custom /tmk/tmk_core_custom
COPY lib/* /tmk/keyboard/gh60/
RUN chmod a+x /tmk/keyboard/gh60/make.sh
RUN cd /tmk/keyboard/gh60 && patch < Makefile.patch Makefile && patch < config.h.patch config.h

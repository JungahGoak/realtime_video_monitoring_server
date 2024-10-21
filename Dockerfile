FROM alfg/nginx-rtmp

# Nginx 설정 파일 복사
COPY nginx.conf /etc/nginx/nginx.conf
COPY /static/index.html /www/static/index.html

# 로그 디렉터리와 HLS 디렉터리 생성 및 권한 부여
RUN mkdir -p /var/log/nginx /tmp/hls/front /tmp/hls/back \
    && chmod -R 777 /var/log/nginx /tmp/hls \
    && chown -R root:root /tmp/hls  # root 사용자로 소유권 변경

# Janus 설정 파일 복사
COPY janus.jcfg /opt/janus/etc/janus/janus.jcfg
COPY janus.plugin.streaming.jcfg /opt/janus/etc/janus/janus.plugin.streaming.jcfg

# 포트 노출
EXPOSE 80 1935 8088 8089 5004/udp 10000-10200/udp

# Nginx 실행 명령
CMD ["nginx", "-g", "daemon off;"]


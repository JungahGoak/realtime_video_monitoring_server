FROM alfg/nginx-rtmp

# Nginx 설정 파일 복사
COPY nginx.conf /etc/nginx/nginx.conf
COPY /static/index.html /www/static/index.html

# 로그 디렉터리와 HLS 디렉터리 생성
RUN mkdir -p /var/log/nginx /tmp/hls/front /tmp/hls/back && chmod -R 777 /var/log/nginx /tmp/hls

# 포트 노출
EXPOSE 80 1935

# Nginx 실행 명령
CMD ["nginx", "-g", "daemon off;"]


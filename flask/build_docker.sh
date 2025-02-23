#!/bin/sh
app="test" # กำหนดตัวแปรชื่อ "app" ให้มีค่าเป็น "test"
docker build -t ${app} . # สร้าง Docker image โดยใช้ชื่อ "test" จาก Dockerfile ในโฟลเดอร์ปัจจุบัน (.)
docker run -p 5001:8000 -d \
  --name=${app} \
  -v $PWD:/flask_app ${app}
<<<<<<< HEAD
=======

>>>>>>> Initial commit

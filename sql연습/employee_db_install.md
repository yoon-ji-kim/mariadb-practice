## How to employees DB Install(restore)

1. 백업 DB 압축 풀기
```sh
  # yum -y install unzip
  # mv /home/webmaster/employees_db.zip  ./
  # unzip employees_db.zip
  # ls employees_db
```

2. employees 데이터베이스 생성, HR 계정 생성 및 권한 주기
```sh
  # mysql -u root -p
  Enter Password:
  MariaDB [(none)]> create database employees
  MariaDB [(none)]> show databases;
                                                              비밀번호
  MariaDB [(none)]> create user 'hr'@'192.168.%' identified by 'hr';
  MariaDB [(none)]> grant all privileges on employees.* to 'hr'@'192.168.%';
  MariaDB [(none)]> flush privileges;
  MariaDB [(none)]> flush privileges;
  MariaDB [(none)]> flush privileges;
```

3. restore
```sh
 # pwd  
 # cd employees_db 
                               < : 리다이렉트
 # mysql -u hr -D employees -p < employees.sql
 # mysql -u root -D employees -p < employees.sql
 Enter Password:
```

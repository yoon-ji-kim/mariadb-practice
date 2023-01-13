-- 1. 카테고리 넣기
desc category;
insert into category values (null, '소설'),
							(null, '수필'),
                            (null, '컴퓨터/IT'),
                            (null, '인문'),
                            (null, '경제'),
                            (null, '예술');
select no, name, password, email, address 
from user;
select *
from category;
-- 2. 서적 넣기
desc book;
insert into book values(null, '불편한 편의점', 14000, 1, 1),
						(null, '하얼빈', 16000, 1, 1),
                        (null, '모든 것은 기본에서 시작한다', 16000, 2, 2),
                        (null, '기분이 태도가 되지 말자', 16000, 2, 2),
                        (null, '진짜 쓰는 실무 엑셀', 21000, 2, 3),
                        (null, '혼자 공부하는 파이썬', 22000, 1, 3),
                        (null, '만일 내가 인생을 다시 산다면', 17200, 1, 4),
                        (null, '내가 틀릴 수도 있습니다', 16000, 1, 4),
                        (null, '트렌드 코리아 2023', 19000, 1, 5),
                        (null, '머니 트렌드 2023', 19000, 1, 5),
                        (null, '방구석 미술관', 16800, 1, 6),
                        (null, '버들 손글씨', 15000, 1, 6);
select * from book;
select no, title, price, stock, category_no
from book
where category_no = 1;
-- 3. 고객 정보 넣기
desc user;
insert into user values(null, '신짱구', '1234', 'chinzzang@gmail.com', '부산시 해운대구 센텀동로 41'),
						(null, '신짱아', '1234', 'zzanga@gmail.com', '부산시 해운대구 센텀동로 41'),
                        (null, '훈이', '2345', 'hooon@gmail.com', null),
                        (null, '맹구', '2345', 'maeng9@gmail.com', null),
                        (null, '철수', '2345', 'chulsoo@gmail.com', null ),
                        (null, '유리', '2345', 'yuri@gmail.com', null);
select * from user;
delete from book
where no = 2;
-- 4. 고객이 카트에 도서 넣기(여러개 해보자)
desc cart;
insert into cart(user_no, book_no) values (1, 1);
insert into cart(user_no, book_no) values (1, 10);
select a.book_no, a.count ,b.title, b.price
from cart a, book b
where a.book_no = b.no
and user_no = 1 and status ='N';
-- 카트에 넣은 book stock 감소
update book set stock = stock-1
where no = 10;
select * from book;
-- 5. 주문 하기 (카트는 어떻게 할 지도 생각!)
desc orders;
-- 가격 합계 구하기
select sum(price)
from book a, cart b
where a.no = b.book_no
	and b.user_no = 1
    and status = 'N';
select * from cart;
select * from orders;
insert into orders values (null, 33000, '부산시 해운대구 센텀동로 41', 'Y',1);
select *
from cart
where user_no = 1
	and status = 'N';
select * from orders_detail;
insert into orders_detail values (null, 1, 1, 1);
insert into orders_detail values (null, 1, 10, 1);
select * from orders_detail;
select a.book_no, b.title, b.price, b.category_no
from orders_detail a, book b
where a.book_no = b.no
 and orders_no = 1;
update cart set status = 'Y'
where user_no = 1;
select * from cart;
select * from orders;
-- 6. 주문 도서 출력
desc orders_detail;
select *
from book;


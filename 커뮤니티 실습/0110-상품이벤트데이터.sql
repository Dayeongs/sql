INSERT INTO COMM_PRODUCT_CATEGORIES VALUES (1000, '문구');
INSERT INTO COMM_PRODUCT_CATEGORIES VALUES (1001, '컴퓨터');
INSERT INTO COMM_PRODUCT_CATEGORIES VALUES (1002, '주방');
INSERT INTO COMM_PRODUCT_CATEGORIES VALUES (1003, '가구');
INSERT INTO COMM_PRODUCT_CATEGORIES VALUES (1004, '가전');

INSERT INTO COMM_PRODUCT_COMPANIES
VALUES(2000, '삼성회사', '02-1111-1111', '서울특별시');
INSERT INTO COMM_PRODUCT_COMPANIES
VALUES(2001, 'LG회사', '02-2222-1111', '부산광역시');
INSERT INTO COMM_PRODUCT_COMPANIES
VALUES(2002, '현대회사', '02-3333-1111', '인천광역시');
INSERT INTO COMM_PRODUCT_COMPANIES
VALUES(2003, '대우회사', '02-4444-1111', '대전광역시');
INSERT INTO COMM_PRODUCT_COMPANIES
VALUES(2004, '한화회사', '02-5555-1111', '울산광역시');

INSERT INTO COMM_PRODUCT_STATUS VALUES (5000, '입고');
INSERT INTO COMM_PRODUCT_STATUS VALUES (5001, '판매중');
INSERT INTO COMM_PRODUCT_STATUS VALUES (5002, '재고없음');
INSERT INTO COMM_PRODUCT_STATUS VALUES (5003, '판매종료');

INSERT INTO COMM_EVENTS VALUES (7000, '무료배송', '1만원 이상 무료배송입니다.');
INSERT INTO COMM_EVENTS VALUES (7001, '당일배송', '오전 12시 이전 주문건에 대하여 당일배송합니다.');
INSERT INTO COMM_EVENTS VALUES (7002, '1+1', '1개 주문시 하나를 더 드립니다.');
INSERT INTO COMM_EVENTS VALUES (7003, '2+1', '2개 주문시 하나를 더 드립니다.');
INSERT INTO COMM_EVENTS VALUES (7004, '카드할인', '카드결제시 1% 할인해드립니다.');
INSERT INTO COMM_EVENTS VALUES (7005, '통신사할인', '통신사할인 중복가능 합니다.');

COMMIT;


CREATE TABLE COMM_FILE_BOARDS (
    FILE_BOARD_NO               NUMBER(6),
    FILE_BOARD_TITLE            VARCHAR2(255)   NOT NULL,
    FILE_BOARD_DESCRIPTION      VARCHAR2(2000)  NOT NULL,
    FILE_BOARD_DELETED          CHAR(1)         DEFAULT 'N',
    USER_NO                     NUMBER(4)       NOT NULL,
    FILE_BOARD_FILE_NAME        VARCHAR2(255)   NOT NULL,
    FILE_BOARD_FILE_SIZE        NUMBER,
    FILE_BOARD_UPDATED_DATE     DATE            DEFAULT SYSDATE,
    FILE_BOARD_CREATED_DATE     DATE            DEFAULT SYSDATE,
    
    CONSTRAINT FILE_BOARDNO_PK PRIMARY KEY(FILE_BOARD_NO),
    CONSTRAINT FILE_USERNO_FK FOREIGN KEY (USER_NO)
                              REFERENCES COMM_USERS (USER_NO)
);

CREATE SEQUENCE FILES_SEQ START WITH 100000 NOCACHE;

select
			A.file_board_no				as no,
			A.file_board_title			as title,
			A.file_board_description	as description,
			A.file_board_deleted		as deleted,
			A.user_no					as "user.no",
			B.user_name					as "user.name",
			A.file_board_file_name		as fileName,
			A.file_board_file_size 		as fileSize,
			A.file_board_updated_date	as updatedDate,
			A.file_board_created_date	as createdDate
from
			comm_file_boards A, comm_users B
where A.file_board_deleted = 'N'
and A.user_no = B.user_no
order by A.file_board_no desc;	





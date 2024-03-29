/*
    게시글 테이블과 댓글 테이블
*/
CREATE TABLE COMM_BOARDS (
    BOARD_NO NUMBER(6),
    BOARD_TITLE VARCHAR2(255) NOT NULL,
    USER_NO NUMBER(4) NOT NULL,
    BOARD_CONTENT VARCHAR2(2000) NOT NULL,
    BOARD_REPLY_CNT NUMBER(6) DEFAULT 0,
    BOARD_DELETED CHAR(1) DEFAULT 'N',
    BOARD_UPDATED_DATE DATE DEFAULT SYSDATE,
    BOARD_CREATED_DATE DATE DEFAULT SYSDATE,
    
    CONSTRAINT BOARDS_NO_PK PRIMARY KEY(BOARD_NO),
    CONSTRAINT BOARDS_USERNO_FK FOREIGN KEY (USER_NO)
                                REFERENCES COMM_USERS (USER_NO)
);

CREATE TABLE COMM_REPLIES (
    REPLY_NO NUMBER(6),
    USER_NO NUMBER(4) NOT NULL,
    BOARD_NO NUMBER(6) NOT NULL,
    REPLY_CONTENT VARCHAR2(1000) NOT NULL,
    REPLY_DELETED CHAR(1) DEFAULT 'N',
    REPLY_UPDATED_DATE DATE DEFAULT SYSDATE,
    REPLY_CREATED_DATE DATE DEFAULT SYSDATE,
    
    CONSTRAINT REPLIES_NO_PK PRIMARY KEY (REPLY_NO),
    CONSTRAINT REPLIES_USERNO_FK FOREIGN KEY (USER_NO)
                                 REFERENCES COMM_USERS (USER_NO),
    CONSTRAINT REPLIES_BOARDNO_FK FOREIGN KEY (BOARD_NO)
                                  REFERENCES COMM_BOARDS (BOARD_NO) 
);

CREATE SEQUENCE BOARDS_SEQ START WITH 100000 NOCACHE;
CREATE SEQUENCE REPLIES_SEQ START WITH 100000 NOCACHE;


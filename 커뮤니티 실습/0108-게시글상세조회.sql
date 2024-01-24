SELECT A.BOARD_NO               as no,
       A.BOARD_TITLE            as title,
       A.USER_NO                as "user.no",
       B.USER_NAME              as "user.name",
       A.BOARD_REPLY_CNT        as replyCnt,
       A.BOARD_CONTENT          as content,
       A.BOARD_CREATED_DATE     as createdDate,
       A.BOARD_UPDATED_DATE     as updatedDate
FROM COMM_BOARDS A, COMM_USERS B
WHERE A.BOARD_NO = 100001
AND A.USER_NO = B.USER_NO;
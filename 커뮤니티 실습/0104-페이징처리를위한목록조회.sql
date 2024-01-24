/*
    페이징 처리를 위한 목록 조회
    select
    from (select 컬럼, 컬럼, 컬럼, row_number() over (order by 컬럼명 desc) num
          from 테이블명)
    where
        num between 1 and 10;
        
    * row_number() over (order by 컬럼명) num
      지정된 컬럼명의 값을 기준으로 내림차순으로 행을 정렬하고 각 행에 순번을 부여한다.
*/
select A.board_no,
       A.board_title,
       A.user_no,
       B.user_name,
       A.board_reply_cnt, 
       A.board_created_date
from (select row_number() over (order by board_no desc) num,
             board_no, 
             board_title, 
             user_no, 
             board_content, 
             board_reply_cnt, 
             board_created_date
      from
            comm_boards
      where
            board_deleted = 'N') A, comm_users B
where A.num between 1 and 10
and A.user_no = B.user_no
order by A.board_no desc;

select count(*)
from comm_boards
where board_deleted = 'N';


commit;






















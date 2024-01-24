insert into comm_boards
(board_no, board_title, user_no, board_content)
values
(boards_seq.nextval, '연습-' || boards_seq.currval, 1000, '게시글 작성 연습입니다.');
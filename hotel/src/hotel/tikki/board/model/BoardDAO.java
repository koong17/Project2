package hotel.tikki.board.model;

public class BoardDAO {
	private int board_num;
	private String board_nick;
	private String board_content;
	private String board_date;
	private String board_title;
	private int cmnt_num;
	private String cmnt_content;


}


//board_num number primary key,
//board_nick varchar2(30) not null,
//board_content varchar2(2000) not null,
//board_date date,
//board_title varchar2(50) not null,
//CONSTRAINT board_fk_id foreign key(board_nick)
//REFERENCES member(nickname) on delete cascade
//
//cmnt_num number, -- 댓글번호
//board_num number, -- 글번호
//cmnt_content varchar2(2000) not null,
//cmnt_nick varchar2(30),
//cmnt_date date,
//CONSTRAINT cmnt_fk_id foreign key(cmnt_nick)
//REFERENCES member(nickname) on delete cascade
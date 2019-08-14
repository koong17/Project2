
drop table comments;

drop table board;

drop table reservation;

drop table rooms;

drop table member;

create table member(
    id varchar2(50) primary key,
    password varchar2(30) not null,
    nickname varchar2(30) unique not null,
    phone varchar2(30) not null
);


create table rooms(
    room_num number(10) primary key,   
    type varchar2(30) not null,
    max_ppl number(10) not null, 
    price number(10) not null
);


create table reservation(
    room_num number(10) not null, 
    rsrv_num number(10) not null,
    check_in date, 
    check_out date, 
    rsrv_ppl number(10) not null, 
    rsrv_nick varchar2(30) not null,
    rsrv_status CHAR(1) not null, 
    CONSTRAINT rsrv_fk_num foreign key(room_num)
    REFERENCES rooms(room_num) on delete cascade,
    CONSTRAINT rsrv_fk_id foreign key(rsrv_nick)
    REFERENCES member(nickname) on delete cascade
);

create table board(
    board_num number primary key,
    board_nick varchar2(30) not null,
    board_content varchar2(2000) not null,
    board_date date,
    board_title varchar2(50) not null,
    CONSTRAINT board_fk_id foreign key(board_nick)
    REFERENCES member(nickname) on delete cascade
);

create table comments(
    cmnt_num number,
    board_num number, 
    cmnt_content varchar2(2000) not null,
    cmnt_nick varchar2(30),
    cmnt_date date,
    CONSTRAINT cmnt_fk_id foreign key(cmnt_nick)
    REFERENCES member(nickname) on delete cascade
);
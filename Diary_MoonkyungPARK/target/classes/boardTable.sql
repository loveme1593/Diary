//회원정보
create table board_customer( 
 cus_id varchar(50) primary key,
 cus_pw varchar(50) not null,
 cus_gender varchar(6) not null,
 cus_nickname varchar(50) not null,
 cus_question int not null,
 cus_answer varchar(50) not null,
 cus_hobbies varchar(5000) not null
 );
 
 //친구테이블
 create table board_friend(
 cus_id varchar(50),
 cus_gender varchar(6),
 cus_nickname varchar(50),
 cus_hobbies varchar(5000),
 friend_id varchar(50),
 cus_status varchar(30),
 foreign key(cus_id) references board_customer(cus_id)
 on delete cascade
 );
 
 //메세지
 create table board_message(
 message_num int auto_increment primary key,
 cus_id varchar(50) not null,
 friend_id varchar(50) not null,
 message_title varchar(50) not null,
 message varchar(5000) not null,
 cus_status varchar(50),
 friend_status varchar(50),
 message_date datetime default CURRENT_TIMESTAMP,
 foreign key(cus_id) references board_customer(cus_id)
 on delete cascade
 );
 
 //게시판
 create table board(
 board_num int auto_increment,
 board_title varchar(100) not null,
 board_content varchar(1000) not null,
 board_date datetime default CURRENT_TIMESTAMP,
 board_id varchar(50) not null,
 board_nickname varchar(50) not null,
 board_hits int default 0,
 board_replies int default 0,
 //공개범위
 board_see varchar(50) not null,
 primary key(board_num)
 );
 
 //댓글
 create table reply(
 board_num int,
 reply_num int auto_increment primary key,
 rreply_num int,
 reply_id varchar(50) not null,
 reply_content varchar(200),
 reply_date datetime default CURRENT_TIMESTAMP,
 reply_nickname varchar(50) not null,
 rreply_id varchar(50),
 rreply_nickname varchar(50),
 foreign key(board_num) references board(board_num)
 on delete cascade
 );
 
 


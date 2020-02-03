CREATE TABLE MEMBER(
	MEMBER_ID VARCHAR2(50),
	MEMBER_PASSWORD VARCHAR2(50) NOT NULL,
	MEMBER_PASSWORD_SALT VARCHAR2(10) NOT NULL,
	MEMBER_NAME VARCHAR2(20) NOT NULL,
	MEMBER_POWER NUMBER(2) DEFAULT 0 NOT NULL,
	MEMBER_POINT NUMBER(10) DEFAULT 0 NOT NULL,
	MEMBER_ACT NUMBER(10) DEFAULT 0 NOT NULL,
	MEMBER_DATE DATE DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY(MEMBER_ID)
);
CREATE TABLE MEMBER_LOG(
	MEMBER_LOG_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	MEMBER_LOG_CATEGORY NUMBER(2) NOT NULL,
	MEMBER_REF_ID NUMBER NOT NULL,
	MEMBER_LOG_DATE DATE DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY(MEMBER_LOG_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);
CREATE SEQUENCE MEMBER_LOG_SEQ;

CREATE TABLE ALERT(
	ALERT_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	ALERT_CATEGORY NUMBER(2) NOT NULL,
	ALERT_REF_ID NUMBER NOT NULL,
	ALERT_REQ_MEMBER VARCHAR2(50) NOT NULL,
	ALERT_CHECK NUMBER(1) NOT NULL,
	ALERT_DATE DATE NOT NULL,
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY(ALERT_REQ_MEMBER) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);
CREATE SEQUENCE ALERT_SEQ;

CREATE TABLE PROFILE(
	MEMBER_ID VARCHAR2(50),
	PROFILE_REAL_NAME VARCHAR2(20),
	PROFILE_IMG_FILE VARCHAR2(50),
	PROFILE_IMG_ORI VARCHAR2(100),
	PROFILE_TECH_FRONT VARCHAR2(100),
	PROFILE_TECH_BACK VARCHAR2(100),
	PROFILE_BLOG VARCHAR2(100),
	PROFILE_JOB VARCHAR2(50),
	PROFILE_PAY VARCHAR2(10),
	PROFILE_EMAIL VARCHAR2(50),
	PROFILE_PHONE VARCHAR2(50),
	PROFILE_GIT VARCHAR2(50),
	PROFILE_INTRO VARCHAR2(300),
	PROFILE_YEAR VARCHAR2(20),
	PROFILE_STRENGTH1 VARCHAR2(100),
	PROFILE_STRENGTH2 VARCHAR2(100),
	PROFILE_TECH_INTRO VARCHAR2(1000),
	PRIMARY KEY(MEMBER_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);

CREATE TABLE EDU(
	EDU_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	EDU_NAME VARCHAR2(20) NOT NULL,
	EDU_MAJOR VARCHAR2(20) NOT NULL,
	EDU_DEGREE VARCHAR2(20) NOT NULL,
	EDU_START DATE NOT NULL,
	EDU_END DATE NOT NULL,
	EDU_GRADE VARCHAR2(10),
	EDU_GRADE_MAX VARCHAR2(10),
	EDU_ETC VARCHAR2(100),
	PRIMARY KEY(EDU_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);


CREATE SEQUENCE EDU_SEQ;

CREATE TABLE AWARD_LICENSE(
	AWARD_LICENSE_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	AWARD_LICENSE_TITLE VARCHAR2(30) NOT NULL,
	AWARD_LICENSE_DATE DATE NOT NULL,
	PRIMARY KEY(AWARD_LICENSE_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);

CREATE SEQUENCE AWARD_LICENSE_SEQ;

CREATE TABLE PORTFOLIO(
	PORT_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	PORT_SUBJECT VARCHAR2(100) NOT NULL,
	PORT_CONTENT VARCHAR2(3000) NOT NULL,
	PORT_FILE_PATH VARCHAR2(50),
	PORT_ORI_FILE VARCHAR2(1000),
	PORT_START_DAY DATE NOT NULL,
	PORT_END_DAY DATE NOT NULL,
	PORT_TEAM NUMBER(1) NOT NULL,
	PORT_GITHUB VARCHAR2(200),
	PORT_SITE VARCHAR2(200),
	PORT_SHOW NUMBER(1) NOT NULL,
	PORT_FEED_NEED NUMBER(1) NOT NULL,
    PORT_REGIDATE DATE DEFAULT SYSDATE NOT NULL,
	PORT_READCOUNT NUMBER NOT NULL,
	PRIMARY KEY(PORT_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);

CREATE SEQUENCE PORTFOLIO_SEQ;

CREATE TABLE FOREIGN(
	FOREIGN_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	FOREIGN_NAME VARCHAR2(10) NOT NULL,
	FOREIGN_TEST_NAME VARCHAR2(30) NOT NULL,
	FOREIGN_TEST_GRADE VARCHAR2(10) NOT NULL,
	PRIMARY KEY(FOREIGN_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);

CREATE SEQUENCE FOREIGN_SEQ;

CREATE TABLE PORT_RECOMMEND(
	PORT_RECO_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	PORT_ID NUMBER NOT NULL,
	PORT_RECO_DATE DATE NOT NULL,
	PRIMARY KEY(PORT_RECO_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY(PORT_ID) REFERENCES PORTFOLIO(PORT_ID) ON DELETE CASCADE
);

CREATE SEQUENCE PORT_RECOMMEND_SEQ;

CREATE TABLE FEED_REQUEST(
	FEED_REQ_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	PORT_ID NUMBER NOT NULL,
	FEED_REQ_RES NUMBER(1) NOT NULL,
	FEED_REQ_DATE DATE NOT NULL,
	PRIMARY KEY(FEED_REQ_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY(PORT_ID) REFERENCES PORTFOLIO(PORT_ID) ON DELETE CASCADE
);

CREATE SEQUENCE FEED_REQUEST_SEQ;

CREATE TABLE PORT_FEEDBACK(
	FEEDBACK_ID NUMBER,
	PORT_ID NUMBER NOT NULL,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	FEEDBACK_CONTENT VARCHAR2(1000) NOT NULL,
	REG_DATE DATE NOT NULL,
	PRIMARY KEY(FEEDBACK_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY(PORT_ID) REFERENCES PORTFOLIO(PORT_ID) ON DELETE CASCADE
);

CREATE SEQUENCE PORT_FEEDBACK_SEQ;

CREATE TABLE PORT_FEEDBACK_RECOMMEND(
	PF_RECO_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	FEEDBACK_ID NUMBER NOT NULL,
	PF_RECO_DATE DATE NOT NULL,
	PRIMARY KEY(PF_RECO_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY(FEEDBACK_ID) REFERENCES PORT_FEEDBACK(FEEDBACK_ID) ON DELETE CASCADE
);

CREATE SEQUENCE PORT_FEEDBACK_RECOMMEND_SEQ;

CREATE TABLE PORT_SCRAP(
	PORT_SCRAP_ID NUMBER,
	PORT_ID NUMBER NOT NULL,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	PORT_SCRAP_DATE DATE NOT NULL,
	PRIMARY KEY(PORT_SCRAP_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY(PORT_ID) REFERENCES PORTFOLIO(PORT_ID) ON DELETE CASCADE
);

CREATE SEQUENCE PORT_SCRAP_SEQ;

CREATE TABLE BOARD(
	BOARD_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	BOARD_CATEGORY VARCHAR(2) NOT NULL,
	BOARD_PASSWORD VARCHAR2(50) NOT NULL,
	BOARD_SUBJECT VARCHAR2(100) NOT NULL,
	BOARD_CONTENT VARCHAR2(3000) NOT NULL,
	BOARD_RE_REF NUMBER NOT NULL,
	BOARD_RE_LEV NUMBER(10) NOT NULL,
	BOARD_RE_SEQ NUMBER(10) NOT NULL,
	BOARD_READCOUNT NUMBER(15) NOT NULL,
	BOARD_DATE DATE NOT NULL,
	PRIMARY KEY(BOARD_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);

CREATE SEQUENCE BOARD_SEQ;

CREATE TABLE BOARD_COMMENT(
	BOARD_CO_ID NUMBER,
	BOARD_ID NUMBER NOT NULL,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	BOARD_CO_CONTENT VARCHAR2(300) NOT NULL,
	BOARD_CO_DATE DATE NOT NULL,
	PRIMARY KEY(BOARD_CO_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY(BOARD_ID) REFERENCES BOARD(BOARD_ID) ON DELETE CASCADE
);

CREATE SEQUENCE BOARD_COMMENT_SEQ;

CREATE TABLE BAD_REPORT(
	BAD_REPORT_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	BOARD_ID NUMBER NOT NULL,
	BAD_REPORT_CONTENT VARCHAR2(20) NOT NULL,
	BAD_REPORT_DATE DATE NOT NULL,
	PRIMARY KEY(BAD_REPORT_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY(BOARD_ID) REFERENCES BOARD(BOARD_ID) ON DELETE CASCADE
);

CREATE SEQUENCE BAD_REPORT_SEQ;

CREATE TABLE BOARD_FILE(
	BOARD_FILE_ID NUMBER,
	BOARD_ID NUMBER NOT NULL,
	BOARD_FILE VARCHAR2(50) NOT NULL,
	BOARD_FILE_ORIGINAL VARCHAR2(50) NOT NULL,
	PRIMARY KEY(BOARD_FILE_ID),
	FOREIGN KEY(BOARD_ID) REFERENCES BOARD(BOARD_ID) ON DELETE CASCADE
);

CREATE SEQUENCE BOARD_FILE_SEQ;

CREATE TABLE ACTIVE(
	ACTIVE_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	ACTIVE_NAME VARCHAR2(30) NOT NULL,
	ACTIVE_START DATE NOT NULL,
	ACTIVE_END DATE NOT NULL,
	PRIMARY KEY(ACTIVE_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);

CREATE SEQUENCE ACTIVE_SEQ;

CREATE TABLE BOARD_RECOMMEND(
	BOARD_RECO_ID NUMBER,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	BOARD_ID NUMBER NOT NULL,
	BOARD_RECO_DATE DATE NOT NULL,
	PRIMARY KEY(BOARD_RECO_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY(BOARD_ID) REFERENCES BOARD(BOARD_ID) ON DELETE CASCADE
);

CREATE SEQUENCE BOARD_RECO_ID;

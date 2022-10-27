/* 수업시간표 */
SELECT GWAMOK_NO
     , BUNBAN_NO
     , DAY_CODE
     , MAX(DECODE(TIME_NO,1,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,2,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,3,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,4,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,5,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,6,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,7,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,8,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,9,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,10,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,11,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,12,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,13,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,14,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))||
       MAX(DECODE(TIME_NO,15,'<'||Day_Name||Time_No||'><과목명>'||Gwamok_Name||'</과목명><교수명>'||Member_Name||'</교수명><강의실>'||Loc_Name||'</강의실></'||Day_Name||Time_No||'>',''))
       AS Time_No
  FROM (SELECT H6.LT_NO                                                                                           AS GWAMOK_NO,
               H6.DIVCLS_CD                                                                                       AS BUNBAN_NO,
               H5.SC_NM                                                                                           AS GWAMOK_NAME,
               ADMIN.SF_STAF_GET_EMP_INFO(H6.MNGT_PROF_EMP_NO, 'NM')                                              AS MEMBER_NAME,
               COMMN.SF_CODE_NM('C0005', H2.DAY_GBN)                                                              AS DAY_NAME,
               H2.DAY_GBN                                                                                         AS DAY_CODE,
               H2.LECTM_CD                                                                                        AS TIME_NO,
               (SELECT UNIVT.SF_UBCOUR_GET_COURTIME('BUILD',H1.YY, H1.TM_GBN, H1.LT_NO, H1.DIVCLS_CD) FROM DUAL)  AS LOC_NAME
          FROM GRSCH.GBCOUR0100  H5,
               GRSCH.GBCOUR0320  H2,
               GRSCH.GBCOUR0300  H6,
               GRSCH.GBTLSN0100  H1
         WHERE H1.YY = ?
           AND H1.TM_GBN=?
           AND H1.STUNO = ?
           AND H1.YY = H6.YY
           AND H1.TM_GBN = H6.TM_GBN
           AND H1.LT_NO = H6.LT_NO
           AND H1.DIVCLS_CD = H6.DIVCLS_CD
           AND H1.YY = H2.YY
           AND H1.TM_GBN = H2.TM_GBN
           AND H1.LT_NO = H2.LT_NO
           AND H1.DIVCLS_CD = H2.DIVCLS_CD
           AND H6.SC_CD = H5.SC_CD
         ORDER BY H2.DAY_GBN, H2.LECTM_CD)
 GROUP BY GWAMOK_NO, BUNBAN_NO, DAY_CODE
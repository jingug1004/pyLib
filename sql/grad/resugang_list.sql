/* 재수강 신청 대상 과목 */
SELECT SUGANG.YY                                    AS THIS_YEAR,
       SUGANG.TM_GBN                                AS HAKGI,
       SUGANG.LT_NO                                 AS OPEN_GWAMOK_NO,
       SUGANG.DIVCLS_CD                             AS BUNBAN_NO,
       SUGANG.LT_NO||'-'||SUGANG.DIVCLS_CD          AS HAKSU_NO,
       SUGANG.ACQ_GRD                               AS GET_GRADE,
       COURSE.SC_NM                                 AS GWAMOK_NAME,
       COURSE.HP                                    AS HAKJUM_NUM,
       COMMN.SF_CODE_NM('UB001', SUGANG.CPTN_GBN)   AS      OPEN_NAME
  FROM GRSCH.GBCOUR0100 COURSE,
       GRSCH.GCSCOR0100 SUGANG
 WHERE SUGANG.STUNO = ?
   AND TRIM(SUGANG.ACQ_GRD) IN ('C+','C','D+','D','F','NP')
   AND NOT (SUGANG.SC_CD BETWEEN '0020' AND '0028')
   AND SUGANG.SC_CD = COURSE.SC_CD
 ORDER BY THIS_YEAR DESC, HAKGI DESC
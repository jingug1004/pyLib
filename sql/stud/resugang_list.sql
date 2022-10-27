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
  FROM UNIVT.UBCOUR0100 COURSE,
       UNIVT.UCSCOR0100 SUGANG,
       UNIVT.UBTLSN0200 APLY
 WHERE SUGANG.STUNO = ?
   --AND TRIM(SUGANG.ACQ_GRD) IN ('C+','C','D+','D','F','NP')
   and NVL(SUGANG.ACQ_GRD,'X')
       IN (SELECT MRKS_GRD
             FROM UNIVT.UCBASE0100 X
            WHERE NVL(X.REPEAT_ALLW_GRD_YN,'0') ='1')
   AND NOT (SUGANG.SC_CD BETWEEN '00020' AND '00028')
   AND SUGANG.SC_CD = COURSE.SC_CD
   AND SUGANG.YY        = APLY.YY
   AND SUGANG.TM_GBN    = APLY.TM_GBN
   AND SUGANG.LT_NO     = APLY.LT_NO
   AND SUGANG.DIVCLS_CD = APLY.DIVCLS_CD
   AND SUGANG.STUNO     = APLY.STUNO
 ORDER BY THIS_YEAR DESC, HAKGI DESC
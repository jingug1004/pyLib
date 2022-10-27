/* 교양선택 */
SELECT BUNBAN.YY                                                           AS THIS_YEAR,
       BUNBAN.TM_GBN                                                       AS HAKGI,
       BUNBAN.LT_NO                                                        AS OPEN_GWAMOK_NO,
       BUNBAN.DIVCLS_CD                                                    AS BUNBAN_NO,
       BUNBAN.LT_NO||'-'||BUNBAN.DIVCLS_CD                                 AS HAKSU_NO,
       COURSE.SC_NM                                                        AS GWAMOK_NAME,
       BUNBAN.HY                                                           AS OPEN_GRADE,
       BUNBAN.CPTN_GBN                                                     AS OPEN_CODE,
       (SELECT COMMN.SF_CODE_NM('UB001', BUNBAN.CPTN_GBN) FROM DUAL)       AS OPEN_NAME,
       (SELECT DEPT_NM FROM ADMIN.AABASE0100 WHERE DEPT_CD=BUNBAN.DEPT_CD) AS CLASS_NAME,
       BUNBAN.HP                                                           AS HAKJUM_NUM,
       BUNBAN.PRTNT_CLASS_NM                                               AS BAN_NAME,
       ADMIN.SF_STAF_GET_EMP_INFO(BUNBAN.MNGT_PROF_EMP_NO, 'NM')           AS MEMBER_NAME,
       COMMN.SF_CODE_NM('UB028', BUNBAN.DAYNGT_GBN)                        AS OPEN_DAY_NAME,
       (SELECT UNIVT.SF_UBCOUR_GET_COURTIME('AB',BUNBAN.YY,BUNBAN.TM_GBN,BUNBAN.LT_NO,BUNBAN.DIVCLS_CD) FROM DUAL) AS LOC_NAME
  FROM UNIVT.UBCOUR0100 COURSE,
       UNIVT.UBCOUR0300 BUNBAN,
       ADMIN.AABASE0100 DEPT
 WHERE BUNBAN.YY    = ?
   AND BUNBAN.TM_GBN            = ?
   @QUERY
   AND COURSE.SC_CD = BUNBAN.SC_CD
   AND NVL(BUNBAN.CLS_CLSS_YN,'0') = '0'
   AND BUNBAN.DEPT_CD = DEPT.DEPT_CD
 ORDER BY COURSE.SC_NM, OPEN_GWAMOK_NO, BUNBAN_NO
/* 장바구니 */
SELECT BASKET.YY                                                                                     AS THIS_YEAR
     , BASKET.TM_GBN                                                                                 AS HAKGI
     , BASKET.LT_NO                                                                                  AS OPEN_GWAMOK_NO
     , BASKET.DIVCLS_CD                                                                              AS BUNBAN_NO
     , BASKET.LT_NO || '-' || BASKET.DIVCLS_CD                                                       AS HAKSU_NO
     , COURSE.SC_NM                                                                                  AS GWAMOK_NAME
     , BUNBAN.HP                                                                                     AS HAKJUM_NUM
     , (SELECT DEPT_NM FROM ADMIN.AABASE0100 WHERE DEPT_CD=BUNBAN.DEPT_CD)                           AS CLASS_NAME
     , BASKET.HY                                                                                     AS OPEN_GRADE
     , (SELECT COMMN.SF_CODE_NM('UB001', BASKET.CPTN_GBN) FROM DUAL)                                 AS OPEN_NAME
     , (SELECT COMMN.SF_CODE_NM('UB028', BUNBAN.DAYNGT_GBN) FROM DUAL)                               AS OPEN_DAY_NAME
     , (SELECT UNIVT.SF_UBCOUR_GET_COURTIME('AB',BUNBAN.YY,BUNBAN.TM_GBN,BUNBAN.LT_NO,BUNBAN.DIVCLS_CD) FROM DUAL) AS LOC_NAME
     , ADMIN.SF_STAF_GET_EMP_INFO(BUNBAN.MNGT_PROF_EMP_NO, 'NM')                                     AS MEMBER_NAME
     , DECODE(BASKET.REPEAT_YN, '1', 'Y', '')                                                  AS REBASKET_OPT
     , BASKET.REPEAT_YY                                                                              AS RETEMP_THIS_YEAR
     , BASKET.REPEAT_TM_GBN                                                                          AS RETEMP_HAKGI
     , BASKET.REPEAT_LT_NO                                                                           AS RETEMP_OPEN_GWAMOK_NO
     , BASKET.REPEAT_DIVCLS_CD                                                                       AS RETEMP_BUNBAN_NO
  FROM UNIVT.UBCOUR0100 COURSE
     , UNIVT.UBCOUR0300 BUNBAN
     , UNIVT.UBTLSN0210 BASKET
 WHERE BASKET.YY = ?
   AND BASKET.TM_GBN = ?
   AND BASKET.STUNO = ?
   AND BASKET.YY = BUNBAN.YY
   AND BASKET.TM_GBN = BUNBAN.TM_GBN
   AND BASKET.LT_NO = BUNBAN.LT_NO
   AND BASKET.DIVCLS_CD = BUNBAN.DIVCLS_CD
   AND COURSE.SC_CD = BUNBAN.SC_CD
 ORDER BY LOC_NAME
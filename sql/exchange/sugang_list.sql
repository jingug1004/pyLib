/* 수강신청 내역 */
SELECT (SELECT COMMN.SF_CODE_NM('UB028', H1.DAYNGT_GBN) FROM DUAL)                                                              AS DAY_OPT,
       H6.LT_NO                                                                                                                 AS OPEN_GWAMOK_NO,
       H6.DIVCLS_CD                                                                                                             AS BUNBAN_NO,
       H6.LT_NO||'-'||H6.DIVCLS_CD                                                                                              AS HAKSU_NO,
       TO_CHAR(TO_NUMBER(DECODE(H1.TLSN_YRSYS_SINGLE_GBN,'00','',H1.TLSN_YRSYS_SINGLE_GBN)))                                    AS GRADE_OPT,
       H6.CPTN_GBN                                                                                                              AS OPEN_CODE,
       (SELECT COMMN.SF_CODE_NM('UB001', H6.CPTN_GBN) FROM DUAL)                                                                AS ISU_NM,
       DECODE(H1.HP,'',DECODE(H1.PASS_SC_YN,'1','P'),H1.HP)                                                                     AS HAKJUM,
       H1.HP                                                                                                                    AS HAKJUM_NUM,
       H1.CULT_CD                                                                                                               AS CULTURE_CODE,
       ADMIN.SF_STAF_GET_EMP_INFO(H1.MNGT_PROF_EMP_NO, 'NM')                                                                    AS MEMBER_NAME,
       H2.SC_NM                                                                                                                 AS GWAMOK_KNAME,
       (SELECT SUBSTR(UNIVT.SF_UBCOUR_GET_COURTIME('LECTM',H6.YY,H6.TM_GBN,H6.LT_NO,H6.DIVCLS_CD),1,1) FROM DUAL)               AS DAY,
       (SELECT REPLACE(SUBSTR(UNIVT.SF_UBCOUR_GET_COURTIME('LECTM',H6.YY,H6.TM_GBN,H6.LT_NO,H6.DIVCLS_CD),3),')','') FROM DUAL) AS TIME_NO,
       (SELECT UNIVT.SF_UBCOUR_GET_COURTIME('BUILD',H6.YY,H6.TM_GBN,H6.LT_NO,H6.DIVCLS_CD) FROM DUAL)                           AS LOC_NAME,
       DECODE(H1.PASS_SC_YN,'1','Y','0','','')                                                                                  AS PASS_OPT
  FROM UNIVT.UBCOUR0300 H1
     , UNIVT.UBCOUR0100 H2
     , UNIVT.UBTLSN0200 H6
 WHERE H6.YY        = ?
   AND H6.TM_GBN    = ?
   AND H6.STUNO     = ?
   AND H6.YY        = H1.YY
   AND H6.TM_GBN    = H1.TM_GBN
   AND H6.LT_NO     = H1.LT_NO
   AND H6.DIVCLS_CD = H1.DIVCLS_CD
   AND H1.SC_CD     = H2.SC_CD
 ORDER BY 7,8
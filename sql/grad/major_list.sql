/* 전공과목조회 */
SELECT H1.YY                                                                                 AS THIS_YEAR,
       H1.TM_GBN                                                                             AS HAKGI,
       H6.COLG_CD                                                                            AS OPEN_ORGAN_CODE,
       H6.HG_CD                                                                              AS OPEN_CLASS_CODE,
       H6.MJ_CD                                                                              AS OPEN_MAJOR_CODE,
       H1.HY                                                                                 AS OPEN_GRADE,
       (SELECT COMMN.SF_CODE_NM('UB028', H1.DAYNGT_GBN) FROM DUAL)                           AS DAY_OPT,
       H1.LT_NO                                                                              AS OPEN_GWAMOK_NO,
       H1.DIVCLS_CD                                                                          AS BUNBAN_NO,
       H1.LT_NO||'-'||H1.DIVCLS_CD                                                           AS HAKSU_NO,
       TO_CHAR(TO_NUMBER(DECODE(H1.TLSN_YRSYS_SINGLE_GBN,'00','',H1.TLSN_YRSYS_SINGLE_GBN))) AS GRADE_OPT, /* 변환 */
       H1.CPTN_GBN                                                                           AS OPEN_CODE,
       H1.HP                                                                                 AS HAKJUM_NUM,
       ''                                                                                    AS CULTURE_CODE,
       ADMIN.SF_STAF_GET_EMP_INFO(H1.MNGT_PROF_EMP_NO, 'NM')                                 AS MEMBER_NAME,
       H2.SC_NM                                                                              AS GWAMOK_KNAME,
       (SELECT SUBSTR(GRSCH.SF_GBCOUR_GET_COURTIME('LECTM',H1.YY,H1.TM_GBN,H1.LT_NO,H1.DIVCLS_CD),1,1) FROM DUAL)               AS DAY,
       (SELECT REPLACE(SUBSTR(GRSCH.SF_GBCOUR_GET_COURTIME('LECTM',H1.YY,H1.TM_GBN,H1.LT_NO,H1.DIVCLS_CD),3),')','') FROM DUAL) AS TIME_NO,
       (SELECT GRSCH.SF_GBCOUR_GET_COURTIME('BUILD',H1.YY,H1.TM_GBN,H1.LT_NO,H1.DIVCLS_CD) FROM DUAL)                           AS LOC_NAME,
       DECODE(H1.PASS_SC_YN,'1','Y','0','','')                                                                                  AS PASS_OPT,
       H1.THEORY_HOUR                                            AS SISU_NUM,
       SUBSTR(H1.DEGR_GBN,2,1)                                   AS COURSE_OPT,
       (SELECT COMMN.SF_CODE_NM('UB001', H1.CPTN_GBN) FROM DUAL) AS ISU_NM,
       (SELECT COMMN.SF_CODE_NM('EC201', H1.DEGR_GBN) FROM DUAL) AS DEGR_GBN_NM,
       DECODE(H1.HY,9,'제한없음',H1.HY||REPLACE(REPLACE((SELECT COMMN.SF_CODE_NM('UB017', H1.tlsn_yrsys_single_gbn) FROM DUAL),'해당',''),'이상','학년이상')) AS HY,
       H6.DEPT_NM
  FROM GRSCH.GBCOUR0300 H1
     , GRSCH.GBCOUR0100 H2
     , ADMIN.AABASE0100 H6
 WHERE H1.YY        = ?
   AND H1.TM_GBN    = ?
   AND H1.SC_CD     = H2.SC_CD
   AND H1.DEPT_CD   = H6.DEPT_CD
   AND NVL(H1.CLS_CLSS_YN,'0') = '0'
   AND ((H1.DEGR_GBN IS NULL) OR  (H1.DEGR_GBN = ?))
   AND ((NVL(H1.TLSN_YRSYS_SINGLE_GBN,'00') = '00')  OR
             (H1.TLSN_YRSYS_SINGLE_GBN = '01' AND H1.HY <= ?) OR
             (H1.TLSN_YRSYS_SINGLE_GBN = '02' AND H1.HY >= ?) OR
             (H1.TLSN_YRSYS_SINGLE_GBN = '03' AND H1.HY = ?)
             )
   AND H1.DEPT_CD IN (SELECT ? FROM DUAL
                      UNION ALL
                      SELECT ? FROM DUAL
                      UNION ALL
                      SELECT ? FROM DUAL
                      UNION ALL
                      SELECT ? FROM DUAL
                      UNION ALL
                      SELECT ? FROM DUAL
                      UNION ALL
                      SELECT ? FROM DUAL)
 ORDER BY 16
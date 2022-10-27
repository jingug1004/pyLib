/* 재수강 할수 있는 과목들 */
SELECT  BUNBAN.LT_NO                               AS OPEN_GWAMOK_NO,
        BUNBAN.DIVCLS_CD                           AS BUNBAN_NO,
        BUNBAN.LT_NO||'-'||BUNBAN.DIVCLS_CD        AS HAKSU_NO,
        COURSE.SC_NM                               AS GWAMOK_NAME,
        COMMN.SF_CODE_NM('UB001', BUNBAN.CPTN_GBN) AS OPEN_NAME,
        BUNBAN.HP                                  AS HAKJUM_NUM
  FROM  UNIVT.UBCOUR0100    COURSE,
        UNIVT.UBCOUR0300    BUNBAN
 WHERE  BUNBAN.YY   = ?
   AND  BUNBAN.TM_GBN           = ?
   AND  BUNBAN.SC_CD = COURSE.SC_CD
   AND  BUNBAN.SC_CD IN
                (SELECT SAME_SC_CD
                   FROM UNIVT.UBBASE0600
                  WHERE SC_CD  = ?
                  UNION
                 SELECT SAME_SC_CD
                   FROM UNIVT.UBBASE0600
                  WHERE SC_CD IN
                                (SELECT SAME_SC_CD
                                   FROM UNIVT.UBBASE0600
                                  WHERE SC_CD = ?)
                 UNION
                 SELECT ? FROM DUAL)
   AND  NVL(BUNBAN.CLS_CLSS_YN,'0') = '0'
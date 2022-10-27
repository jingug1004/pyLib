/* 조직코드 */
SELECT A.DEPT_CD AS CODE,
       A.DEPT_NM AS CODE_NAME1
  FROM ADMIN.AABASE0100 A
 WHERE A.DEPT_CD IN (SELECT BB.COLG_CD
                       FROM UNIVT.UBCOUR0300 AA
                          , ADMIN.AABASE0100 BB
                      WHERE AA.YY = ?
                        AND AA.TM_GBN = ?
                        AND AA.CLS_CLSS_YN IS NULL
                        AND AA.DEPT_CD = BB.DEPT_CD)
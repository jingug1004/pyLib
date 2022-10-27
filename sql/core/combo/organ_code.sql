/* 학부코드 */
SELECT '00' AS CODE,
       '전체' AS CODE_NAME
  FROM DUAL
UNION  ALL
SELECT A.DEPT_CD AS CODE,
       A.DEPT_NM AS CODE_NAME1
  FROM ADMIN.AABASE0100 A
 WHERE A.DEPT_CD IN (SELECT BB.HG_CD
                      FROM UNIVT.UBCOUR0300 AA
                         , ADMIN.AABASE0100 BB
                     WHERE AA.YY = ?
                       AND AA.TM_GBN = ?
                       AND BB.COLG_CD = ?
                       AND AA.DEPT_CD = BB.DEPT_CD
                       AND AA.CLS_CLSS_YN IS NULL)
   AND TRIM(A.MJ_TYPE_GBN) IS NULL
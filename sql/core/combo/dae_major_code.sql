/* 전공코드 */
SELECT '0'  AS CODE,
       '공통' AS CODE_NAME
  FROM DUAL
UNION ALL
SELECT A.DEPT_CD AS CODE,
       A.DEPT_NM AS CODE_NAME1
  FROM ADMIN.AABASE0100 A,
       (SELECT BB.BREU_GBN AS MAIN_CODE,
               BB.COLG_CD  AS ORGAN_CODE,
               BB.HG_CD,
               BB.MJ_CD
          FROM GRSCH.GBCOUR0300 AA
             , ADMIN.AABASE0100 BB
          WHERE AA.DEPT_CD = BB.DEPT_CD
            AND AA.YY = ?
            AND AA.TM_GBN = ?
            AND BB.BREU_GBN = ?
            AND BB.COLG_CD = ?
            AND BB.HG_CD = ?
            AND NVL(AA.CLS_CLSS_YN,'0') = '0'
          GROUP BY BB.BREU_GBN ,BB.COLG_CD,BB.HG_CD,BB.MJ_CD) B
 WHERE A.DEPT_CD = B.MJ_CD
SELECT Bunban.LT_NO||'-'||Bunban.DIVCLS_CD                             AS Haksu_No,
       Course.sc_nm                                                    AS Gwamok_Kname,
       Course.sc_eng_nm                                                AS Gwamok_Ename,
       SISA.nm                                                         AS Member_Name,
       Insa.wkgd_cd                                                    AS Jikjong_Code,
       Loc.edu_space_nm                                                AS Loc_Name,
       SISA.home_telno                                                 AS Tel_No,
       SISA.handp_no                                                   AS Hp_No,
       SISA.email                                                      AS Email,
       (SELECT COMMN.SF_CODE_NM('UB001', Bunban.CPTN_GBN) FROM DUAL)   AS Open_Name,
       Bunban.HP                                                       AS Hakjum_Num,
       Bunban.HY                                                       AS Grade,
       (SELECT COMMN.SF_CODE_NM('UB028', BUNBAN.DAYNGT_GBN) FROM DUAL) AS Day_Name,
       DECODE(BUNBAN.DEPT_CD,'20001','공통',(SELECT DEPT_NM FROM ADMIN.AABASE0100 WHERE DEPT_CD = BUNBAN.DEPT_CD)) AS CLASS_NAME,
       COUNSL.Counsel_Day_1                                            AS Counsel_Day_1,
       COUNSL.Counsel_Time_1                                           AS Counsel_Time_1,
       SUBSTR(COUNSL.Counsel_Time_1,0,2)                               AS Counsel_Hh_1,
       SUBSTR(COUNSL.Counsel_Time_1,3,2)                               AS Counsel_Mm_1,
       DECODE(COUNSL.Counsel_Day_1,NULL,NULL,
              COMMN.SF_CODE_NM('C0005', COUNSL.Counsel_Day_1)||'요일 '||
              SUBSTR(COUNSL.Counsel_Time_1,0,2)||'시 '||
              SUBSTR(COUNSL.Counsel_Time_1,3,2)||'분')                   AS Counsel_Day_Time_1,
        COUNSL.Counsel_Day_2                                            AS Counsel_Day_2,
        COUNSL.Counsel_Time_2                                           AS Counsel_Time_2,
        SUBSTR(COUNSL.Counsel_Time_2,0,2)                               AS Counsel_Hh_2,
        SUBSTR(COUNSL.Counsel_Time_2,3,2)                               AS Counsel_Mm_2,
        DECODE(COUNSL.Counsel_Day_2,NULL,NULL,
               COMMN.SF_CODE_NM('C0005', COUNSL.Counsel_Day_2)||'요일 '||
               SUBSTR(COUNSL.Counsel_Time_2,0,2)||'시 '||
               SUBSTR(COUNSL.Counsel_Time_2,3,2)||'분')                  AS Counsel_Day_Time_2,
        SUBSTR(Lect.PROF_ROOM_CD,0,2)                                   AS Building,
        SUBSTR(Lect.PROF_ROOM_CD,3,7)                                   AS Loc_Code,
        BOOK.Book_Name                                                  AS Book_Name,
        BOOK.Book_Write                                                 AS Book_Write,
        BOOK.Book_Print                                                 AS Book_Print,
        BOOK.Book_Year                                                  AS Book_Year,
        Lect.ref_data_ctnt                                              AS Chamko_Name,
        Lect.lsn_purp                                                   AS Target,
        Lect.lsn_type_gbn                                               AS Suup_Opt,
        (SELECT COMMN.SF_CODE_NM('UB006', Lect.lsn_type_gbn) FROM DUAL) AS Suup_Name,
        Lect.LSN_MTHD_NOTI_CTNT                                         AS Suup_Method,
        Lect.APPR_MTHD_ADD_NOTI_CTNT                                    AS Pyeongka_Name,
        Lect.ETC_NOTI_CTNT                                              AS Etc_Name,
        Lect.midexam_appr_rate                                          AS Score_1,
        Lect.fexam_appr_rate                                            AS Score_2,
        Lect.hwork_appr_rate                                            AS Score_3,
        Lect.attend_appr_rate                                           AS Score_4,
        Lect.etc_appr_rate                                              AS Score_9,
        replace(replace(Lect.etc_appr_mthd,'1','Y'),'0',' ')            AS Score_Kita_Opt,
        '중간고사:'||Lect.midexam_appr_rate||'%  '||'기말고사:'||Lect.fexam_appr_rate||'%  '||
        '과제물:'||Lect.hwork_appr_rate||'%  '||'출석:'||Lect.attend_appr_rate||'%  '||'기타평가:'||Lect.etc_appr_rate||'%' AS Score_Name,
        SUBSTR(replace(replace(Lect.etc_appr_mthd,'1','Y'),'0',' '),1,1) AS Score_Kita_Opt_1,
        SUBSTR(replace(replace(Lect.etc_appr_mthd,'1','Y'),'0',' '),2,1) AS Score_Kita_Opt_2,
        SUBSTR(replace(replace(Lect.etc_appr_mthd,'1','Y'),'0',' '),3,1) AS Score_Kita_Opt_3,
        SUBSTR(replace(replace(Lect.etc_appr_mthd,'1','Y'),'0',' '),4,1) AS Score_Kita_Opt_4,
        DECODE(SUBSTR(replace(replace(Lect.etc_appr_mthd,'1','Y'),'0',' '),1,1),'Y','수업(토론)참여도') AS Score_Kita_Opt_Name_1,
        DECODE(SUBSTR(replace(replace(Lect.etc_appr_mthd,'1','Y'),'0',' '),2,1),'Y','팀 또는 개인 발표')  AS Score_Kita_Opt_Name_2,
        DECODE(SUBSTR(replace(replace(Lect.etc_appr_mthd,'1','Y'),'0',' '),3,1),'Y','e클래스 활용')    AS Score_Kita_Opt_Name_3,
        DECODE(SUBSTR(replace(replace(Lect.etc_appr_mthd,'1','Y'),'0',' '),4,1),'Y','기타')         AS Score_Kita_Opt_Name_4,
        Lect.etc_appr_mthd_ctnt                                                                   AS Score_Kita_Name,
        Lect.hwork_ctnt                                                                           AS Report_Name,
        Lect.lsn_improv_ctnt                                                                      AS  Reform_Name,
        Lect.past_tm_lsn_improv_ctnt,
        Lect.mid_lsn_improv_ctnt,
        replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' ')                             AS Disabled_Opt,
        SUBSTR(replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' '),1,1)                 AS Disabled_Opt_1,
        SUBSTR(replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' '),2,1)                 AS Disabled_Opt_2,
        SUBSTR(replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' '),3,1)                 AS Disabled_Opt_3,
        SUBSTR(replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' '),4,1)                 AS Disabled_Opt_4,
        SUBSTR(replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' '),5,1)                 AS Disabled_Opt_5,
        DECODE(SUBSTR(replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' '),1,1),'Y','시험시간 연장')       AS Disabled_Opt_Name_1,
        DECODE(SUBSTR(replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' '),2,1),'Y','수업 자료(시청각) 제공') AS Disabled_Opt_Name_2,
        DECODE(SUBSTR(replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' '),3,1),'Y','학습 상담')          AS Disabled_Opt_Name_3,
        DECODE(SUBSTR(replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' '),4,1),'Y','과제 제출일 연장')      AS Disabled_Opt_Name_4,
        DECODE(SUBSTR(replace(replace(Lect.hind_std_lrn_supp_ctnt,'1','Y'),'0',' '),5,1),'Y','기타')             AS Disabled_Opt_Name_5,
        Lect.hind_std_lrn_supp_etc_ctnt                                                                        AS Disabled_Kita,
        (SELECT UNIVT.SF_UBCOUR_GET_COURTIME('AB',BUNBAN.YY,BUNBAN.TM_GBN,BUNBAN.LT_NO,BUNBAN.DIVCLS_CD) FROM DUAL) AS Loc_Time_Name,
        Note.lsn_wek_cd                                                                                             AS Suup_Jusu,
        Note.wek_clsf_lsn_ctnt                                                                                      AS Lecture,
        Note.ref_ctnt                                                                                               AS Chamko,
        Note.remark                                                                                                 AS Bigo,
       CORE.core_abty_setp_val_1,
       CORE.core_abty_setp_val_2,
       CORE.core_abty_setp_val_3,
       CORE.core_abty_setp_val_4,
       CORE.core_abty_setp_val_5,
       CORE.core_abty_setp_val_6,
       CORE.core_abty_setp_val_7,
       '인성:'||CORE.core_abty_setp_val_1||'  , 의사소통:'||CORE.core_abty_setp_val_2||'  , 문제해결:'||CORE.core_abty_setp_val_3||
       '  , 지식융복합:'||CORE.core_abty_setp_val_4||'  , 글로벌:'||CORE.core_abty_setp_val_5||'  , 개척전도:'||CORE.core_abty_setp_val_6||
       '  , 협업:'||CORE.core_abty_setp_val_7 as core_abty,
       CORE.core_abty_ctnt,
       CORE.cors_setp_val_sum,
       LECT.core_submatt_mngt_ctnt
  FROM ADMIN.AAEMPM0100 INSA,
       ADMIN.AAEMPM0110 SISA,
       ADMIN.ADROOM0100 LOC,
       UNIVT.UBCOUR0410 NOTE,
       UNIVT.UBCOUR0400 LECT,
       UNIVT.UBCOUR0100 COURSE,
       UNIVT.UBCOUR0300 BUNBAN,
       table(univt.sf_ubcour_core_val( BUNBAN.yy, BUNBAN.tm_gbn ,  BUNBAN.lt_no, BUNBAN.divcls_cd )) CORE,
       (SELECT YY
             , TM_GBN
             , LT_NO
             , DIVCLS_CD
             , MAX(DECODE(RNK, 1, COUNSL_POSB_DAY_GBN, '')) AS COUNSEL_DAY_1
             , MAX(DECODE(RNK, 2, COUNSL_POSB_DAY_GBN, '')) AS COUNSEL_DAY_2
             , MAX(DECODE(RNK, 1, COUNSL_POSB_FR_HOUR, '')) AS COUNSEL_TIME_1
             , MAX(DECODE(RNK, 2, COUNSL_POSB_FR_HOUR, '')) AS COUNSEL_TIME_2
          FROM (SELECT YY
                     , TM_GBN
                     , LT_NO
                     , DIVCLS_CD
                     , ROW_NUMBER() OVER(PARTITION BY YY, TM_GBN, LT_NO, DIVCLS_CD ORDER BY COUNSL_POSB_DAY_GBN) AS RNK
                     , COUNSL_POSB_DAY_GBN
                     , COUNSL_POSB_FR_HOUR
                  FROM UNIVT.UBCOUR0430
                 WHERE YY        = ?
                   AND TM_GBN    = ?
                   AND LT_NO     = ?
                   AND DIVCLS_CD = ?)
         GROUP BY YY, TM_GBN, LT_NO, DIVCLS_CD) COUNSL,
       (SELECT YY
             , TM_GBN
             , LT_NO
             , DIVCLS_CD
             , MAX(DECODE(RNK, 1, TEACHM_NM, '')) AS BOOK_NAME
             , MAX(DECODE(RNK, 1, AUTH_NM, ''))   AS BOOK_WRITE
             , MAX(DECODE(RNK, 1, PUBCO_NM, ''))  AS BOOK_PRINT
             , MAX(DECODE(RNK, 1, PUBLSH_YY, '')) AS BOOK_YEAR
          FROM (SELECT YY
                     , TM_GBN
                     , LT_NO
                     , DIVCLS_CD
                     , ROW_NUMBER() OVER(PARTITION BY YY, TM_GBN, LT_NO, DIVCLS_CD ORDER BY TEACHM_GBN, SEQ) AS RNK
                     , TEACHM_NM
                     , AUTH_NM
                     , PUBCO_NM
                     , PUBLSH_YY
                  FROM UNIVT.UBCOUR0420
                 WHERE YY        = ?
                   AND TM_GBN    = ?
                   AND LT_NO     = ?
                   AND DIVCLS_CD = ?)
         GROUP BY YY, TM_GBN, LT_NO, DIVCLS_CD) BOOK
 WHERE BUNBAN.YY        = ?
   AND BUNBAN.TM_GBN    = ?
   AND BUNBAN.LT_NO     = ?
   AND BUNBAN.DIVCLS_CD = ?
   AND BUNBAN.CLS_CLSS_YN IS NULL
   AND BUNBAN.SC_CD     = COURSE.SC_CD
   AND BUNBAN.YY        = LECT.YY(+)
   AND BUNBAN.TM_GBN    = LECT.TM_GBN(+)
   AND BUNBAN.LT_NO     = LECT.LT_NO(+)
   AND BUNBAN.DIVCLS_CD = LECT.DIVCLS_CD(+)
   AND LECT.YY        = COUNSL.YY(+)
   AND LECT.TM_GBN    = COUNSL.TM_GBN(+)
   AND LECT.LT_NO     = COUNSL.LT_NO(+)
   AND LECT.DIVCLS_CD = COUNSL.DIVCLS_CD(+)
   AND BUNBAN.YY        = CORE.YY(+)
   AND BUNBAN.TM_GBN    = CORE.TM_GBN(+)
   AND BUNBAN.LT_NO     = CORE.LT_NO(+)
   AND BUNBAN.DIVCLS_CD = CORE.DIVCLS_CD(+)
   AND LECT.YY        = BOOK.YY(+)
   AND LECT.TM_GBN    = BOOK.TM_GBN(+)
   AND LECT.LT_NO     = BOOK.LT_NO(+)
   AND LECT.DIVCLS_CD = BOOK.DIVCLS_CD(+)
   AND BUNBAN.YY        = NOTE.YY(+)
   AND BUNBAN.TM_GBN    = NOTE.TM_GBN(+)
   AND BUNBAN.LT_NO     = NOTE.LT_NO(+)
   AND BUNBAN.DIVCLS_CD = NOTE.DIVCLS_CD(+)
   AND BUNBAN.MNGT_PROF_EMP_NO = INSA.EMP_NO(+)
   AND INSA.EMP_PERS_NO        = SISA.EMP_PERS_NO(+)
   AND LECT.PROF_ROOM_CD       = LOC.EDU_SPACE_CD(+)
ORDER  BY BUNBAN.SC_CD, BUNBAN.DIVCLS_CD, NOTE.LSN_WEK_CD
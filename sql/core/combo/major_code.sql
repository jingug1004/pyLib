/* 세부전공코드 */
select rtrim(substr(code,6,1)) code,
            code_name1
   from author.cavmajor
where code like ?||?||?||'%'
and disuse_date is null
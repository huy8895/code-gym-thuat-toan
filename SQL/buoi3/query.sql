use cgt_b3_qlnv;

with recursive dp
                   as (select id from t_department)
select *
from t_department
         join dp
              on dp.id = t_department.parentId
where dp.id = 1;

WITH RECURSIVE tmp (id, name, parentId) AS
                   (
                       SELECT id, name, parentId
                       FROM t_department
                       WHERE parentId = 78
                       UNION all
                       SELECT l.id, l.name, l.parentId
                       FROM tmp AS p
                                JOIN t_department AS l
                                     ON p.id = l.parentId
                   )
SELECT *
FROM tmp
ORDER BY id;

# lay danh sach nhan vien cua phong ban va cac phong banon

select d.id as departmentID, e.name
from t_department d,
     t_employee e
where d.id = e.departmentId;

WITH RECURSIVE tmp (id, name, parentId) AS
                   (
                       SELECT id, name, parentId
                       FROM t_department
                       WHERE id = 78
                       UNION all
                       SELECT l.id, l.name, l.parentId
                       FROM tmp AS p
                                JOIN t_department AS l
                                     ON p.id = l.parentId
                   )
SELECT tmp.id as departmentID, e.id as employeeID
FROM tmp
         join t_employee as e
              on tmp.id = e.departmentId;

# lay thong tin lich su dieu chinh luong cua tat ca nhan vien cua phong ban khi biet id cua 1 nhan vien

WITH RECURSIVE tmp (id, name, parentId) AS
                   (
                       SELECT id, name, parentId
                       FROM t_department
                       WHERE id = (select departmentId
                                   from t_employee
                                   where t_employee.id = 7)
                       UNION all
                       SELECT l.id, l.name, l.parentId
                       FROM tmp AS p
                                JOIN t_department AS l
                                     ON p.id = l.parentId
                   )
SELECT tmp.id as departmentID, e.id as employeeID
FROM tmp
         join t_employee as e
              on tmp.id = e.departmentId;
create view V_SO_CompletedTasks_prod as 
select app.appointment_id, 
       app.associate_id, 
       app.done,
       app.task_idx,
       app.text_id,
       ass.name as UserName,
       task.deleted,
       task.name as TaskName,
       txt.text
from SuperOffice_prod.crm7.APPOINTMENT as app
       left outer join
         SuperOffice_prod.crm7.ASSOCIATE as ass on (ass.associate_id = app.associate_id)
       left outer join
         SuperOffice_prod.crm7.TASK as task on (task.Task_id = app.task_idx)
       left outer join
         SuperOffice_prod.crm7.TEXT as txt on (txt.text_id = app.text_id)
where task.deleted = 0 and
--      Year(app.done) = 2016 and Month(app.done) = 2 and
      app.associate_id > 0 
--      and
--      ass.name like 'se%'
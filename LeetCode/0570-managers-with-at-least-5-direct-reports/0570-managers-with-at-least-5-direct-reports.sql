select m.name
from employee e
    join employee m ON e.managerid = m.id
group by e.managerid
having count(*) >=5
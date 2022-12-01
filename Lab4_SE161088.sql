
--1.	Cho biết ai đang quản lý phòng ban có tên: Phòng Nghiên cứu và phát triển. 
--Thông tin yêu cầu: mã số,họ tên nhân viên, mã số phòng ban, tên phòng ban
select emp.empSSN as N'Mã nhân viên', emp.empName as N'Tên nhân viên', dept.depNum as N'Mã phòng ban', dept.depName as N'Tên phòng ban'
from tblDepartment dept
inner join tblEmployee emp
on dept.mgrSSN = emp.empSSN
where dept.depName = N'Phòng Nghiên cứu và phát triển'
--2.	Cho phòng ban có tên: Phòng Nghiên cứu và phát triển hiện đang quản lý dự án nào. 
--Thông tin yêu cầu: mã số dụ án, tên dự án, tên phòng ban quản lý
select pro.proNum as N'Mã số dự án', pro.proName as N'Tên dự án', dept.depName as N'Tên phòng ban quản lý'
from tblDepartment dept
left join tblProject pro
on dept.depNum = pro.depNum
where dept.depName = N'Phòng Nghiên cứu và phát triển'
--3.	Cho biết dự án có tên ProjectB hiện đang được quản lý bởi phòng ban nào. 
--Thông tin yêu cầu: mã số dụ án, tên dự án, tên phòng ban quản lý
select pro.proNum as N'Mã số dự án', pro.proName as N'Tên dự án', dept.depName as N'Tên phòng ban quản lý'
from tblDepartment dept
inner join tblProject pro
on dept.depNum = pro.depNum
where pro.proName = N'ProjectB'
--4.	Cho biết những nhân viên nào đang bị giám sát bởi nhân viên có tên Mai Duy An. 
--Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên
select emp1.empSSN as N'Mã số nhân viên', emp1.empName as N'Họ tên nhân viên'
from tblEmployee emp
inner join tblEmployee emp1
on emp.empSSN = emp1.supervisorSSN
where emp.empName = N'Mai Duy An'
--5.	Cho biết ai hiện đang giám sát những nhân viên có tên Mai Duy An. 
--Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên giám sát.
select emp.empSSN as N'Mã số nhân viên', emp.empName as N'Họ tên nhân viên giám sát'
from tblEmployee emp
inner join tblEmployee emp1
on emp.empSSN = emp1.supervisorSSN
where emp1.empName = N'Mai Duy An'
--6.	Cho biết dự án có tên ProjectA hiện đang làm việc ở đâu. 
--Thông tin yêu cầu: mã số, tên vị trí làm việc.
select loc.locNum as N'Mã số', loc.locName as N'Tên vị trí làm việc'
from tblProject pro
inner join tblLocation loc
on pro.locNum = loc.locNum
where pro.proName = N'ProjectA'
--7.	Cho biết vị trí làm việc có tên Tp. HCM hiện đang là chỗ làm việc của những dự án nào. 
--Thông tin yêu cầu: mã số, tên dự án
select pro.proNum as N'Mã số dự án', pro.proName as N'Tên dự án'
from tblProject pro
inner join tblLocation loc
on pro.locNum = loc.locNum
where loc.locName = N'Tp Hồ Chí Minh'
--8.	Cho biết những người phụ thuộc trên 18 tuổi .
--Thông tin yêu cầu: tên, ngày tháng năm sinh của người phụ thuộc, tên nhân viên phụ thuộc vào.
select dep.depName as N'Tên', dep.depBirthdate as N'Ngày tháng năm sinh' , emp.empName as N'Tên nhân viên phụ thuộc vào'
from tblEmployee emp
inner join tblDependent dep
on emp.empSSN = dep.empSSN
where Year(GETDATE())-Year(dep.depBirthdate) > 18
--9.	Cho biết những người phụ thuộc  là nam giới. 
--Thông tin yêu cầu: tên, ngày tháng năm sinh của người phụ thuộc, tên nhân viên phụ thuộc vào 
select dep.depName as N'Tên', dep.depBirthdate as N'Ngày tháng năm sinh' , emp.empName as N'Tên nhân viên phụ thuộc vào'
from tblEmployee emp
inner join tblDependent dep
on emp.empSSN = dep.empSSN
where dep.depSex = N'M'
--10.	Cho biết những nơi làm việc của phòng ban có tên : Phòng Nghiên cứu và phát triển. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, tên nơi làm việc.
select dept.depNum as N'Mã phòng ban', dept.depName as N'Tên phòng ban', loc.locName as N'Tên nơi làm việc'
from tblDepartment dept
inner join tblDepLocation deploc
on dept.depNum = deploc.depNum
inner join tblLocation loc
on deploc.locNum = loc.locNum
where dept.depName = N'Phòng Nghiên cứu và phát triển'
--11.	Cho biết các dự án làm việc tại Tp. HCM. 
--Thông tin yêu cầu: mã dự án, tên dự án, tên phòng ban chịu trách nhiệm dự án.
select pro.proNum as N'Mã dự án', pro.proName as N'Tên dự án', dept.depName as 'Tên phòng ban chịu trách nhiệm dự án'
from tblProject pro
inner join tblLocation loc
on pro.locNum = loc.locNum
inner join tblDepartment dept
on pro.depNum = dept.depNum
where loc.locName = N'TP Hồ Chí Minh'
--12.	Cho biết những người phụ thuộc là nữ giới, của nhân viên thuộc phòng ban có tên: Phòng Nghiên cứu và phát triển . 
--Thông tin yêu cầu: tên nhân viên, tên người phụ thuộc, mối liên hệ giữa người phụ thuộc với nhân viên
select  emp.empName as N'Tên nhân viên',dep.depName as N'Tên người phụ thuộc', dep.depRelationship as N'Mối liên hệ giữa người phụ thuộc với nhân viên' 
from tblEmployee emp
inner join tblDependent dep
on emp.empSSN = dep.empSSN
inner join tblDepartment dept
on emp.depNum = dept.depNum
where dep.depSex = N'F' and dept.depName = N'Phòng Nghiên cứu và phát triển'
--13.	Cho biết những người phụ thuộc trên 18 tuổi, của nhân viên thuộc phòng ban có tên: Phòng Nghiên cứu và phát triển. 
--Thông tin yêu cầu: tên nhân viên, tên người phụ thuộc, mối liên hệ giữa người phụ thuộc với nhân viên
select  emp.empName as N'Tên nhân viên',dep.depName as N'Tên người phụ thuộc', dep.depRelationship as N'Mối liên hệ giữa người phụ thuộc với nhân viên' 
from tblEmployee emp
inner join tblDependent dep
on emp.empSSN = dep.empSSN
inner join tblDepartment dept
on emp.depNum = dept.depNum
where Year(GETDATE())-Year(dep.depBirthdate) > 18 and dept.depName = N'Phòng Nghiên cứu và phát triển'
--14.	Cho biết số lượng người phụ thuộc theo giới tính. 
--Thông tin yêu cầu: giới tính, số lượng người phụ thuộc
select depSex as N'Giới tính',count(empSSN) as N'Số lượng người phụ thuộc'
from tblDependent
group by depSex
--15.	Cho biết số lượng người phụ thuộc theo mối liên hệ với nhân viên. 
--Thông tin yêu cầu: mối liên hệ, số lượng người phụ thuộc
select depRelationship as N'Mối liên hệ',count(empSSN) as N'Số lượng người phụ thuộc'
from tblDependent
group by depRelationship
--16.	Cho biết số lượng người phụ thuộc theo mỗi phòng ban. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc  
select dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban',count(dep.empSSN) as N'Số lượng người phụ thuộc'
from tblDepartment dept
inner join tblEmployee emp
on dept.depNum = emp.depNum
inner join tblDependent dep
on emp.empSSN = dep.empSSN
group by dept.depNum, dept.depName
--17.	Cho biết phòng ban nào có số lượng người phụ thuộc là ít nhất. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc
select top (1) with ties dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban',count(dep.empSSN) as N'Số lượng người phụ thuộc'
from tblDepartment dept
inner join tblEmployee emp
on dept.depNum = emp.depNum
inner join tblDependent dep
on emp.empSSN = dep.empSSN
group by dept.depNum, dept.depName
order by count(emp.empSSN) asc
--18.	Cho biết phòng ban nào có số lượng người phụ thuộc là nhiều nhất. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc
select top (1) with ties dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban',count(dep.empSSN) as N'Số lượng người phụ thuộc'
from tblDepartment dept
inner join tblEmployee emp
on dept.depNum = emp.depNum
inner join tblDependent dep
on emp.empSSN = dep.empSSN
group by dept.depNum, dept.depName
order by count(emp.empSSN) desc
--19.	Cho biết tổng số giờ tham gia dự án của mỗi nhân viên.
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên
select  emp.empSSN as N'Mã nhân viên',  emp.empName as N'Tên nhân viên',dept.depName as N'Tên phòng ban' , sum(wo.workHours) as N'Tổng số giờ tham gia dự án'
from  tblDepartment dept, tblWorksOn wo
right join tblEmployee emp
on (wo.empSSN = emp.empSSN) 
where dept.depNum = emp.depNum
group by emp.empName,emp.empSSN, dept.depName
--20.	Cho biết tổng số giờ làm dự án của mỗi phòng ban. 
--Thông tin yêu cầu: mã phòng ban,  tên phòng ban, tổng số giờ
select dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban' , sum(wo.workHours) as N'Tổng số giờ tham gia dự án'
from  tblDepartment dept, tblWorksOn wo
right join tblEmployee emp
on (wo.empSSN = emp.empSSN) 
where dept.depNum = emp.depNum
group by dept.depNum, dept.depName
--21.	Cho biết nhân viên nào có số giờ tham gia dự án là ít nhất. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tổng số giờ tham gia dự án
select top (1) with ties emp.empSSN as N'Mã nhân viên',  emp.empName as N'Tên nhân viên' , sum(wo.workHours)as N'Tổng số giờ tham gia dự án'
from   tblWorksOn wo
inner join tblEmployee emp
on (wo.empSSN = emp.empSSN) 
group by emp.empName,emp.empSSN
order by sum(wo.workHours)
--22.	Cho biết nhân viên nào có số giờ tham gia dự án là nhiều nhất. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tổng số giờ tham gia dự án
select top (1) with ties emp.empSSN as N'Mã nhân viên',  emp.empName as N'Tên nhân viên' , sum(wo.workHours)as N'Tổng số giờ tham gia dự án'
from   tblWorksOn wo
inner join tblEmployee emp
on (wo.empSSN = emp.empSSN) 
group by emp.empName,emp.empSSN
order by sum(wo.workHours) desc
--23.	Cho biết những nhân viên nào lần đầu tiên tham gia dụ án. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên
select emp.empSSN as N'Mã nhân viên', emp.empName as N'Tên nhân viên', dept.depName as N'Tên phòng ban'
from tblWorksOn wor
inner join tblEmployee emp on wor.empSSN = emp.empSSN
inner join tblDepartment dept on dept.depNum = emp.depNum
group by emp.empSSN,emp.empName,dept.depName
having count(wor.empSSN) = 1  
--24.	Cho biết những nhân viên nào lần thứ hai tham gia dụ án. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên
select emp.empSSN as N'Mã nhân viên', emp.empName as N'Tên nhân viên', dept.depName as N'Tên phòng ban'
from tblWorksOn wor
inner join tblEmployee emp on wor.empSSN = emp.empSSN
inner join tblDepartment dept on dept.depNum = emp.depNum
group by emp.empSSN,emp.empName,dept.depName
having count(wor.empSSN) = 2  
--25.	Cho biết những nhân viên nào tham gia tối thiểu hai dụ án. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên
select emp.empSSN as N'Mã nhân viên', emp.empName as N'Tên nhân viên', dept.depName as N'Tên phòng ban'
from tblWorksOn wor
inner join tblEmployee emp on wor.empSSN = emp.empSSN
inner join tblDepartment dept on dept.depNum = emp.depNum
group by emp.empSSN,emp.empName,dept.depName
having count(wor.empSSN) >= 2  
--26.	Cho biết số lượng thành viên của mỗi dự án. 
--Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên
select wo.proNum as N'Mã dự án', pro.proName N'Tên dự án', count(wo.empSSN) as N'Số lượng thành viên'
from   tblWorksOn wo 
left join tblProject pro
on wo.proNum = pro.proNum
group by  wo.proNum, pro.proName
--27.	Cho biết tổng số giờ làm của mỗi dự án. 
--Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm
select wo.proNum as N'Mã dự án', pro.proName N'Tên dự án', sum(wo.workHours) as N'Tổng số giờ làm'
from   tblWorksOn wo 
left join tblProject pro
on wo.proNum = pro.proNum
group by  wo.proNum, pro.proName
--28.	Cho biết dự án nào có số lượng thành viên là ít nhất. 
--Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên
select top (1) with ties  wo.proNum as N'Mã dự án', pro.proName N'Tên dự án', count(wo.empSSN) as N'Số lượng thành viên'
from tblProject pro
inner join tblWorksOn wo
on pro.proNum = wo.proNum
group by  wo.proNum, pro.proName
order by count(wo.empSSN)
--29.	Cho biết dự án nào có số lượng thành viên là nhiều nhất. 
--Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên
select top (1) with ties  wo.proNum as N'Mã dự án', pro.proName N'Tên dự án', count(wo.empSSN) as N'Số lượng thành viên'
from tblProject pro
inner join tblWorksOn wo
on pro.proNum = wo.proNum
group by  wo.proNum, pro.proName
order by count(wo.empSSN) desc
--30.	Cho biết dự án nào có tổng số giờ làm là ít nhất. 
--Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm
select  top (1) with ties wo.proNum as N'Mã dự án', pro.proName N'Tên dự án', sum(wo.workHours) as N'Tổng số giờ làm'
from   tblWorksOn wo 
left join tblProject pro
on wo.proNum = pro.proNum
group by  wo.proNum, pro.proName
order by  sum(wo.workHours)
--31.	Cho biết dự án nào có tổng số giờ làm là nhiều nhất. 
--Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm
select  top (1) with ties wo.proNum as N'Mã dự án', pro.proName N'Tên dự án', sum(wo.workHours) as N'Tổng số giờ làm'
from   tblWorksOn wo 
left join tblProject pro
on wo.proNum = pro.proNum
group by  wo.proNum, pro.proName
order by  sum(wo.workHours) desc
--32.	Cho biết số lượng phòng ban làm việc theo mỗi nơi làm việc. 
--Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban
select loc.locName as N'Nơi làm việc', count(dept.depName) as N'Số lượng phòng ban'
from tblDepartment dept
inner join tblDepLocation deploc
on dept.depNum = deploc.depNum
inner join tblLocation loc
on deploc.locNum = loc.locNum
group by loc.locName
--33.	Cho biết số lượng chỗ làm việc theo mỗi phòng ban. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc
select dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban', count(deploc.locNum) as N'Số lượng chỗ làm việc'
from tblDepartment dept
inner join tblDepLocation deploc
on dept.depNum = deploc.depNum
group by dept.depNum,dept.depName
--34.	Cho biết phòng ban nào có nhiều chỗ làm việc nhất.
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc
select top (1) with ties dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban', count(deploc.locNum) as N'Số lượng chỗ làm việc'
from tblDepartment dept
inner join tblDepLocation deploc
on dept.depNum = deploc.depNum
group by dept.depNum,dept.depName
order by count(deploc.locNum) desc
--35.	Cho biết phòng ban nào có it chỗ làm việc nhất.
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc
select top (1) with ties dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban', count(deploc.locNum) as N'Số lượng chỗ làm việc'
from tblDepartment dept
inner join tblDepLocation deploc
on dept.depNum = deploc.depNum
group by dept.depNum,dept.depName
order by count(deploc.locNum) asc
--36.	Cho biết địa điểm nào có nhiều phòng ban làm việc nhất. 
--Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban
select top (1) with ties loc.locName as N'Nơi làm việc', count(dept.depName) as N'Số lượng phòng ban'
from tblDepartment dept
inner join tblDepLocation deploc
on dept.depNum = deploc.depNum
inner join tblLocation loc
on deploc.locNum = loc.locNum
group by loc.locName
order by count(dept.depName) desc
--37.	Cho biết địa điểm nào có ít phòng ban làm việc nhất. 
--Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban
select top (1) with ties loc.locName as N'Nơi làm việc', count(dept.depName) as N'Số lượng phòng ban'
from tblDepartment dept
inner join tblDepLocation deploc
on dept.depNum = deploc.depNum
inner join tblLocation loc
on deploc.locNum = loc.locNum
group by loc.locName
order by count(dept.depName) asc
--38.	Cho biết nhân viên nào có nhiều người phụ thuộc nhất. 
--Thông tin yêu cầu: mã số, họ tên nhân viên, số lượng người phụ thuộc
select top (1) with ties emp.empSSN as N'Mã số', emp.empName as N'Họ tên nhân viên', count(dep.empSSN) as N'Số lượng người phụ thuộc'
from tblEmployee emp
inner join tblDependent dep
on emp.empSSN = dep.empSSN
group by emp.empSSN, emp.empName
order by count(dep.empSSN) desc
--39.	Cho biết nhân viên nào có ít người phụ thuộc nhất. 
--Thông tin yêu cầu: mã số, họ tên nhân viên, số lượng người phụ thuộc
select top (1) with ties emp.empSSN as N'Mã số', emp.empName as N'Họ tên nhân viên', count(emp.empSSN) as N'Số lượng người phụ thuộc'
from tblEmployee emp
inner join tblDependent dep
on emp.empSSN = dep.empSSN
group by emp.empSSN, emp.empName
order by count(dep.empSSN) asc
--40.	Cho biết nhân viên nào không có người phụ thuộc. 
--Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên, tên phòng ban của nhân viên
select emp.empSSN as N'Mã nhân viên', emp.empName as N'Tên nhân viên', dept.depName as N'Tên phòng ban'
from  tblEmployee emp
inner join tblDepartment dept
on emp.depNum = dept.depNum
where emp.empSSN not in (select tblDependent.empSSN from tblDependent)
--41.	Cho biết phòng ban nào không có người phụ thuộc. 
--Thông tin yêu cầu: mã số phòng ban, tên phòng ban
select dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban'
from tblDepartment dept
inner join tblEmployee emp
on dept.depNum = emp.depNum
left join tblDependent dep
on emp.empSSN = dep.empSSN
group by dept.depNum, dept.depName
having count (dep.empSSN) = 0
--42.	Cho biết những nhân viên nào chưa hề tham gia vào bất kỳ dự án nào. 
--Thông tin yêu cầu: mã số, tên nhân viên, tên phòng ban của nhân viên
select  emp.empSSN as N'Mã nhân viên',  emp.empName as N'Tên nhân viên', dept.depName as N'Tên phòng ban'
from   tblDepartment dept
inner join tblEmployee emp
on dept.depNum = emp.depNum
where emp.empSSN not in (select tblWorksOn.empSSN from tblWorksOn)
--43.	Cho biết phòng ban không có nhân viên nào tham gia (bất kỳ) dự án. 
--Thông tin yêu cầu: mã số phòng ban, tên phòng ban
select  dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban'
from tblDepartment dept
left join tblEmployee emp
on dept.depNum = emp.depNum
left join tblWorksOn wor
on wor.empSSN = emp.empSSN 
group by  dept.depNum,dept.depName
having count(wor.workHours)  = 0
--44.	Cho biết phòng ban không có nhân viên nào tham gia vào dự án có tên là ProjectA. 
--Thông tin yêu cầu: mã số phòng ban, tên phòng ban
select  dept.depNum as N'Mã số phòng ban', dept.depName as N'Tên phòng ban'
from tblDepartment dept
except
select  dept.depNum as N'Mã số phòng ban', dept.depName as N'Tên phòng ban'
from tblDepartment dept
inner join tblEmployee emp
on emp.depNum = dept.depNum
inner join tblWorksOn wor
on emp.empSSN = wor.empSSN
inner join tblProject pro
on wor.proNum = pro.proNum
where pro.proName = N'ProjectA'
--45.	Cho biết số lượng dự án được quản lý theo mỗi phòng ban. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng dự án
select dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban', count(pro.proNum) as N'Số lượng dự án'
from tblDepartment dept
left join tblProject pro
on dept.depNum = pro.depNum
group by dept.depNum, dept.depName
--46.	Cho biết phòng ban nào quản lý it dự án nhất. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng dự án
select top (1) with ties dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban', count(pro.proNum) as N'Số lượng dự án'
from tblDepartment dept
inner join tblProject pro
on dept.depNum = pro.depNum
group by dept.depNum, dept.depName
order by count(pro.proNum) 
--47.	Cho biết phòng ban nào quản lý nhiều dự án nhất. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng dự án
select top (1) with ties dept.depNum as N'Mã phòng ban',dept.depName as N'Tên phòng ban', count(pro.proNum) as N'Số lượng dự án'
from tblDepartment dept
inner join tblProject pro
on dept.depNum = pro.depNum
group by dept.depNum, dept.depName
order by count(pro.proNum) desc
--48.	Cho biết những phòng ban nào có nhiểu hơn 5 nhân viên đang quản lý dự án gì. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng nhân viên của phòng ban, tên dự án quản lý
select dept.depNum as N'Mã phòng ban', dept.depName as N'Tên phòng ban', count (distinct emp.empSSN) as N'Số lượng nhân viên của phòng ban', pro.proName as N'Tên dự án quản lý '
from tblEmployee emp
left join  tblDepartment dept
on emp.depNum = dept.depNum
left join tblProject pro
on pro.depNum = dept.depNum
group by  dept.depName, pro.proName,dept.depNum
having count(distinct emp.empSSN) > 5

--49.	Cho biết những nhân viên thuộc phòng có tên là Phòng nghiên cứu, và không có người phụ thuộc. 
--Thông tin yêu cầu: mã nhân viên,họ tên nhân viên 
select emp.empSSN as N'Mã số nhân viên', emp.empName as N'Họ tên nhân viên'
from tblEmployee emp
inner join tblDepartment dept
on emp.depNum = dept.depNum
where dept.depName = N'Phòng Nghiên cứu và phát triển' and emp.empSSN not in (select tblDependent.empSSN from tblDependent)
--50.	Cho biết tổng số giờ làm của các nhân viên, mà các nhân viên này không có người phụ thuộc. 
--Thông tin yêu cầu: mã nhân viên,họ tên nhân viên, tổng số giờ làm
select emp.empSSN as N'Mã số nhân viên', emp.empName as N'Họ tên nhân viên', sum(wor.workHours) as N'Tổng số giờ làm'
from tblEmployee emp
inner join tblWorksOn wor
on emp.empSSN = wor.empSSN
where emp.empSSN not in (select tblDependent.empSSN from tblDependent)
group by  emp.empSSN, emp.empName
--51.	Cho biết tổng số giờ làm của các nhân viên, mà các nhân viên này có nhiều hơn 3 người phụ thuộc. 
--Thông tin yêu cầu: mã nhân viên,họ tên nhân viên, số lượng người phụ thuộc, tổng số giờ làm
select emp.empSSN as N'Mã số nhân viên', emp.empName as N'Họ tên nhân viên',sum(wor.workHours) as 'Tổng số giờ làm'
from tblEmployee emp
left join tblWorksOn wor
on emp.empSSN = wor.empSSN
right join  tblDependent dep
on dep.empSSN = emp.empSSN
group by emp.empSSN, emp.empName
having count(distinct dep.empSSN) > 3
--52.	Cho biết tổng số giờ làm việc của các nhân viên hiện đang dưới quyền giám sát (bị quản lý bởi) của nhân viên Mai Duy An. 
--Thông tin yêu cầu: mã nhân viên, họ tên nhân viên, tổng số giờ làm
select emp1.empSSN as N'Mã số nhân viên', emp1.empName as N'Họ tên nhân viên', sum(wor.workHours) as N'Tổng số giờ làm'
from tblEmployee emp
left join tblWorksOn wor
on emp.empSSN = wor.empSSN
left join tblEmployee emp1
on emp.empSSN = emp1.supervisorSSN
where emp.empName = N'Mai Duy An'
group by  emp1.empSSN, emp1.empName








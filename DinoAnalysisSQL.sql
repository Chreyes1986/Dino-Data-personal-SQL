-- Dinosaur Count --

Select
	Count(*) as DinosaurCount
From dinodata;

-- Dinosaurs discovered per Region -- 

Select
	Count(name) as CountPerRegion,
    lived_in
From
	dinodata
GROUP BY 
	lived_in
ORDER BY 
	Count(name) Desc;
    
-- Dinosaur count per diet --

Select
	Count(name) as CountPerDiet,
    diet
From
	dinodata
Group by 
	diet
Order by 
	Count(name) Desc;

-- Species diet per Region --

Select
	Count(diet) as DietPerRegion,
    diet,
    lived_in
From
	dinodata
GROUP BY 
	lived_in, diet
Order By 
	Count(diet) Desc;
    
-- Biggest per Type -- I had to change the Data Type on length from Text to Decimal, then moved the new column to where the old one was and deleted the extra column --

Select
	DISTINCT Type,
    Max(Size) as MaxSize,
    name
    
From
	dinodata
Where
	Size <> 'N/A'
Group by
	Type
Order by
	Max(size)desc ;
    
/*    

Alter Table dinodata
Add Column Size Decimal (3,1);
    
Update dinodata
set Size = SUBSTRING(length, 1, locate('m', length)-1)
Where length <> 'N/A'

ALTER TABLE dinodata
CHANGE Size Size Decimal(3,1) AFTER type;
   
ALTER TABLE dinodata
Drop Column length;

*/

-- Count per Type
    
Select
	type,
    count(type) TypeCount
From
	dinodata
GROUP BY type;


-- Count by period using Partition By --

With dd_cte as (
Select
	name,
    period,
    count(period) over (PARTITION BY period ) as CountbyPeriod
From
	dinodata)
Select
	name,
    period,
    CountbyPeriod
From
	dd_cte
ORDER BY 
	CountbyPeriod desc


	
DELIMITER $$

DROP FUNCTION IF EXISTS checkRegion;
CREATE FUNCTION checkRegion(Ax1 FLOAT(4,3), Ay1 FLOAT(4,3), Ax2 FLOAT(4,3), Ay2 FLOAT(4,3), Bx1 FLOAT(4,3), By1 FLOAT(4,3), Bx2 FLOAT(4,3), By2 FLOAT(4,3))
RETURNS BOOL
BEGIN 
	IF Bx1 > Ax2 OR By1 > Ay2 OR Ax1 > Bx2 OR Ay1 > By2 THEN
		RETURN FALSE;
	ELSE 
		RETURN TRUE;
	END IF;
END $$

DELIMITER ;






DELIMITER $$

DROP FUNCTION IF EXISTS regionOverlap;
CREATE FUNCTION regionOverlap(A VARCHAR(255), B VARCHAR(255))
RETURNS BOOL
BEGIN
	RETURN EXISTS (SELECT r1.series_id, r2.series_id 
		   FROM region AS r1, region AS r2 WHERE checkRegion(r1.x1, r1.y1, r1.x2, r1.y2, r2.x1, r2.y1, r2.x2, r2.y2) AND r1.series_id = A AND r2.series_id = B);

	   
END $$

DELIMITER ;
